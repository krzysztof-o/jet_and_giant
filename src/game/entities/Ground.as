package game.entities
{
	import Box2D.Dynamics.b2Body;

	import game.entitymanager.Entity;

	import starling.display.Quad;

	public class Ground extends Entity
	{
		public function Ground()
		{
			var quad:Quad = new Quad(2000, 50, 0x123456);
			quad.alpha = 0.0;

			hull.type = b2Body.b2_staticBody;
			position.y = 690;
			position.x = 500;
			hull.x = position.x;
			hull.y = position.y;
			hull.density = 0;

			hull.addChild(quad);
			hull.active = false;
		}
	}
}
