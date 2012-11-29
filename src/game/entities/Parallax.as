/**
 * Created with IntelliJ IDEA.
 * User: dariusz
 * Date: 11/29/12
 * Time: 12:14 PM
 * To change this template use File | Settings | File Templates.
 */
package game.entities
{
import avmplus.factoryXml;

import flash.geom.Point;

import flashx.textLayout.operations.ModifyInlineGraphicOperation;

import game.entitymanager.Entity;

    import starling.display.Image;
    import starling.events.Event;
    import starling.textures.Texture;
    import starling.textures.TextureAtlas;

    public class Parallax extends Entity
    {
        protected var lastUpdate:int;
        protected var speed:Number;
        protected var distance:Number;

        [Embed(source="../../assets/background_parallax.png")]
        protected static const ParallaxAtlasBitmap:Class;

        [Embed(source="../../assets/background_parallax.xml", mimeType="application/octet-stream")]
        protected static const ParallaxAtlasXML:Class;

        protected var textureAtlas:TextureAtlas;
        protected var layers:Vector.<Image>;

        public function Parallax(_speed:Number)
        {
            super();

            lastUpdate = -1;
            this.speed = _speed;
            this.distance = 0.0;

            layers = new Vector.<Image>;

//            addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
            init();
        }

//        protected function onAddedToStage(event:Event):void
        protected function  init():void
        {
            textureAtlas = new TextureAtlas(Texture.fromBitmap(new ParallaxAtlasBitmap()), XML(new ParallaxAtlasXML()));

            var textures:Vector.<Texture> = textureAtlas.getTextures("background_parallax_");
            for (var i:uint = 0; i < textures.length; ++i)
            {
                var tex:Texture = textures[i];
                tex.repeat = true;
                var img:Image = new Image(tex);
                layers.push(img);

                if (i==0) hull.addChild(img);
            }

//            removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        }

        override public function update(timer:int):void
        {
            trace("update");

            if (lastUpdate < 0)
            {
                lastUpdate = timer;
                return;
            }

            var diff:int = timer - lastUpdate;
            var factor:Number = 0.0005;

            for (var i:uint=0; i<1/*layers.length*/; ++i)
            {
                for (var vID:uint=0; vID<4; ++vID)
                {
                    var p:Point = layers[i].getTexCoords(vID);

                    p.x += (diff * speed * factor);
                    layers[i].setTexCoords(vID, p);
                }
            }

            lastUpdate = timer;
        }
    }
}
