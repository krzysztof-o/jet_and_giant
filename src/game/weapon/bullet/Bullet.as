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
	import starling.utils.Color;

	public class Bullet extends Entity
	{
		public function Bullet()
		{
			movingStrategy = new BulletMovingStrategy(this);
			hull.addChild(new Quad(20,20,Color.FUCHSIA));
			hull.active = false;
		}

        override public function dispose():void
        {
            Global.bulletPool.returnObject(this);
            super.dispose();
        }
    }
}
