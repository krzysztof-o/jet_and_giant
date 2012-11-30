package game.entities.strategies
{
    import game.entities.GroundEnemy;

    public class GroundEnemyMovingStrategy implements IMovingStrategy
    {
        private var enemy:GroundEnemy;

        public function GroundEnemyMovingStrategy(enemy:GroundEnemy)
        {
            this.enemy = enemy;
        }

        public function update(timer:Number):void
        {
            enemy.position.y = 780;
            enemy.position.x -= 3;
        }

        public function dispose():void
        {
            enemy = null;
        }
    }
}
