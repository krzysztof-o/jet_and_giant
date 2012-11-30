package game.entities
{
	import game.entitymanager.Entity;

	import starling.core.Starling;

	import starling.display.MovieClip;

	public class Explosion extends Entity
	{
		public function Explosion()
		{
			var movieClip:MovieClip = new MovieClip(Assets.getTextures("fx_particle_crash_"), 15);
			Starling.current.juggler.add(movieClip);
			hull.addChild(movieClip);
			movieClip.play();
		}
	}
}
