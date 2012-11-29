/**
 * Created with IntelliJ IDEA.
 * User: grzegorz-przybylowic
 * Date: 29.11.12
 * Time: 12:59
 * To change this template use File | Settings | File Templates.
 */
package game.enemy
{

	import flash.utils.Dictionary;

	import game.entities.strategies.FlayingEnemyMovingStrategy;
	import game.entities.strategies.GroundEnemyMovingStrategy;

	public class EnemyFactory
	{
		private const  GROUND_ENEMY_TYPE:int = 0;
		private const  FLAYING_ENEMY_TYPE:int = 1;
		private static var instance: EnemyFactory;
		private var movingStrategies:Dictionary;

		public function EnemyFactory()
		{
			movingStrategies = new Dictionary();
			movingStrategies[GROUND_ENEMY_TYPE] = GroundEnemyMovingStrategy;
			movingStrategies[FLAYING_ENEMY_TYPE] = FlayingEnemyMovingStrategy;
		}

		public static function getInstance():EnemyFactory
		{
			instance ||= new EnemyFactory();
			return instance;
		}

		public function  createEnemy(vo:EnemyVO):void
		{
			var enemy:Enemy =  new Enemy(vo);
			var movingTypeClass:Class =  movingStrategies[vo.type] as Class;
			enemy.movingStrategy = new movingTypeClass(enemy);
			enemy.add();
		}
	}
}
