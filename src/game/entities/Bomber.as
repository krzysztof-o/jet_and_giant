package game.entities
{
    import game.Global;
    import game.entities.strategies.BomberMovingStrategy;
    import game.entitymanager.Entity;

    import starling.display.Image;

    import utlis.ClientType;

    public class Bomber extends Entity
    {
        public function Bomber()
        {
            super();
            Global.bomber = this;
            if (ClientType.MOBILE)
            {
                movingStrategy = new BomberMovingStrategy(this);
            }
            else
            {
                movingStrategy = new ServerMovingStrategy(this);
            }

            var img:Image = Assets.getImage("ship_giant_full");
            hull.addChild(img);
        }
    }
}
