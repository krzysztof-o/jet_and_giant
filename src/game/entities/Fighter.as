package game.entities
{
    import game.Global;
    import game.entities.strategies.FighterMovingStrategy;
import game.entities.strategies.ServerMovingStrategy;
import game.entitymanager.Entity;

    import starling.display.Image;

    import utlis.ClientType;

    public class Fighter extends Entity
    {
        public function Fighter()
        {
            super();
            Global.fighter = this;
            if (ClientType.DESKTOP)
            {
                movingStrategy = new FighterMovingStrategy(this);
            }
            else
            {
                movingStrategy = new ServerMovingStrategy(this);
            }

            var img:Image = Assets.getImage("ship_jet_full");
            hull.addChild(img);
        }
    }
}
