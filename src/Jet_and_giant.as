package
{

    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;

    import game.Game;
    import game.entity.EntityManager;

    import starling.core.Starling;

    public class Jet_and_giant extends Sprite
    {
        private var entityManager:EntityManager = EntityManager.getInstance();

        public function Jet_and_giant()
        {
            stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;

            var starling:Starling = new Starling(Game, stage);
            starling.start();
        }
    }
}
