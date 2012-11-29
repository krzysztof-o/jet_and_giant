package game.entities
{
    import game.entities.strategies.FighterMovingStrategy;
    import game.entitymanager.Entity;

    import starling.display.Quad;

    public class Fighter extends Entity
    {
        public function Fighter()
        {
            super();
            movingStrategy = new FighterMovingStrategy(this);

            var quad:Quad = new Quad(50, 50, 0xFF0000);
            hull.addChild(quad);
        }
    }
}
