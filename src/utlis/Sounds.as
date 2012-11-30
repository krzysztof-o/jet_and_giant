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
		[Embed(source="/sounds/sx_3.mp3")]
		private static var soundClip:Class;
		public static var TestSound:Sound = new soundClip() as Sound;

		[Embed(source="/sounds/77087__supraliminal__laser-short.mp3")]
		private static var laserClip:Class;
		public static var Laser:Sound = new laserClip() as Sound;


		[Embed(source="/sounds/space.mp3")]
		private static var spaceClip:Class;
		public static var Space:Sound = new spaceClip() as Sound;

	}
}
