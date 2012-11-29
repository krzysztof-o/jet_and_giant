package game.entities.strategies
{
    import game.enemy.Enemy;

    public class EnemyMovingStrategy implements IMovingStrategy
    {
        protected var enemy:Enemy;

        public function EnemyMovingStrategy(enemy:Enemy)
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
