package game.entity
{
    import starling.display.Sprite;

    public class Entity extends Sprite
    {
        protected var entityManager:EntityManager = EntityManager.getInstance();

        public function Entity()
        {
        }

        public function update():void
        {

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
