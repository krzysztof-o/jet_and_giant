package game
{
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.ProgressEvent;
    import flash.events.SecurityErrorEvent;
    import flash.net.Socket;
    import flash.system.Security;

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
            Security.allowDomain("*");
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
                var message:String = socket.readUTFBytes(socket.bytesAvailable);
                log("onResponse (" + message.length + ")" + message);
                if (message.length > 0)
                {
                    send("twoja stara!");
                }
            }
        }

        public function send(message:String):void
        {
            socket.writeUTFBytes(message + "\r\n");
            socket.flush();
        }
    }
}