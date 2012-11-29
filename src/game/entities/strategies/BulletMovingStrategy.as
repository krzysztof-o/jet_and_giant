/**
 * Created with IntelliJ IDEA.
 * User: grzegorz-przybylowic
 * Date: 29.11.12
 * Time: 15:20
 * To change this template use File | Settings | File Templates.
 */
package game.entities.strategies
{
	import game.weapon.bullet.*;
	import game.entities.strategies.IMovingStrategy;

	public class BulletMovingStrategy implements IMovingStrategy
	{
		protected var bullet:Bullet
		public function BulletMovingStrategy(bullet: Bullet)
		{
			this.bullet = bullet;
		}

		public function update(time:int):void
		{
			bullet.hull.x -= 10;
		}

		public function dispose():void
		{
			bullet = null;
		}
	}
}
