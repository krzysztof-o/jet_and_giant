package utlis
{
    import flash.utils.Dictionary;

    import starling.core.Starling;
    import starling.events.KeyboardEvent;

    public class KeyboardManager
    {
        private var pressed:Dictionary = new Dictionary();

        public function KeyboardManager()
        {
            Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
            Starling.current.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
        }

        private function onKeyDown(event:KeyboardEvent):void
        {
            pressed[event.keyCode] = true;
        }

        private function onKeyUp(event:KeyboardEvent):void
        {
            delete pressed[event.keyCode];
        }

        public function isKeyPressed(keyCode:int):Number
        {
            return pressed[keyCode];
        }

        public function dispose():void
        {
            Starling.current.stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
            Starling.current.stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUp);
        }
    }
}