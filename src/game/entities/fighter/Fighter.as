package game.entities.fighter
{
	import flash.media.Sound;
	import flash.ui.Keyboard;

	import game.SocketManager;
    import game.enemy.BoomAnimation;
    import game.entities.Message;
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
	import utlis.Sounds;
	import utlis.log;

	public class Fighter extends Entity
    {
		protected const MAX_HEALTH:int = 100;
		protected var health:int = MAX_HEALTH;
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
			Sounds.Laser.play();
		}

		override  public function detonate(fromServer:Boolean = false): void
		{
            new BoomAnimation(position.x,  position.y);
			health--;
			log("-------------------------------- hit fighter")
			if(health <= 0)
			{
				new BoomAnimation(position.x,  position.y);
				remove();
			}

			if(!fromServer)
			{
				SocketManager.getInstance().send(Message.FIGHTER_DETONATE,{})
			}
		}
	}
}
