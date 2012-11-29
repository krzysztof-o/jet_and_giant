package game.entities
{
    import game.Global;
    import game.weapon.Weapon;
    import game.weapon.bullet.Bullet;

    import utlis.log;

    public class GroundWeapon extends Weapon
    {
        private var sprite:GroundEnemySprite;

        public function GroundWeapon(sprite:GroundEnemySprite)
        {
            this.sprite = sprite;
            super();
            setNewTimeInterval();
        }

        override public function shoot(x:Number, y:Number):void
        {
            loadingTime = 0;
            var bullet:Bullet = createBullet();

            bullet.add();
            bullet.position.x = x  + 30;
            bullet.position.y = y - 20;
            setNewTimeInterval();
        }

        private function setNewTimeInterval():void
        {
            shootTimeInterval = Math.random() * 500 + Math.random() * 600;
            sprite.nextMove(shootTimeInterval / 1000);
        }

        protected function createBullet():Bullet
        {
            var bullet:GroundBullet = Global.groundBulletPool.borrowObject();
            var angle:Number = sprite.getNextGunRotation() + Math.PI / 2;
            bullet.setRotation(angle - Math.PI);

            bullet.deltaX = 1 * Math.cos(angle);
            bullet.deltaY = 1 * Math.sin(angle);
            return bullet;
        }

    }
}
