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

	public class BulletMovingStrategy implements IMovingStrategy
	{
		protected var bullet:Bullet
		public function BulletMovingStrategy(bullet: Bullet)
		{
			this.bullet = bullet;
		}

		public function update(dt: Number): void
		{
			bullet.position.x -= 0.5*dt;
		}

		public function dispose():void
		{
			bullet = null;
		}
	}
}
