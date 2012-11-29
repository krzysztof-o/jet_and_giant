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
	import game.weapon.Weapon;

	public class Enemy  extends  Entity
	{
		protected var enemVO:EnemyVO;
		protected var weapon:Weapon;

		public function Enemy(vo:EnemyVO)
		{
			super();
			enemVO = vo;
			hull.x = enemVO.startX;
			hull.y = enemVO.startY;
			hull.addChild(Assets.getImage("symbol_special_scatter_1"));

			weapon = new Weapon();
		}

		override public function update(time:int):void
		{
			super.update(time);

			weapon.load(time);

			if(weapon.isLoaded)
			{
				weapon.shoot(hull.x,  hull.y);
			}
		}
	}
}
