package game.entitymanager
{
    import flash.utils.getTimer;
    import game.scene.Scene;
    import starling.events.Event;

	import utlis.log;

	public class EntityManager
    {
        private var entities:Vector.<Entity> = new Vector.<Entity>();

        private static var instance:EntityManager;
        private var scene:Scene;

        public function EntityManager()
        {
            if (instance)
			{
				throw new Error("this is Singleton, you fool!");
			}
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
            scene.addChild(entity.hull);
        }

        public function onEnterFrame():void
        {
			var entity:Entity;

            for (var i:uint = 0; i < entities.length; i++)
            {
                entities[i].update();
				entity =  entities[i];
				entity.update(new Date().time);

				if(entity.hull.bounds.right < 0)
				{
					remove(entity);
					i--;
				}
            }
        }


        public function remove(entity:Entity):void
        {
            entity.onRemove();
            entities.splice(entities.indexOf(entity), 1);
            entity.hull.removeFromParent(true);
        }

        public function init(root:Scene):void
        {
            this.scene = root;
            scene.addEventListener(Event.ENTER_FRAME, onEnterFrame);
        }
    }
}
