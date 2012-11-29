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

	import utlis.log;


	public class FighterEngineAnimation extends MovieClip
	{

		public function FighterEngineAnimation()
		{
			var texures :Vector.<Texture>  = Assets.getTextures("fx_particle_engine");
			super(texures,12);
		}




		override public function  advanceTime(passedTime:Number):void
		{

			super.advanceTime(passedTime);

			var tmp:Number = Math.sin(getTimer() * 0.01)+1;
			scaleX = scaleY = 1 + tmp * 0.1;

		}
	}
}
