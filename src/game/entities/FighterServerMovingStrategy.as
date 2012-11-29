package game.entities
{
    import game.entities.strategies.IMovingStrategy;

    public class FighterServerMovingStrategy implements IMovingStrategy
    {
        private var entity:Fighter;
        private var dx:Number = 0;
        private var dy:Number = 0;

        public function FighterServerMovingStrategy(entity:Fighter)
        {
            this.entity = entity;
        }

        public function setPosition(x:Number, y:Number):void
        {
            this.dx = x;
            this.dy = y;
        }

        public function update(timer:int):void
        {
            entity.position.x += (dx - entity.position.x) / 10;
            entity.position.y += (dy - entity.position.y) / 10;
        }

        public function dispose():void
        {
        }
    }
}
