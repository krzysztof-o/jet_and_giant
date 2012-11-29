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
		protected var ratata:FighterRatata;

        public function Fighter()
        {
            super();
			Global.fighter = this;
			hull.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage)
			weapon = new FighterWeapon();


            if (ClientType.DESKTOP)
            {
				shootController = new FighterShootController(this) ;
                movingStrategy = new FighterMovingStrategy(this);
            }
            else
            {
                movingStrategy = new ServerMovingStrategy(this);
            }

            var img:Image = Assets.getImage("ship_jet_full");
            hull.addChild(img);
        }

		private function onAddedToStage(event: Event): void
		{
			createRatata();
		}

		private function createRatata(): void
		{
			ratata = new FighterRatata();
			hull.addChildAt(ratata,0);
			ratata.x = -ratata.width/2;
			ratata.y = -10;
			Starling.juggler.add(ratata);
			ratata.play();
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
			var x:Number = hull.bounds.right;
			var y:Number = hull.bounds.bottom;
			 weapon.shoot(x,  y);
		}
	}
}
