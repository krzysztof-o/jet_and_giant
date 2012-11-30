package
{
	import starling.display.Image;
    import starling.textures.Texture;
    import starling.textures.TextureAtlas;

    public class Assets
    {

        [Embed(source="/assets/sprite_jetandgiant_full.png")]
        private static const ATLAS_JET_IMAGE:Class;

        [Embed(source="/assets/sprite_jetandgiant_full.xml", mimeType="application/octet-stream")]
        private static const ATLAS_JET_XML:Class;

        private static const ATLAS_JET:TextureAtlas = new TextureAtlas(Texture.fromBitmap(new ATLAS_JET_IMAGE(), false), XML(new ATLAS_JET_XML()));

		[Embed(source="/assets/particle.pex", mimeType="application/octet-stream")]
		public static const ParticleConfigClass:Class;

		public static const ParicleConfig:XML = XML(new ParticleConfigClass());


        public static function getImage(textureName:String):Image
        {
            trace("imgae: ", textureName);
            return new Image(ATLAS_JET.getTexture(textureName));
        }

		public static function getTexture(textureName:String):Texture
		{
			return ATLAS_JET.getTexture(textureName);
		}
		public static function getTextures(prifix:String): Vector.<Texture>
		{
			return ATLAS_JET.getTextures(prifix);
		}
    }


}
