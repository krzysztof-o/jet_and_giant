
  package game.entities
{
    import game.entitymanager.Entity;

    import starling.display.Quad;

    public class Ship extends Entity
    {
        public function Ship()
        {
            var quad:Quad = new Quad(50, 50, 0x123456);
            hull.addChild(quad);
            hull.active = true;
            quad = null;
        }

    }
}
