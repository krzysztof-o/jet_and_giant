package utlis
{
	import flash.utils.Dictionary;

    import starling.core.Starling;
    import starling.events.KeyboardEvent;

    public class KeyboardManager
    {
		private static var instance:KeyboardManager;
        private var pressed:Dictionary = new Dictionary();

		public static function getInstance():KeyboardManager
		{
			instance ||= new KeyboardManager();
			return instance;
		}

        public function KeyboardManager()
        {
			if (instance)
			{
				throw new Error("this is Singleton, you fool!");
			}

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