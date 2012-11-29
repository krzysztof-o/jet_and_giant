package game.entities
{
	import flash.ui.Keyboard;

	import game.Global;
	import game.entities.FighterShootController;
	import game.entities.strategies.FighterMovingStrategy;
    import game.entitymanager.Entity;
	import game.weapon.FighterWeapon;
	import game.weapon.Weapon;

	import starling.display.Image;

    import utlis.ClientType;
	import utlis.KeyboardManager;
	import utlis.log;

	public class Fighter extends Entity
    {
		protected var weapon:Weapon;
        public function Fighter()
        {
            super();
			weapon = new FighterWeapon();

            Global.fighter = this;
            if (ClientType.DESKTOP)
            {
                movingStrategy = new FighterMovingStrategy(this);
            }
            else
            {
                movingStrategy = new ServerMovingStrategy(this);
            }

            var img:Image = Assets.getImage("ship_jet_full");
            hull.addChild(img);
        }

		override public function update(dt: Number): void
		{
			super.update(dt) ;
   			if(ClientType.DESKTOP)
			{

				if(FighterShootController.checkForShoot())
				{
					log("tt")
					shoot();
				}
			}
		}

		public function shoot(): void
		{
			 weapon.shoot(this.x,  this.y);
		}
	}
}
