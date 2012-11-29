package game.entitymanager
{
    import Box2D.Collision.Shapes.b2CircleShape;
    import Box2D.Collision.Shapes.b2Shape;
    import Box2D.Common.Math.b2Vec2;
    import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2FixtureDef;
    import game.scene.Scene;
    import starling.display.Sprite;
	
	public class BodySprite extends Sprite 
	{
		private var _body:b2Body;
		public var bodyDef:b2BodyDef;
		protected var shape:b2Shape;
		
		public var friction:Number = 1;
		public var density:Number = 1;
		public var restitution:Number = 1;
		public var linearDamping:Number = 0;
		public var angularDamping:Number = 0;
		public var type:uint = b2Body.b2_dynamicBody;

        private var _active:Boolean = true;
		
		public function get body():b2Body
		{
			return _body;
		}

        public function set active(value:Boolean):void
        {
            _active = value;
        }

        public function get active():Boolean
        {
            return _active;
        }
		
		public function set body(value:b2Body):void
		{
			_body = value;
			var fixture:b2FixtureDef = new b2FixtureDef();
			fixture.shape = shape;
			fixture.friction = friction;
			fixture.density = density;
			fixture.restitution = restitution;
			_body.CreateFixture(fixture);
		}		
		
		public function BodySprite() 
		{
			bodyDef = new b2BodyDef();
			bodyDef.type = type;
			bodyDef.linearDamping = linearDamping;
			bodyDef.angularDamping = angularDamping;

            shape = new b2CircleShape(45 / Scene.worldScale);
		}
		
		public function update(timer:int):void
		{
            if(!active)
            {
                x = body.GetPosition().x * Scene.worldScale;
			    y = body.GetPosition().y * Scene.worldScale;
			    rotation = body.GetAngle();
            }
            else
            {
                body.SetPosition(new b2Vec2(x, y));
                body.SetAngle(rotation);
            }
		}
	}

}