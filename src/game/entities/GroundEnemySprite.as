package game.entities
{
    import com.greensock.TweenMax;

    import game.Global;

    import game.SocketManager;

    import starling.display.Image;
    import starling.display.Sprite;

    import utlis.ClientType;
    import utlis.log;

    public class GroundEnemySprite extends Sprite
    {
        private var gun:Image;
        public var gunRotation:Number;
        private var enemy:GroundEnemy;

        public function GroundEnemySprite(enemy:GroundEnemy)
        {
            this.enemy = enemy;
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

        public function setNextRotation(time:Number, r:Number):void
        {
            log(time,  Global.currentTime, time - Global.currentTime);
            gunRotation = r;
            TweenMax.to(gun, (time - Global.currentTime)/1000, {rotation: gunRotation});
        }

        public function nextMove(time:Number):void
        {
            gunRotation = -Math.PI / 4 + Math.random() * Math.PI / 2 + .4;
            TweenMax.to(gun, time, {rotation: gunRotation});
            if(ClientType.DESKTOP)
            {
                SocketManager.getInstance().send(Message.GROUND_SHOOT, {id: enemy.vo.id, r: gunRotation, x: enemy.position.x, y: enemy.position.y, time: Global.currentTime + time*1000});
            }
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
