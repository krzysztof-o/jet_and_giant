package game.entities.strategies
{
    import game.entitymanager.Entity;

    public class BombMovingStrategy implements IMovingStrategy
    {
        private var entity:Entity;
        private var dx:int;

        public function BombMovingStrategy(entity:Entity)
        {
            this.entity = entity;
            dx = 1;
        }

        public function update(timer:Number):void
        {
            entity.position.y += 5;
            entity.position.x -= dx;
            dx *= 1.3;
        }

        public function dispose():void
        {
        }
    }
}
