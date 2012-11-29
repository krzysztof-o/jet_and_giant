package
{
	import flash.geom.Rectangle;

	import starling.display.Image;
    import starling.textures.Texture;
    import starling.textures.TextureAtlas;

    public class Assets
    {

        [Embed(source="/assets/game_space_cadet_animations_002.png")]
        private static const ATLAS_IMAGE:Class;

        [Embed(source="/assets/game_space_cadet_animations_002.xml", mimeType="application/octet-stream")]
        private static const ATLAS_XML:Class;

        private static const ATLAS:TextureAtlas = new TextureAtlas(Texture.fromBitmap(new ATLAS_IMAGE(), false), XML(new ATLAS_XML()));

        [Embed(source="/assets/sprite_jetandgiant_full.png")]
        private static const ATLAS_JET_IMAGE:Class;

        [Embed(source="/assets/sprite_jetandgiant_full.xml", mimeType="application/octet-stream")]
        private static const ATLAS_JET_XML:Class;

        private static const ATLAS_JET:TextureAtlas = new TextureAtlas(Texture.fromBitmap(new ATLAS_JET_IMAGE(), false), XML(new ATLAS_JET_XML()));


        public static function getImage(textureName:String):Image
        {
            trace("imgae: ", textureName);
            return new Image(ATLAS.getTexture(textureName) || ATLAS_JET.getTexture(textureName));
        }

		public static function getTextures(prifix:String): Vector.<Texture>
		{
			return ATLAS_JET.getTextures(prifix);
		}
    }


}
