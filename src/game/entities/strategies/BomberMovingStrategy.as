package game.entities.strategies
{
    import flash.geom.Point;
    import flash.ui.Keyboard;

    import game.SocketManager;
    import game.entities.Message;
    import game.entitymanager.Entity;

    import starling.core.Starling;

    import utlis.KeyboardManager;

    public class BomberMovingStrategy implements IMovingStrategy
    {
        private var entity:Entity;
        private var direction:Point = new Point();
        private var speed:Point = new Point();

        private var keyboardManager:KeyboardManager;
        private var lastTime:Number = 0;

        public function BomberMovingStrategy(entity:Entity)
        {
            this.entity = entity;
            keyboardManager = new KeyboardManager();
        }

        public function update(timer: Number): void
        {
            var pt:Point = calculatePosition();

            entity.position.x = pt.x;
            entity.position.y = pt.y;

        }

        private function calculatePosition():Point
        {
            getDirection();

            if (!keyboardManager.isKeyPressed(Keyboard.LEFT) && !keyboardManager.isKeyPressed(Keyboard.RIGHT))
            {
                if (speed.x < .1 && speed.x > -.1) speed.x = 0;
                else speed.x /= 1.1;
            }
            else
            {
                speed.x += direction.x * .4;
            }
            if (!keyboardManager.isKeyPressed(Keyboard.UP) && !keyboardManager.isKeyPressed(Keyboard.DOWN))
            {
                if (speed.y < .1 && speed.y > -.1) speed.y = 0;
                else speed.y /= 1.1;
            }
            else
            {
                speed.y += direction.y * .4;
            }

            //min/max speed
            speed.x = Math.min(speed.x, 4);
            speed.x = Math.max(speed.x, -3);

            speed.y = Math.min(speed.y, 3);
            speed.y = Math.max(speed.y, -3);

            //update
            var dx:Number = entity.position.x + speed.x;
            var dy:Number = entity.position.y + speed.y;

            //
            dx = Math.max(20, dx);
            dx = Math.min(Starling.current.stage.stageWidth - 20 - entity.hull.width, dx);
            dy = Math.max(20, dy);
            dy = Math.min(Starling.current.stage.stageHeight - 20 - entity.hull.height, dy);

            if (int(entity.position.x) != int(dx) || int(entity.position.y) != int(dy))
            if (int(entity.position.x) != int(dx) || int(entity.position.y) != int(dy))
            var newTime:int = new Date().time;
            if ((int(entity.position.x) != int(dx) || int(entity.position.y) != int(dy)) && newTime - lastTime > 20)
            {
                //log("SEND", newTime - lastTime);
                lastTime = newTime;
                SocketManager.getInstance().send(Message.BOMBER_POSITION, getPositionObject());
            }
            return new Point(dx, dy);
        }

        private function getPositionObject():Object
        {
            return {x: int(entity.position.x), y: int(entity.position.y)};
        }

        private function getDirection():void
        {
            if (keyboardManager.isKeyPressed(Keyboard.DOWN))
            {
                direction.y = 1;
            }
            else if (keyboardManager.isKeyPressed(Keyboard.UP))
            {
                direction.y = -1;
            }

            if (keyboardManager.isKeyPressed(Keyboard.RIGHT))
            {
                direction.x = 1.5;
            }
            else if (keyboardManager.isKeyPressed(Keyboard.LEFT))
            {
                direction.x = -1;
            }
        }

        public function dispose():void
        {
            keyboardManager.dispose();
        }
    }
}
