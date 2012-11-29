package game.entitymanager
{
    import game.entities.strategies.DefaultMovingStrategy;
    import game.entities.strategies.IMovingStrategy;

    import starling.display.Sprite;

    public class Entity extends Sprite
    {
        protected var entityManager:EntityManager = EntityManager.getInstance();

        protected var movingStrategy:IMovingStrategy;

        public function Entity()
        {
            movingStrategy = new DefaultMovingStrategy(this);
        }

        public function update(timer:int):void
        {
            movingStrategy.update(timer);
        }

        public function add():void
        {
            entityManager.add(this);
        }

        public function onAdd():void
        {

        }

        public function remove():void
        {
            entityManager.remove(this);
        }

        public function onRemove():void
        {

        }
    }
}
