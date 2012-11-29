package game.entities
{
    import game.Global;
    import game.weapon.bullet.Bullet;

    public class GroundBullet extends Bullet
    {
        public function GroundBullet()
        {
            super();
        }

        override public function dispose():void
        {
            Global.fighterBulletPool.returnObject(this);
            super.dispose();
        }
    }
}
