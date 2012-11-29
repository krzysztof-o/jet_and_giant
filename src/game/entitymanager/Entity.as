package game.entitymanager
{
import flash.display.Sprite;

import game.entities.strategies.DefaultMovingStrategy;
    import game.entities.strategies.IMovingStrategy;

    public class Entity
    {
        protected var entityManager:EntityManager = EntityManager.getInstance();

        protected var movingStrategy:IMovingStrategy;

        public var hull:BodySprite;

        public function Entity()
        {
            movingStrategy = new DefaultMovingStrategy(this);
            hull = new BodySprite();
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
