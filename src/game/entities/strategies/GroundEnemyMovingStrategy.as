/**
 * Created with IntelliJ IDEA.
 * User: grzegorz-przybylowic
 * Date: 29.11.12
 * Time: 12:35
 * To change this template use File | Settings | File Templates.
 */
package game.entities.strategies
{
	import game.enemy.Enemy;

	public class GroundEnemyMovingStrategy extends EnemyMovingStrategy
	{
		public function GroundEnemyMovingStrategy(enemy: Enemy)
		{
			super(enemy);
		}
	}
}
