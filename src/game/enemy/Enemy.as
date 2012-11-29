package game.enemy
{
    import game.Global;
    import game.entities.strategies.EnemyMovingStrategy;
    import game.entitymanager.Entity;
    import game.weapon.EnemyWeapon;
    import game.weapon.Weapon;

    import starling.core.Starling;

    public class Enemy extends Entity
    {
        protected var enemVO:EnemyVO;
        protected var weapon:Weapon;
        private var vo:EnemyVO;

        public function Enemy()
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

        public function setVO(enemyVO:EnemyVO):void
        {
            vo = enemyVO;
            position.x = Starling.current.stage.stageWidth;
            position.y = enemyVO.y;
        }
    }
}
