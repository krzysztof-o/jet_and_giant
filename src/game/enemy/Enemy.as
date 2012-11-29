/**
 * Created with IntelliJ IDEA.
 * User: grzegorz-przybylowic
 * Date: 29.11.12
 * Time: 12:31
 * To change this template use File | Settings | File Templates.
 */
package game.enemy
{
	import game.entitymanager.Entity;

	public class Enemy  extends  Entity
	{
		public function Enemy()
		{
			super();
			addChild(Assets.getImage("symbol_special_scatter_1"));
		}


	}
}
