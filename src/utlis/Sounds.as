/**
 * Created with IntelliJ IDEA.
 * User: grzegorz-przybylowic
 * Date: 30.11.12
 * Time: 10:35
 * To change this template use File | Settings | File Templates.
 */
package utlis
{
	import flash.media.Sound;

	public class Sounds
	{
		[Embed(source="/sounds/test.mp3")]
		private static var soundClip:Class;
		public static var TestSound:Sound = new soundClip() as Sound;


	}
}
