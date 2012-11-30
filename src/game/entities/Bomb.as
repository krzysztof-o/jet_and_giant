package game.entities
{
	import game.Global;
    import game.enemy.BoomAnimation;
    import game.entities.strategies.BombMovingStrategy;
    import game.entitymanager.Entity;

    import starling.display.Quad;
	import starling.events.Event;

	import starling.utils.Color;

    public class Bomb extends Entity
    {
        public function Bomb()
        {
            super();
			hull.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

            movingStrategy = new BombMovingStrategy(this);
        }

		private function onAddedToStage(event: Event): void
		{
			hull.addChildAt(Assets.getImage("fx_particle_bomb"),0);
		}

        override public function onAdd():void
        {
            super.onAdd();

			hull.x = position.x;
			hull.y = position.y;
			hull.active = false;
        }

		override  public function detonate(fromServer:Boolean = false):void
		{
            //new BoomAnimation(position.x,  position.y);
			remove();
		}
    }
}
