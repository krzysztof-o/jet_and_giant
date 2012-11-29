package game.entities
{
	import flash.ui.Keyboard;
    import game.entitymanager.Entity;

	import game.Global;
	import game.entities.strategies.FighterMovingStrategy;
	import game.entities.strategies.ServerMovingStrategy;
	import game.entitymanager.Entity;
	import game.weapon.FighterWeapon;
	import game.weapon.Weapon;

	import starling.display.Image;

    import utlis.ClientType;

	public class Fighter extends Entity
    {
		protected var weapon:Weapon;
		protected var shootController:FighterShootController;

        public function Fighter()
        {
            super();
			weapon = new FighterWeapon();

            Global.fighter = this;
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
