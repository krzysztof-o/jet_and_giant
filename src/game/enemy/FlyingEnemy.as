package game.enemy
{
    import game.Global;
    import game.entities.EnemyBase;
    import game.entities.strategies.EnemyMovingStrategy;
    import game.weapon.EnemyWeapon;
    import game.weapon.Weapon;


    public class FlyingEnemy extends EnemyBase
    {
        protected var enemVO:EnemyVO;
        protected var weapon:Weapon;

        public function FlyingEnemy()
        {
            super();
            hull.addChild(Assets.getImage("symbol_special_scatter_1"));

            weapon = new EnemyWeapon();

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

    }
}
