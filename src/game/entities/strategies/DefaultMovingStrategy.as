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
            entity.x += 4;
            entity.y = 200;
        }
    }
}
