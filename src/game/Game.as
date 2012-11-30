package game
{

import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.utils.Timer;

import game.entities.Bomber;
    import game.entities.fighter.Fighter;
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

import utlis.ClientType;

import utlis.Sounds;

	public class Game extends Sprite
    {
        private var entityManager:EntityManager = EntityManager.getInstance();

        private var scene:Scene;

        public function Game()
        {
            super();

            var parallax:Parallax = new Parallax(0.3);
            addChild(parallax);

            var width:Number = 1280;
            var height:Number = 720;

            scene = new Scene(width,height);
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
			Sounds.Space.play(0,200);

        }
    }
}
