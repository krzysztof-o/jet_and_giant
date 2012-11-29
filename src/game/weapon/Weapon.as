package game.weapon
{
    import game.Global;

    import game.weapon.bullet.Bullet;

	public class Weapon
	{
		protected var loadingTime:Number;
		protected var shootTimeInterval:Number;

        public function Weapon()
		{
			loadingTime = 0;
			shootTimeInterval = 500;
        }

        public function dispose():void
        {
            loadingTime = 0;
            shootTimeInterval = 0;

            super.dispose();
        }

		public function load(dt:Number):void
		{
			loadingTime += dt;
		}


		public function get isLoaded():Boolean
		{
			return loadingTime >= shootTimeInterval;
		}

		public function shoot(x:Number,  y:Number) :void
		{
			loadingTime = 0;
			shootTimeInterval = Math.random()*500 +  Math.random()*600;

			var bullet:Bullet = Global.bulletPool.borrowObject();
			bullet.add();
			bullet.position.x = x;
			bullet.position.y = y;
            bullet = null;
		}
    }
}
