/**
 * Created with IntelliJ IDEA.
 * User: grzegorz-przybylowic
 * Date: 29.11.12
 * Time: 21:20
 * To change this template use File | Settings | File Templates.
 */
package game.entities.fighter
{
	import flash.utils.clearTimeout;
	import flash.utils.setTimeout;

	import starling.core.Starling;

	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.textures.Texture;

	public class RatataAnimationController
	{
		private var fighter:Fighter;
		public var ratata:MovieClip;
		private var ratataTextures:Vector.<Texture>;
		private var timeoutId:int = -1

		public function RatataAnimationController(fighter:Fighter)
		{
			this.fighter = fighter;
			createRatataImage();
		}


		public function showRatata(): void
		{
			setRandomTexture();
			ratata.visible = true;
			ratata.play();
			if(timeoutId > -1)
			{
				clearTimeout(timeoutId);
			}

			timeoutId = setTimeout(hideRatata,600);
		}

		private function hideRatata(): void
		{
			ratata.visible = false;
			ratata.stop();
		}

		private function createRatataImage()
		{
			ratataTextures = Assets.getTextures("fx_particle_ratata");
			ratata = new MovieClip(ratataTextures,50);
			Starling.current.juggler.add(ratata);
			fighter.hull.addChild(ratata);
			ratata.x = fighter.hull.width - ratata.width*0.4 ;
			ratata.y= 20;
			ratata.visible = false;
			setRandomTexture();

		}

		private function  setRandomTexture():  void
		{
			var index:int = Math.random() * ratataTextures.length;
			ratata.currentFrame = index;

		}


	}
}
