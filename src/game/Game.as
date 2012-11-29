package game
{

import game.entities.Ship;
    import game.entities.Fighter;
    import game.entities.Ship;
	import game.enemy.Enemy;
	import game.enemy.EnemyFactory;
	import game.enemy.EnemyVO;
	import game.entities.Ship;
    import game.entitymanager.EntityManager;
    import game.scene.Scene;

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

            var fighter:Fighter = new Fighter();
            fighter.add();

			var vo:EnemyVO =  new EnemyVO();
			vo.type = 1;
			EnemyFactory.getInstance().createEnemy(vo);
        }
    }
}
