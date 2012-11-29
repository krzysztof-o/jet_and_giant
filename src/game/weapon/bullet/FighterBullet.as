package game.weapon.bullet
{
	import game.Global;
	import game.entities.strategies.BulletMovingStrategy;

	import starling.events.Event;


	public class FighterBullet extends Bullet
	{
		public function FighterBullet()
		{
			movingStrategy = new BulletMovingStrategy(this);

		}

		override protected function onAddedToStage(event: Event): void
		{
			hull.addChild(Assets.getImage("fx_particle_bullett"));
		}

		override public function dispose():void
		{
			Global.fighterBulletPool.returnObject(this);
			super.dispose();
		}
	}
}
