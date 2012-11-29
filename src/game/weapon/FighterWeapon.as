/**
 * Created with IntelliJ IDEA.
 * User: grzegorz-przybylowic
 * Date: 29.11.12
 * Time: 18:25
 * To change this template use File | Settings | File Templates.
 */
package game.weapon
{
	import game.weapon.bullet.Bullet;
	import game.weapon.bullet.FighterBullet;

	public class FighterWeapon extends Weapon
	{
		public function FighterWeapon()
		{
		}

		override  public function shoot(x: Number, y: Number) : void
		{
			var bullet:Bullet = createBullet();
 			bullet.add();
			bullet.position.x = x;
			bullet.position.y = y;
		}

		protected function  createBullet():Bullet
		{
			var bullet:Bullet = new FighterBullet();
			bullet.deltaX = -0.6;
			return bullet;
		}
	}
}
