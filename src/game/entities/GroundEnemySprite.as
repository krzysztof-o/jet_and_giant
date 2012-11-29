package game.entities
{
    import com.greensock.TweenMax;

    import starling.display.Image;
    import starling.display.Sprite;

    public class GroundEnemySprite extends Sprite
    {
        private var gun:Image;
        public var gunRotation:Number;

        public function GroundEnemySprite()
        {
            var base:Image = Assets.getImage("turret_enemy_base");
            addChild(base);

            gun = Assets.getImage("turret_enemy_gun");
            gun.pivotX = 26;
            gun.pivotY = 49;
            gun.x = 28;
            gun.y = 8;
            gun.rotation = .40;
            addChild(gun);
        }

        public function nextMove(time:Number):void
        {
            gunRotation = -Math.PI / 4 + Math.random() * Math.PI / 2 + .4;
            TweenMax.to(gun, time, {rotation: gunRotation});
        }

        public function getNextGunRotation():Number
        {
            return gunRotation - .4;
        }

        public function getCurrentGunRotation():Number
        {
            return gun.rotation - .4;
        }
    }
}
