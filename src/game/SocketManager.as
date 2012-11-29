package game
{
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.ProgressEvent;
    import flash.events.SecurityErrorEvent;
    import flash.net.Socket;

    import game.entities.Message;

	import game.entities.strategies.ServerMovingStrategy;


	import utlis.ClientType;
    import utlis.log;

    public class SocketManager
    {
        private static var instance:SocketManager;

        private var socket:Socket;

        public function SocketManager()
        {
            if (instance)
            {
                throw new Error("this is Singleton, you fool!");
            }
        }

        public static function getInstance():SocketManager
        {
            instance ||= new SocketManager();
            return instance;
        }

        public function connect(host:String, port:int):void
        {
            socket = new Socket();
            socket.addEventListener(Event.CONNECT, onConnect);
            socket.addEventListener(Event.CLOSE, onClose);
            socket.addEventListener(IOErrorEvent.IO_ERROR, onError);
            socket.addEventListener(ProgressEvent.SOCKET_DATA, onResponse);
            socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecError);
            socket.connect(host, port);
        }

        private function onSecError(event:SecurityErrorEvent):void
        {
            log("onSecError");
        }

        private function onError(event:IOErrorEvent):void
        {
            log("onError");
        }

        private function onClose(event:Event):void
        {
            log("onClose");
        }

        private function onConnect(event:Event):void
        {
            log("onConnect");
        }

        private function onResponse(event:ProgressEvent):void
        {
            if (socket.bytesAvailable > 0)
            {
                var messages:String = socket.readUTFBytes(socket.bytesAvailable);
                log("onResponse (" + messages.length + ")" + messages);
                if (messages.length > 0)
                {
//                    try
//                    {

                    var arr:Array = messages.split("\n");
                    for each(var m:String in arr)
                    {
                        if(m.length > 2)
                        {
                            var obj:Object = JSON.parse(m);
                            parse(obj.id, obj.data);
                        }
                    }
//                    }
//                    catch (e:*)
//                    {
//                    }
                }
            }
        }

        public function send(id:String, data:Object):void
        {
            if (!socket.connected) return;

            var str:String = JSON.stringify({id: id, data: data});

            socket.writeUTFBytes(str + "\n");
            //socket.writeByte(0);
            socket.flush();
        }

        private function parse(id:String, data:Object):void
        {
            if (id == Message.FIGHTER_POSITION)
            {
                if (ClientType.MOBILE)
                {
                    ServerMovingStrategy(Global.fighter.movingStrategy).setPosition(data.x, data.y);
                }
            }
            if (id == Message.BOMBER_POSITION)
            {
                if (ClientType.DESKTOP)
                {
                    ServerMovingStrategy(Global.bomber.movingStrategy).setPosition(data.x, data.y);
                }
            }
            if (id == Message.DROP_BOMB)
            {
                if (ClientType.DESKTOP)
                {
                    Global.bomber.dropBomb(data.x, data.y);
                }
            }

			if(id == Message.FIGHTER_SHOOT)
			{
				if(ClientType.MOBILE)
				{
					Global.fighter.shoot();
				}
			}
        }
    }
}
