package game.entities.strategies
{
    import game.enemy.FlyingEnemy;

    public class EnemyMovingStrategy implements IMovingStrategy
    {
        protected var enemy:FlyingEnemy;

        public function EnemyMovingStrategy(enemy:FlyingEnemy)
        {
            this.enemy = enemy;
        }

        public function update(timer:Number):void
        {
            enemy.position.x -= 5;
        }


        public function dispose():void
        {

        }
    }
}
