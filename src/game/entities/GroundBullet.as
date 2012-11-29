package game.entities
{
    import game.Global;
    import game.weapon.bullet.Bullet;

    import starling.display.Image;

    import starling.events.Event;

    public class GroundBullet extends Bullet
    {
        private var bullet:Image;
        public function GroundBullet()
        {
            super();
            bullet = Assets.getImage("fx_particle_bullett");
            hull.addChild(bullet);
        }

        override protected function onAddedToStage(event:Event):void
        {
        }

        override public function dispose():void
        {
            Global.fighterBulletPool.returnObject(this);
            super.dispose();
        }

        public function setRotation(rotation:Number):void
        {
            bullet.rotation = rotation;
        }
    }
}
