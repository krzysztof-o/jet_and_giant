package game.entities
{
    import game.entities.strategies.GroundEnemyMovingStrategy;
    import game.weapon.Weapon;

    import starling.display.Quad;
    import starling.utils.Color;

    public class GroundEnemy extends EnemyBase
    {
        private var weapon:Weapon;

        public function GroundEnemy()
        {
            super();

            movingStrategy = new GroundEnemyMovingStrategy(this);

            var quad:Quad = new Quad(100, 100, Color.AQUA);
            hull.addChild(quad);

            weapon = new GroundWeapon();
        }

        override public function update(timer:Number):void
        {
            weapon.load(timer);
            if (weapon.isLoaded)
            {
                weapon.shoot(position.x,  position.y);
            }
            super.update(timer);
        }

        override public function dispose():void
        {
            super.dispose();
        }
    }
}
