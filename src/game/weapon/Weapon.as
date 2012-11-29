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

    import game.Global;

    import game.weapon.bullet.Bullet;

	import utlis.log;

	public class Weapon
	{
		protected var loadingTime:Number;
		protected var shootTimeInterval:Number;

        public function Weapon()
		{
			loadingTime = 0;
			shootTimeInterval = 30;
        }

		public function load(dt:Number):void
		{
			loadingTime += dt;
		}


		public function get isLoaded():Boolean
		{
			return loadingTime >=  shootTimeInterval;
		}

		public function shoot(x:int,  y:int) :void
		{
			loadingTime = 0;
			shootTimeInterval = Math.random()*500 +  Math.random()*600;

			var bullet:Bullet = Global.bulletPool.borrowObject();
			bullet.add();
			bullet.position.x = x;
			bullet.position.y = y;
		}
	}
}
