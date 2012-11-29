/**
 * Created with IntelliJ IDEA.
 * User: grzegorz-przybylowic
 * Date: 29.11.12
 * Time: 15:16
 * To change this template use File | Settings | File Templates.
 */
package game.weapon.bullet
{
    import game.Global;
    import game.entities.strategies.BulletMovingStrategy;
	import game.entitymanager.Entity;

	import starling.display.Quad;
	import starling.events.Event;
	import starling.utils.Color;

	public class Bullet extends Entity
	{
		public var deltaX:Number;
		public var deltaY:Number;

		public function Bullet()
		{
			deltaX = 0.5;
			deltaY = 0;
			hull.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage)
			movingStrategy = new BulletMovingStrategy(this);
		}

		protected function onAddedToStage(event: Event): void
		{
			hull.addChild(new Quad(20,20,Color.FUCHSIA));
		}

        override public function dispose():void
        {
            Global.bulletPool.returnObject(this);
            super.dispose();
        }
    }
}
