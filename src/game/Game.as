package game
{

import game.entities.Ship;
    import game.entitymanager.EntityManager;
import game.scene.Scene;

import starling.core.Starling;

import starling.display.Sprite;

    public class Game extends Sprite
    {
        private var entityManager:EntityManager = EntityManager.getInstance();

        private var scene:Scene;

        public function Game()
        {
            super();

            scene = new Scene(width, height);

            addChild(scene);

            entityManager.init(scene);

            var ship:Ship = new Ship();
            ship.add();
        }
    }
}
