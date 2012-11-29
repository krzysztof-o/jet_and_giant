/**
 * Created with IntelliJ IDEA.
 * User: grzegorz-przybylowic
 * Date: 29.11.12
 * Time: 12:31
 * To change this template use File | Settings | File Templates.
 */
package game.entities.strategies
{
	import game.enemy.Enemy;


	public class EnemyMovingStrategy implements  IMovingStrategy
	{
		protected var enemy:Enemy;
		public function EnemyMovingStrategy(enemy:Enemy)
		{
			this.enemy = enemy;
		}

		public function update(timer:int):void
		{

		}
	}
}
