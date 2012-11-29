package game.entities.fighter
{
	import flash.ui.Keyboard;
    import game.entitymanager.Entity;

	import game.Global;
	import game.entities.strategies.FighterMovingStrategy;
	import game.entities.strategies.ServerMovingStrategy;
	import game.entitymanager.Entity;
	import game.weapon.FighterWeapon;
	import game.weapon.Weapon;

	import starling.core.Starling;

	import starling.display.Image;
	import starling.events.Event;

	import utlis.ClientType;

	public class Fighter extends Entity
    {
		protected var weapon:Weapon;
		protected var shootController:FighterShootController;
		protected var engineAnimation:FighterEngineAnimation;
	   	protected var ratataAnimationController :RatataAnimationController;
        public function Fighter()
        {
            super();
			Global.fighter = this;
			hull.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage)
			weapon = new FighterWeapon();
			var img:Image = Assets.getImage("ship_jet_full");
			hull.addChild(img);

            if (ClientType.DESKTOP)
            {
				shootController = new FighterShootController(this) ;
                movingStrategy = new FighterMovingStrategy(this);
            }
            else
            {
                movingStrategy = new ServerMovingStrategy(this);
            }



        }

		private function onAddedToStage(event: Event): void
		{
			createEngineAnimation();
			ratataAnimationController = new RatataAnimationController(this);
		}

		private function createEngineAnimation(): void
		{
			engineAnimation = new FighterEngineAnimation();
			hull.addChildAt(engineAnimation,0);
			engineAnimation.x = -engineAnimation.width/3 + 10;
			engineAnimation.y = hull.height - 19;
			Starling.juggler.add(engineAnimation);
			engineAnimation.play();
		}


		override public function update(dt: Number): void
		{
			super.update(dt) ;
   			if(ClientType.DESKTOP)
			{
				shootController.checkForShoot();
			}
		}

		public function shoot(): void
		{
			var x:Number = hull.bounds.right - ratataAnimationController.ratata.width/2 ;
			var y:Number = hull.bounds.bottom - ratataAnimationController.ratata.height;
			weapon.shoot(x,  y);

			ratataAnimationController.showRatata();
		}
	}
}
