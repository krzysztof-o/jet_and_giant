package game.enemy
{
	import game.Global;
	import game.SocketManager;

	import game.entities.EnemyBase;
	import game.entities.Message;

	import game.entities.strategies.EnemyMovingStrategy;
    import game.weapon.EnemyWeapon;



	public class FlyingEnemy extends EnemyBase
    {
        protected var enemVO:EnemyVO;
        protected var weapon:EnemyWeapon;

        public function FlyingEnemy()
        {
            super();

            hull.addChild(Assets.getImage("ship_enemy_full"));

            weapon = new EnemyWeapon(this);

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
                weapon.shoot(hull.x, hull.bounds.bottom);
            }
        }


        public function setData(data:Object):void
        {
            weapon.setData(data);
        }

        override public function setVO(enemyVO:EnemyVO):void
        {
            super.setVO(enemyVO);
            weapon.getNext();
		}

		override public function detonate(fromServer:Boolean = false): void
		{
			if(!fromServer)
			{
				SocketManager.getInstance().send(Message.FLYING_ENEMY_DETONATE, {id: vo.id});
			}
			remove();
		}
	}
}
