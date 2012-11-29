package game.entities
{
    import game.Global;
    import game.weapon.Weapon;
    import game.weapon.bullet.Bullet;

    public class GroundWeapon extends Weapon
    {
        public function GroundWeapon()
        {
            super();
            shootTimeInterval = 1000;
        }

        override public function shoot(x:Number, y:Number):void
        {
            loadingTime = 0;
            shootTimeInterval = Math.random()*500 +  Math.random()*600;

            var bullet:Bullet = createBullet();
            bullet.add();
            bullet.position.x = x - bullet.hull.width;
            bullet.position.y = y - bullet.hull.height;
        }

        protected function createBullet():Bullet
        {
            var bullet:GroundBullet = Global.groundBulletPool.borrowObject();
            bullet.deltaX = (Math.random() > .5 ? 1 : -1 )* Math.random()/2;
            bullet.deltaY = 0.6;
            return bullet;
        }

    }
}
