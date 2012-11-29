/**
 * Created with IntelliJ IDEA.
 * User: grzegorz-przybylowic
 * Date: 29.11.12
 * Time: 12:59
 * To change this template use File | Settings | File Templates.
 */
package game.enemy
{

	import game.entities.strategies.FlayingEnemyMovingStrategy;
	import game.entities.strategies.GroundEnemyMovingStrategy;

	public class EnemyFactory
	{
		public function EnemyFactory()
		{
		}

		static public function createGroundEnemy():void
		{
			var enemy:Enemy =  new Enemy();
			enemy.movingStrategy = new GroundEnemyMovingStrategy(enemy);
			enemy.add();
		}

		static public function createFlayingEnemy():void
		{
			var enemy:Enemy =  new Enemy();
			enemy.movingStrategy = new FlayingEnemyMovingStrategy(enemy);
			enemy.add();
		}
	}
}
