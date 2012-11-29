package game.entitymanager
{
    import game.Global;
    import game.enemy.EnemyVO;
    import game.entities.EnemyBase;

    import utlis.log;

    public class EnemiesManager extends Entity
    {
        private var enemies:Vector.<EnemyVO> = new Vector.<EnemyVO>();

        public function EnemiesManager()
        {
        }

        public function setEnemies(data:Array):void
        {
            for each(var enemy:Object in data)
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
        }

        override public function update(timer:Number):void
        {
            //log("enemies", enemies.length);
            for (var i:uint = 0; i < enemies.length; i++)
            {
                if (Global.timeWithCorrection > enemies[i].time * 100)
                {
                    createEnemy(enemies[i]);
                    enemies.splice(i, 1);
                    i--;
                }
                else
                {
                    break;
                }
            }
        }

        private function createEnemy(vo:EnemyVO):void
        {
            var enemy:EnemyBase;
            switch (vo.asset)
            {
                case EnemyAssetType.FLYING_1:
                case EnemyAssetType.FLYING_2:
                    enemy = Global.enemiesPool.borrowObject();
                    break;
                case EnemyAssetType.GROUND_1:
                case EnemyAssetType.GROUND_2:
                case EnemyAssetType.GROUND_3:
                    enemy = Global.groundEnemiesPool.borrowObject();
                    break;
            }

            enemy.setVO(vo);
            enemy.add();
        }
    }
}
