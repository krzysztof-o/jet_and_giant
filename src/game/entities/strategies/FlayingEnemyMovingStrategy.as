/**
 * Created with IntelliJ IDEA.
 * User: grzegorz-przybylowic
 * Date: 29.11.12
 * Time: 12:37
 * To change this template use File | Settings | File Templates.
 */
package game.entities.strategies
{
	import game.enemy.Enemy;

	import utlis.log;

	public class FlayingEnemyMovingStrategy extends EnemyMovingStrategy
	{
		public function FlayingEnemyMovingStrategy(enemy: Enemy)
		{
			super(enemy);
		}

		override  public function update(timer:int):void
		{
			super.update(timer);

			//enemy.hull.y +=2;
			//enemy.hull.x+=2;

		}
	}
}
