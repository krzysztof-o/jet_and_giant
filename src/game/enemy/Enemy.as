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
			position.x = enemVO.startX;
			position.y = enemVO.startY;
			hull.addChild(Assets.getImage("symbol_special_scatter_1"));

			weapon = new Weapon();
		}

        override public function dispose():void
        {
            enemVO = null;
            weapon = null;

            super.dispose();
        }

		override public function update(timer: Number): void
		{
			super.update(timer);

			weapon.load(timer);

			if(weapon.isLoaded)
			{
				weapon.shoot(hull.x,  hull.y);
			}
		}
	}
}
