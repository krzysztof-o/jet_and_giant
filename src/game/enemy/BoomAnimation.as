package game.enemy
{
    import com.greensock.TweenMax;

    import game.entitymanager.Entity;

    import starling.display.Image;

    public class BoomAnimation extends Entity
    {
        public function BoomAnimation(x:Number,y:Number)
        {
            add();

            position.x = x;
            position.y = y;
            var mc:Image = Assets.getImage("fx_particle_boom_01");
            hull.addChild(mc);

            TweenMax.to(mc, .2, {alpha: 0, delay: .2, onComplete: remove});
        }
    }
}
