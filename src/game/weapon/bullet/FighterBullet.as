/**
 * Created with IntelliJ IDEA.
 * User: grzegorz-przybylowic
 * Date: 29.11.12
 * Time: 18:21
 * To change this template use File | Settings | File Templates.
 */
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
			Global.fighterBullerPool.returnObject(this);
			super.dispose();
		}
	}
}