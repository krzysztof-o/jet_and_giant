
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
        }

        override public function update(timer:int):void
        {
            super.update(timer);
            //y = 200 + Math.sin(timer / 500) * 100;
            //x += 10;
        }
    }
}
