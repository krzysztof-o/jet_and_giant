package game.entitymanager
{
	import flash.globalization.DateTimeFormatter;
    import flash.utils.getQualifiedClassName;
    import flash.utils.getTimer;
    import game.scene.Scene;

    import starling.core.Starling;
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

				if(entity.position.x + entity.hull.width < 0 || entity.position.x > Starling.current.stage.stageWidth + 50
                        || entity.position.y + entity.hull.height < 0 || entity.position.y > Starling.current.stage.stageHeight + 50
                        )
				{
					remove(entity);
					i--;
				}
            }
        }


        public function remove(entity:Entity):void
        {
            //log("remove", getQualifiedClassName(entity));
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
