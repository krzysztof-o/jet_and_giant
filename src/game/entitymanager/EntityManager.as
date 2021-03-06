package game.entitymanager
{
	import flash.globalization.DateTimeFormatter;
	import flash.utils.getTimer;
    import game.scene.Scene;
    import starling.events.Event;

	import utlis.log;

	public class EntityManager
    {
        private var entities:Vector.<Entity> = new Vector.<Entity>();

        private static var instance:EntityManager;
        private var scene:Scene;

		private  var lastTime:Number;

        public function EntityManager()
        {
            if (instance)
			{
				throw new Error("this is Singleton, you fool!");
			}
			lastTime = new Date().time;
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
			var date:Date = new Date();
			var dt:Number = date.time - lastTime;
			lastTime = date.time;
            for (var i:uint = 0; i < entities.length; i++)
            {
				entity =  entities[i];
				entity.update(dt);

				if(entity.position.x < 0)
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
