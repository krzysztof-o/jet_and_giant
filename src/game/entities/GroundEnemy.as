package game.entities
{
    import game.entities.strategies.GroundEnemyMovingStrategy;
    import game.enemy.BoomAnimation;
    import game.entities.strategies.GroundEnemyMovingStrategy;
    import game.Global;
    import game.enemy.EnemyVO;
    import game.entities.strategies.GroundEnemyMovingStrategy;
	import game.SocketManager;
	import game.entities.strategies.GroundEnemyMovingStrategy;

	import utlis.log;

	public class GroundEnemy extends EnemyBase
    {
        private var weapon:GroundWeapon;
        private var sprite:GroundEnemySprite;

        public function GroundEnemy()
        {
            super();

            sprite = new GroundEnemySprite(this);
            hull.addChild(sprite);

            movingStrategy = new GroundEnemyMovingStrategy(this);

            weapon = new GroundWeapon(sprite);
        }

        override public function update(timer:Number):void
        {
            weapon.load(timer);
            if (weapon.isLoaded)
            {
                weapon.shoot(position.x, position.y);
            }

            super.update(timer);
        }

        override public function dispose():void
        {
            sprite.dispose();
            sprite = null;
            super.dispose();
        }

        public function setData(data:Object):void
        {
//            position.x = data.x;
//            position.y = data.y;
            sprite.setNextRotation(data.time, data.r);
            weapon.shootTimeInterval = data.time - Global.currentTime;
        }
		override public function detonate(fromServer:Boolean = false): void
		{

			if(!fromServer)
			{
				SocketManager.getInstance().send(Message.GROUND_ENEMY_DETONATE, {id:vo.id})
			}
			new BoomAnimation(position.x,  position.y);
            new BoomAnimation(position.x,  position.y);
			remove();
    	}
        override public function setVO(enemyVO:EnemyVO):void
        {
            super.setVO(enemyVO);
            weapon.setNewTimeInterval();
		}
	}
}
