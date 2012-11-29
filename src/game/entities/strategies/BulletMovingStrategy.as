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
			bullet.position.x -= bullet.deltaX *dt;
			bullet.position.y -= bullet.deltaY *dt;
		}

		public function dispose():void
		{
			bullet = null;
		}
	}
}
