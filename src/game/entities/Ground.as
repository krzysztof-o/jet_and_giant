package game.entities
{
	import game.entitymanager.Entity;

	import starling.display.Quad;

	public class Ground extends Entity
	{
		public function Ground()
		{
			var quad:Quad = new Quad(1280, 50, 0x123456);
			quad.alpha = 0.5;
			quad.y = 670;
			hull.addChild(quad);
			hull.active = true;
		}
	}
}
