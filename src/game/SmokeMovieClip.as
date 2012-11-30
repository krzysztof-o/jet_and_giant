/**
 * Created with IntelliJ IDEA.
 * User: grzegorz-przybylowic
 * Date: 30.11.12
 * Time: 09:21
 * To change this template use File | Settings | File Templates.
 */
package game
{
	import starling.display.MovieClip;

	public class SmokeMovieClip  extends MovieClip
	{
		public function SmokeMovieClip()
		{
			super(Assets.getTextures("fx_particle_smoke_")) ;
		}
	}
}
