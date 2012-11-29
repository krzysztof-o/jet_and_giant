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
	import game.entitymanager.Entity;
	import game.weapon.EnemyWeapon;
    import game.Global;
    import game.entities.strategies.EnemyMovingStrategy;
    import game.entitymanager.Entity;
    import game.weapon.Weapon;

    import starling.core.Starling;

    public class Enemy extends Entity
    {
        protected var enemVO:EnemyVO;
        protected var weapon:Weapon;
        private var vo:EnemyVO;

	public class Enemy  extends  Entity
	{
		protected var enemVO:EnemyVO;
		protected var weapon:EnemyWeapon;
        public function Enemy()
        {
            super();
            hull.addChild(Assets.getImage("symbol_special_scatter_1"));

            weapon = new Weapon();

			weapon = new Weapon();
		}
			weapon = new EnemyWeapon();
		}
            movingStrategy = new EnemyMovingStrategy(this);
        }

        override public function dispose():void
        {
            enemVO = null;
            weapon.dispose();
            weapon = null;

            Global.enemiesPool.returnObject(this);
            super.dispose();
        }

        override public function update(timer:Number):void
        {
            super.update(timer);

            weapon.load(timer);

            if (weapon.isLoaded)
            {
                weapon.shoot(hull.x, hull.y);
            }
        }

			if(weapon.isLoaded)
			{
				weapon.shoot(hull.x,  hull.y);
			}
		}
	}
			if(weapon.isLoaded)
			{
				weapon.shoot(hull.x, hull.y);
			}
		}
	}
        public function setVO(enemyVO:EnemyVO):void
        {
            vo = enemyVO;
            position.x = Starling.current.stage.stageWidth;
            position.y = enemyVO.y;
        }
    }
}
