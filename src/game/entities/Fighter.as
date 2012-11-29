package game.entities
{
    import game.Global;
    import game.entities.strategies.FighterMovingStrategy;
    import game.entitymanager.Entity;

    import starling.display.Quad;

    import utlis.ClientType;

    public class Fighter extends Entity
    {
        public function Fighter()
        {
            super();
            Global.fighter = this;
            if(ClientType.DESKTOP)
            {
                movingStrategy = new FighterMovingStrategy(this);
            }
            else
            {
                movingStrategy = new FighterServerMovingStrategy(this);
            }
            var quad:Quad = new Quad(50, 50, 0xFF0000);
            hull.addChild(quad);
        }
    }
}
