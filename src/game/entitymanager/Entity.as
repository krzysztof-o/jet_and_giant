package game.entitymanager
{
	import flash.geom.Point;
    import game.Global;

    import game.entities.strategies.DefaultMovingStrategy;
	import game.entities.strategies.IMovingStrategy;

	public class Entity
    {
        protected var entityManager:EntityManager = EntityManager.getInstance();

        public var movingStrategy:IMovingStrategy;

        public var hull:BodySprite;

        private var _position:Point = new Point();
        private var _rotation:Number = 0;

        public function set position(value:Point):void
        {
            _position = value;
        }

        public function get position():Point
        {
            return _position;
        }

        public function set rotation(value:Number):void
        {
            _rotation = value;
        }

        public function get rotation():Number
        {
            return _rotation;
        }

        public function Entity()
        {
            hull = new BodySprite();
        }

        public function dispose():void
        {
            entityManager = null;
            movingStrategy = null;

            hull = null;
            this.position = null;
            this.rotation = 0;

            Global.bombPool.returnObject(this);
        }

        public function update(timer: Number): void
        {
            movingStrategy.update(timer);

            hull.x = _position.x;
            hull.y = _position.y;
			hull.rotation = rotation;
        }

        public function add():void
        {
            entityManager.add(this);
        }

        public function onAdd():void
        {
            movingStrategy ||= new DefaultMovingStrategy(this);
        }

        public function remove():void
        {
            entityManager.remove(this);
        }

        public function onRemove():void
        {
            movingStrategy.dispose();
        }
    }
}
