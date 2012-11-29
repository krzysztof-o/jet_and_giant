package game.entities
{
    import game.entities.strategies.GroundEnemyMovingStrategy;

    public class GroundEnemy extends EnemyBase
    {
        private var weapon:GroundWeapon;
        private var sprite:GroundEnemySprite;

        public function GroundEnemy()
        {
            super();

            sprite = new GroundEnemySprite();
            hull.addChild(sprite);

            movingStrategy = new GroundEnemyMovingStrategy(this);

            weapon = new GroundWeapon(sprite);
        }

        override public function update(timer:Number):void
        {
            weapon.load(timer);
            if (weapon.isLoaded)
            {
                weapon.shoot(position.x, position.y);
            }
            super.update(timer);
        }

        override public function dispose():void
        {
            sprite.dispose();
            sprite = null;
            super.dispose();
        }
    }
}
