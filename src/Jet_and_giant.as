package
{

    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;

    import game.Game;
    import game.entitymanager.EntityManager;

    import starling.core.Starling;

	[SWF(frameRate=60, height="600", width="760")]
    public class Jet_and_giant extends Sprite
    {
        public function Jet_and_giant()
        {
            stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;

            var starling:Starling = new Starling(Game, stage);
            starling.start();
        }
    }
}
