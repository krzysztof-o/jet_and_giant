package game.entities
{
    import game.entities.strategies.BombMovingStrategy;
    import game.entitymanager.Entity;

    import starling.display.Quad;

    import starling.utils.Color;

    public class Bomb extends Entity
    {
        public function Bomb()
        {
            super();
            hull.addChild(new Quad(50,50,Color.BLUE));
            movingStrategy = new BombMovingStrategy(this);
        }

        override public function onAdd():void
        {
            super.onAdd();
        }
    }
}
