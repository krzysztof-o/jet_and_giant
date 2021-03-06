package
{

    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
	import flash.geom.Rectangle;
	import flash.sensors.Accelerometer;
    import flash.geom.Rectangle;
    import flash.sensors.Accelerometer;

    import game.Game;
    import game.SocketManager;

    import starling.core.Starling;

    import utlis.ClientType;
    import utlis.log;

    [SWF(frameRate=60, height="720", width="1280", backgroundColor=0x000000)]
    public class Jet_and_giant extends Sprite
    {
        public function Jet_and_giant()
        {
            stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;

            var isMobile:Boolean = stage.loaderInfo.parameters.isMobile == "true" || Accelerometer.isSupported;
            ClientType.MOBILE = isMobile;
            ClientType.DESKTOP = !isMobile;
            log(isMobile ? "MOBILE" : "DESKTOP");

            var viewport:Rectangle;
            if (isMobile)
            {
                viewport = new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight);
            }
            else
            {
                viewport = new Rectangle(0, 0, stage.stageWidth, stage.stageHeight);
            }

            ClientType.WIDTH = viewport.width;
            ClientType.HEIGHT = viewport.height;

            var starling:Starling = new Starling(Game, stage, viewport);
            starling.showStats = true;
            starling.start();

            viewport = null;

            var socketManager:SocketManager = SocketManager.getInstance();

            var ip:String = "192.168.3.91";
            if (stage.loaderInfo.parameters.hasOwnProperty("ip"))
                ip = stage.loaderInfo.parameters.ip;
            socketManager.connect(ip, 17234);
        }
    }
}
