/**
 * Created with IntelliJ IDEA.
 * User: dariusz
 * Date: 11/29/12
 * Time: 12:14 PM
 * To change this template use File | Settings | File Templates.
 */
package game.entities
{
import flash.display.Bitmap;
import flash.geom.Point;
import flash.utils.getTimer;

import starling.display.Sprite;
    import starling.textures.Texture;
    import starling.display.Image;
    import starling.events.Event;
    import starling.textures.Texture;
    import starling.textures.TextureAtlas;

    public class Parallax extends Sprite //Entity
    {
        protected var lastUpdate:int;
        protected var speed:Number;
        protected var distance:Number;

        [Embed(source="../../assets/background_parallax_01.png")]
        protected static const ParallaxBitmap01:Class;

        [Embed(source="../../assets/background_parallax_02.png")]
        protected static const ParallaxBitmap02:Class;

        [Embed(source="../../assets/background_parallax_03.png")]
        protected static const ParallaxBitmap03:Class;

        protected var layers:Vector.<Image>;

        public function Parallax(_speed:Number)
        {
            super();

            lastUpdate = -1;
            speed = _speed;
            distance = 0.0;

            layers = new Vector.<Image>;

            addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        }

        public function onAddedToStage(event:Event):void
        {
            var tex:Texture = Texture.fromBitmap(new ParallaxBitmap01);
            tex.repeat = true;
            var img:Image = new Image(tex);
            layers.push(img);

            tex = Texture.fromBitmap(new ParallaxBitmap02);
            tex.repeat = true;
            img = new Image(tex);
            layers.push(img);

            tex = Texture.fromBitmap(new ParallaxBitmap03);
            tex.repeat = true;
            img = new Image(tex);
            layers.push(img);

            for (var i:uint=0; i<layers.length; ++i)
            {
                img = layers[i];
                addChild(img);
                img.width = stage.stageWidth;
                img.height = stage.stageHeight;

                img.x = img.y = 0.0;
                img.setTexCoords(1, new Point(2,0));
                img.setTexCoords(3, new Point(2,1));
            }

            this.x = this.y = 0.0;
            this.width = stage.stageWidth;
            this.height = stage.stageHeight;

            removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
            addEventListener(Event.ENTER_FRAME, update);
        }

//        override public function update(timer:int):void
        public function update(event:Event):void
        {
            var timer:int = getTimer();
            if (lastUpdate < 0)
            {
                lastUpdate = timer;
                return;
            }

            var diff:Number = (timer - lastUpdate) * 0.001;

            for (var i:uint=0; i<layers.length; ++i)
            {
                var dist:Number = (diff * speed / Math.exp(1/(i+1)));
                for (var vID:uint=0; vID<4; ++vID)
                {
                    var p:Point = layers[i].getTexCoords(vID);

                    p.x += dist;

                    layers[i].setTexCoords(vID, p);
                }
            }
            distance += diff * speed;

            lastUpdate = timer;
        }
    }
}
