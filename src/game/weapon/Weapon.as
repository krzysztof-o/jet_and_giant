package game.weapon
{
    import game.Global;

    import game.weapon.bullet.Bullet;

	public class Weapon
	{
		protected var loadingTime:Number;
		public var shootTimeInterval:Number;

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
            if(shootTimeInterval == -1) return false;
			return loadingTime >= shootTimeInterval;
		}

		public function shoot(x:Number,  y:Number) :void
		{
            getNext();
            var bullet:Bullet = Global.bulletPool.borrowObject();
			bullet.add();
			bullet.position.x = x;
			bullet.position.y = y;
            bullet = null;
		}

        public function getNext():void
        {
            loadingTime = 0;
            shootTimeInterval = Math.random() * 500 + Math.random() * 600;
        }
    }
}
