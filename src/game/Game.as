package game
{

import flash.events.TimerEvent;
import flash.utils.Timer;

import game.entities.Bomber;
    import game.entities.Fighter;
	import game.entities.Ground;
	import game.entities.Ship;
	import game.enemy.FlyingEnemy;
	import game.enemy.EnemyFactory;
	import game.enemy.EnemyVO;
	import game.entities.Ship;
    import game.entities.Parallax;
    import game.entitymanager.EnemiesManager;

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

            var fighter:Fighter = new Fighter();
            fighter.add();

            var bomber:Bomber = new Bomber();
            bomber.add();

			var ground:Ground = new Ground();
			ground.add();

            var enemiesManager:EnemiesManager = Global.enemiesManager;
            enemiesManager.add();

//			var vo:EnemyVO =  new EnemyVO();
//			vo.type = 1;
//			EnemyFactory.getInstance().createEnemy(vo);
//            vo = null;
        }
    }
}
