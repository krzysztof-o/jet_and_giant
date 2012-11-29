package game.weapon
{
	import game.weapon.bullet.Bullet;

	public class EnemyWeapon extends Weapon
	{

        public function EnemyWeapon()
		{
			loadingTime = 0;
			shootTimeInterval = 30;
        }

		override public function shoot(x: Number, y: Number) : void
		{
			loadingTime = 0;
			shootTimeInterval = Math.random()*500 +  Math.random()*600;

			var bullet:Bullet = new Bullet();
			bullet.add();
			bullet.position.x = x + bullet.hull.width/2;
			bullet.position.y = y - 20;
		}
	}
}
