/**
 * Created with IntelliJ IDEA.
 * User: grzegorz-przybylowic
 * Date: 29.11.12
 * Time: 15:06
 * To change this template use File | Settings | File Templates.
 */
package game.weapon
{
	import avmplus.factoryXml;

	import game.weapon.bullet.Bullet;

	import utlis.log;

	public class Weapon
	{
		protected var loadingTime:int;
		protected var shootTimeInterval:int;

        public function Weapon()
		{
			loadingTime = 0;
			shootTimeInterval = 10;
        }

		public function load(time:int):void
		{
			loadingTime += time;
			log(time);
		}


		public function get isLoaded():Boolean
		{
			return loadingTime >=  shootTimeInterval;
		}

		public function shoot(x:int,  y:int) :void
		{
			loadingTime = 0;
			shootTimeInterval = Math.random()*1000 + 1600;

			var bullet:Bullet = new Bullet();
			bullet.add();
			bullet.hull.x = x;
			bullet.hull.y = y;
		}
	}
}
