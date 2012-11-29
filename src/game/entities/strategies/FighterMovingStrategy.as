package game.entities.strategies
{
    import flash.geom.Point;
    import flash.ui.Keyboard;

    import game.SocketManager;
    import game.entitymanager.Entity;

    import utlis.KeyboardManager;

    public class FighterMovingStrategy implements IMovingStrategy
    {
        private var entity:Entity;
        private var direction:Point = new Point();
        private var speed:Point = new Point();

        private var keyboardManager:KeyboardManager;

        public function FighterMovingStrategy(entity:Entity)
        {
            this.entity = entity;
            keyboardManager = new KeyboardManager();
        }

        public function update(timer:int):void
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
            entity.x += speed.x;
            entity.y += speed.y;

            SocketManager.getInstance().send("position|" + int(entity.x) + "|" + int(entity.y));
        }

        private function getDirection():void
        {
            if (keyboardManager.isKeyPressed(Keyboard.UP))
            {
                direction.y = -1;
            }
            else if (keyboardManager.isKeyPressed(Keyboard.DOWN))
            {
                direction.y = 1;
            }

            if (keyboardManager.isKeyPressed(Keyboard.LEFT))
            {
                direction.x = -1;
            }
            else if (keyboardManager.isKeyPressed(Keyboard.RIGHT))
            {
                direction.x = 1.5;
            }
        }

        public function dispose():void
        {
            keyboardManager.dispose();
        }
    }
}
