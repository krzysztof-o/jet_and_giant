package game
{

import flash.events.TimerEvent;
import flash.utils.Timer;

import game.entities.Bomber;
    import game.entities.Fighter;
	import game.entities.Ground;
	import game.entities.Ship;
	import game.enemy.Enemy;
	import game.enemy.EnemyFactory;
	import game.enemy.EnemyVO;
	import game.entities.Ship;
    import game.entities.Parallax;

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

            var parallax:Parallax = new Parallax(1.0);
            addChild(parallax);

            scene = new Scene(width, height);
            addChild(scene);
            entityManager.init(scene);

            var ship:Ship = new Ship();
            ship.add();

            var fighter:Fighter = new Fighter();
            fighter.add();

            var bomber:Bomber = new Bomber();
            bomber.add();

			var ground:Ground = new Ground();
			ground.add();

			var vo:EnemyVO =  new EnemyVO();
			vo.type = 1;
			vo.startX = 700;
			//EnemyFactory.getInstance().createEnemy(vo);
        }
    }
}
