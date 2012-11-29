package game.weapon.bullet
{
	import game.Global;

	public class FighterBullet extends Bullet
	{
		public function FighterBullet()
		{
			 super();
		}

		override public function dispose():void
		{
			Global.fighterBulletPool.returnObject(this);
			super.dispose();
		}
	}
}
