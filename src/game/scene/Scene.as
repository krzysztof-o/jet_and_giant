package game.scene
{
	import Box2D.Collision.b2AABB;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2World;
    import flash.geom.Point;
    import game.entitymanager.BodySprite;
    import starling.display.DisplayObject;
    import starling.display.Sprite;
    import starling.events.EnterFrameEvent;
	import starling.events.Event;

	public class Scene extends Sprite
	{
		protected var world:b2World;
		private var dt:Number;
		public static var worldScale:Number = 100;
		public static var displayScale:Number = 1;
		public static var displayOffset:Point = new Point();
		
		public function Scene(width:Number, height:Number):void
		{
			world = new b2World(new b2Vec2(0, 10), true);
			addEventListener(EnterFrameEvent.ENTER_FRAME, onFrame);
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		protected function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		protected function onFrame(e:EnterFrameEvent):void
		{
			world.Step(e.passedTime, 10, 10);
			world.ClearForces();
			
			scaleX = Scene.displayScale;
			scaleY = Scene.displayScale;
			
			x = displayOffset.x;
			y = displayOffset.y;
			
			for (var i:int = 0; i < numChildren; i++)
			{
				var child:DisplayObject = getChildAt(i);
				if (child is BodySprite)
				{
					(child as BodySprite).update(e.passedTime);
				}
			}
		}
		
		override public function addChild(child:DisplayObject):DisplayObject
		{
			super.addChild(child);
			if (child is BodySprite)
			{
				(child as BodySprite).body = world.CreateBody((child as BodySprite).bodyDef);
			}
            return child;
		}
	}

}