package game.enemy
{
    import com.greensock.TweenMax;

	import flash.media.Sound;

	import starling.core.Starling;
    import starling.display.MovieClip;
    import starling.display.Sprite;

	import utlis.Sounds;

	public class BoomAnimation extends Sprite
    {
        public function BoomAnimation(x:Number, y:Number)
        {
            Starling.current.stage.addChild(this);

            this.x = x;
            this.y = y;
            var mc:MovieClip = new MovieClip(Assets.getTextures("fx_particle_crash_"));
            addChild(mc);
            mc.x = -300;
            mc.y = -150;
            Starling.juggler.add(mc);

			Sounds.Boom.play();
            TweenMax.to(mc, .2, {alpha: 0, delay: .2, onComplete: removeFromParent});
        }

    }
}
