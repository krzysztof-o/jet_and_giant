package game.entities
{
    import game.entity.Entity;

    import starling.display.Quad;

    public class Ship extends Entity
    {
        private var dx:Number;

        public function Ship()
        {
            var quad:Quad = new Quad(50, 50, 0x123456);
            addChild(quad);
        }

        override public function onAdd():void
        {
            dx = 0;
        }

        override public function update():void
        {
            dx += .1;
            y = 200 + Math.sin(dx) * 100;
            x += 10;
        }
    }
}
