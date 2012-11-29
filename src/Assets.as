package
{
	import starling.display.Image;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class Assets
	{

		[Embed(source="/assets/game_space_cadet_animations_002.png")]
		private static const ATLAS_IMAGE:Class;

		[Embed(source="/assets/game_space_cadet_animations_002.xml",mimeType="application/octet-stream")]
		private static const ATLAS_XML:Class;

		private static const ATLAS:TextureAtlas = new TextureAtlas(Texture.fromBitmap(new ATLAS_IMAGE(), false), XML(new ATLAS_XML()));


		public  static  function getImage(textureName:String):Image
		{
			 return new Image(ATLAS.getTexture(textureName));
		}
	}


}
