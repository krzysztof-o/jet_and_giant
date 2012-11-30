package game.weapon
{
    import game.Global;
    import game.SocketManager;
    import game.enemy.FlyingEnemy;
    import game.entities.Message;
    import game.weapon.bullet.Bullet;

    import utlis.ClientType;
    import utlis.log;

    public class EnemyWeapon extends Weapon
    {
        private var enemy:FlyingEnemy;

        public function EnemyWeapon(enemy:FlyingEnemy)
        {
            this.enemy = enemy;
            loadingTime = 0;

        }

        override public function shoot(x:Number, y:Number):void
        {
            getNext();

            var bullet:Bullet = new Bullet();
            bullet.add();
            bullet.position.x = x + bullet.hull.width / 2;
            bullet.position.y = y - 20;
        }

        override public function getNext():void
        {
            loadingTime = 0;
            shootTimeInterval = -1;
            if (ClientType.DESKTOP)
            {
                shootTimeInterval = 200 + Math.random() * 500 + Math.random() * 600;
                log("SEND FLYING ENEMY SHOOT");
                SocketManager.getInstance().send(Message.FLYING_ENEMY_SHOOT, {time: Global.currentTime + shootTimeInterval,id: enemy.vo.id, x: enemy.position.x, y: enemy.position.y});
            }
        }

        public function setData(data:Object):void
        {
            shootTimeInterval = data.time - Global.currentTime;
        }
    }
}
