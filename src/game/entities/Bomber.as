package game.entities
{
    import flash.utils.getTimer;
    import flash.utils.setTimeout;

	import game.Global;
	import game.SmokeMovieClip;
	import game.SocketManager;
    import game.entities.strategies.BomberMovingStrategy;
	import game.entities.strategies.ServerMovingStrategy;
	import game.entitymanager.Entity;

    import starling.core.Starling;
    import starling.display.Image;
	import starling.events.Event;
	import starling.events.TouchEvent;
    import starling.events.TouchPhase;
	import starling.extensions.PDParticleSystem;
	import starling.textures.Texture;

	import utlis.ClientType;
    import utlis.log;

    public class Bomber extends Entity
    {
        private const BOMB_RELATIVE_X:Number = 160;
        private const BOMB_RELATIVE_Y:Number = 100;
		private var particleSystem:PDParticleSystem;
		private var particleTextures:Vector.<Texture>;
        private var lastTime:int;
		private var changeParticleTime:Number = 0;

        public function Bomber()
        {
            super();
            Global.bomber = this;
            if (ClientType.MOBILE)
            {
                movingStrategy = new BomberMovingStrategy(this);
            }
            else
            {
                movingStrategy = new ServerMovingStrategy(this);
            }

			position.x = 600;
			position.y = 300;

            var img:Image = Assets.getImage("ship_giant_full");
            hull.addChild(img);


            Starling.current.stage.addEventListener(TouchEvent.TOUCH, touchHandler);
			hull.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
        }

		private function onAddedToStage(event: Event): void
		{
			particleTextures = Assets.getTextures("fx_particle_smoke_")
			particleSystem = new PDParticleSystem(Assets.ParicleConfig, particleTextures[0]);
			hull.addChild(particleSystem);
			Starling.current.juggler.add(particleSystem);
			particleSystem.start();
		}

        private function touchHandler(event:TouchEvent):void
        {
            if (event.getTouch(Starling.current.root, TouchPhase.BEGAN) && getTimer() - lastTime > 1000)
            {
                lastTime = getTimer();
                var dx:Number = position.x + BOMB_RELATIVE_X;
                var dy:Number = position.y + BOMB_RELATIVE_Y;
                if (ClientType.MOBILE)
                {
                    log("send drop bomb");
                    SocketManager.getInstance().send(Message.DROP_BOMB, {x: int(dx), y: int(dy)});
                    dropBomb(dx, dy);
                }
            }
        }

        public function dropBomb(x:Number, y:Number):void
        {
            var bomb:Bomb = Global.bombPool.borrowObject();

            //wysrodkowanie pozycji bomby pomiedzy tym co przyszlo z serwera i tym gdzie jest bomber
            x -= (x - (position.x + BOMB_RELATIVE_X)) / 2;
            y -= (y - (position.y + BOMB_RELATIVE_Y)) / 2;


            bomb.position.x = x - 80;
            bomb.position.y = y - bomb.hull.height * 3;
			bomb.add();
			bomb.hull.parent.setChildIndex(bomb.hull,0);
        }

        override public function dispose():void
        {
            Starling.current.stage.removeEventListener(TouchEvent.TOUCH, touchHandler);
            super.dispose();
        }

		override public function update(dt:Number):void
		{
			super.update(dt);

			changeParticleTime += dt;
			if(changeParticleTime > 100)
			{
				changeParticleTime = 0;
				//.texture = particleTextures[Math.random() * particleTextures.length];

			}
		}
    }
}
