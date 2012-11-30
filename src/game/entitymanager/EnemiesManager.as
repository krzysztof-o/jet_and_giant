package game.entitymanager
{
    import flash.utils.Dictionary;

    import game.Global;
    import game.SocketManager;
    import game.enemy.EnemyVO;
    import game.entities.EnemyBase;
    import game.entities.GroundEnemy;
    import game.entities.Message;

    import utlis.ClientType;
    import utlis.log;

    public class EnemiesManager extends Entity
    {
        private var enemies:Vector.<EnemyVO> = new Vector.<EnemyVO>();
        public var enemiesById:Dictionary = new Dictionary();
        public var _data:Array;
        private var uniqueId:int = 1;

        public function EnemiesManager()
        {
        }

        public function refreshData():void
        {
            setEnemies(_data);
        }

        public function setEnemies(data:Array, offset:Number = 0):void
        {

        }

        override public function update(timer:Number):void
        {
            if (ClientType.DESKTOP && Math.random() < .01)
            {
                log("SENDING NEW ENEMY");
                var e:Object = randomEnemy();
                SocketManager.getInstance().send(Message.NEW_ENEMY, e);
                addEnemy(e)
            }
            //log("enemies", enemies.length);
            for (var i:uint = 0; i < enemies.length; i++)
            {
                //log(Global.currentTime - Global.clientServerTimeDifference, Global.serverTime, Number(enemies[i].time));
                if (Global.currentTime >Number(enemies[i].time))
                {
                    createEnemy(enemies[i]);
                    enemies.splice(i, 1);
                    i--;
                }
                else
                {
                    //break;
                }
            }

//            if(enemies.length == 0)
            {
                //setEnemies(_data);
            }
        }

        public function addEnemy(enemy:Object):void
        {
            var vo:EnemyVO = new EnemyVO();
            vo.id = enemy.id;
            vo.energy = enemy.energy;
            vo.time = enemy.time;
            vo.type = enemy.type;
            vo.y = enemy.y;
            vo.asset = enemy.asset;

            enemies.push(vo);
        }

        private function randomEnemy():Object
        {
            return {
                id: uniqueId++,
                asset: Math.random() > .5 ? 1 : 2,
                type: 1,
                energy: 100,
                y: int(Math.random() * 400),
                time: Global.currentTime + 1000 + Math.random() * 1000
            };
        }

        private function createEnemy(vo:EnemyVO):void
        {
            var enemy:EnemyBase;
            switch (vo.asset)
            {
                case EnemyAssetType.FLYING_1:
                    enemy = Global.enemiesPool.borrowObject();
                    break;
                case EnemyAssetType.GROUND_1:
                    enemy = Global.groundEnemiesPool.borrowObject();
                    break;
            }

            enemy.setVO(vo);
            enemy.add();
        }

        public function getEnemyById(id:Number):EnemyBase
        {
            return enemiesById[id];
        }
    }
}
