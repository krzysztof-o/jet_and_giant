/**
 * Created with IntelliJ IDEA.
 * User: grzegorz-przybylowic
 * Date: 29.11.12
 * Time: 15:06
 * To change this template use File | Settings | File Templates.
 */
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
			bullet.position.x = x;
			bullet.position.y = y;
		}
	}
}