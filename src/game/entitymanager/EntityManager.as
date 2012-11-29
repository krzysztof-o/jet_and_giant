package game.entitymanager
{
    import flash.utils.getTimer;

    import starling.display.DisplayObjectContainer;
    import starling.events.Event;

    public class EntityManager
    {
        private var entities:Vector.<Entity> = new Vector.<Entity>();

        private static var instance:EntityManager;
        private var root:DisplayObjectContainer;

        public function EntityManager()
        {
            if (instance)
                throw new Error("this is Singleton, you fool!");
        }

        public static function getInstance():EntityManager
        {
            instance ||= new EntityManager();
            return instance;
        }

        public function add(entity:Entity):void
        {
            entity.onAdd();
            entities.push(entity);
            root.addChild(entity);
        }

        public function onEnterFrame():void
        {
            for (var i:uint = 0; i < entities.length; i++)
            {
                entities[0].update(getTimer());
            }
        }

        public function remove(entity:Entity):void
        {
            entity.onRemove();
            entities.slice(entities.indexOf(entity), 1);
            entity.removeFromParent();
        }

        public function init(root:DisplayObjectContainer):void
        {
            this.root = root;
            root.addEventListener(Event.ENTER_FRAME, onEnterFrame);
        }
    }
}
