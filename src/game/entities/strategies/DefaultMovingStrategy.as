package game.entities.strategies
{
    import game.entitymanager.Entity;

    public class DefaultMovingStrategy implements IMovingStrategy
    {
        private var entity:Entity;

        public function DefaultMovingStrategy(entity:Entity)
        {
            this.entity = entity;
        }

        public function update(timer:int):void
        {
            entity.hull.x += 4;
            entity.hull.y = 200;
        }
    }
}
