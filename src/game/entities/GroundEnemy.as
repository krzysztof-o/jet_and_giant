package game.entities
{
    import game.entities.strategies.GroundEnemyMovingStrategy;
    import game.weapon.Weapon;

    public class GroundEnemy extends EnemyBase
    {
        private var weapon:Weapon;
        private var sprite:GroundEnemySprite;

        public function GroundEnemy()
        {
            super();

            movingStrategy = new GroundEnemyMovingStrategy(this);

            sprite = new GroundEnemySprite();
            hull.addChild(sprite);

            weapon = new GroundWeapon();
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
