/**
 * Created with IntelliJ IDEA.
 * User: grzegorz-przybylowic
 * Date: 29.11.12
 * Time: 20:04
 * To change this template use File | Settings | File Templates.
 */
package game.entities.fighter
{


	import flash.utils.getTimer;

	import starling.display.MovieClip;
	import starling.textures.Texture;


	public class FighterRatata extends MovieClip
	{
		private function var maxFrames:int;
		public function FighterRatata()
		{
			var texures :Vector.<Texture>   = Assets.getTextures("fx_particle_ratata") ;
			maxFrames = texures.length;
			super(texures,9);
		}




		override public function  advanceTime(passedTime:Number):void
		{
			//currentFrame = Math.random() * maxFrames;
			super.advanceTime(passedTime);

			var tmp:Number = Math.sin(getTimer() * 0.01)+1;
			scaleX = scaleY = 1 + tmp * 0.1;

		}
	}
}
