package game
{
    import game.entities.Ship;
    import game.entitymanager.EntityManager;

    import starling.display.Sprite;

    public class Game extends Sprite
    {
        private var entityManager:EntityManager = EntityManager.getInstance();

        public function Game()
        {
            super();

            entityManager.init(this);

            var ship:Ship = new Ship();
            ship.add();
        }
    }
}
