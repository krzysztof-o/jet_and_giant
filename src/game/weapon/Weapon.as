/**
 * Created with IntelliJ IDEA.
 * User: grzegorz-przybylowic
 * Date: 29.11.12
 * Time: 18:19
 * To change this template use File | Settings | File Templates.
 */
package game.weapon
{
	import game.weapon.bullet.Bullet;

	import utlis.log;

	import avmplus.factoryXml;

    import game.Global;

    import game.weapon.bullet.Bullet;

	public class Weapon
	{
		protected var loadingTime:Number;
		protected var shootTimeInterval:Number;

		public function Weapon()
		{
		}

        public function dispose():void
        {
            loadingTime = 0;
            shootTimeInterval = 0;

            super.dispose();
        }

		public function load(dt:Number):void
		{
		}


		public function get isLoaded():Boolean
		{
			return true;
		}

		public function shoot(x: Number, y: Number) : void
		{

		}
	}
}
