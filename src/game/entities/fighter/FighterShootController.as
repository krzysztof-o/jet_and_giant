/**
 * Created with IntelliJ IDEA.
 * User: grzegorz-przybylowic
 * Date: 29.11.12
 * Time: 19:14
 * To change this template use File | Settings | File Templates.
 */
package game.entities.fighter
{
	import com.greensock.TweenMax;

	import flash.utils.setTimeout;

	import game.entities.*;
	import flash.ui.Keyboard;

	import game.SocketManager;

	import starling.core.Starling;
	import starling.display.Image;
	import starling.events.KeyboardEvent;
	import starling.textures.Texture;

	public class FighterShootController
	{
		private var shoot:Boolean = false;
		private var fighter:Fighter;

		public function FighterShootController(fighter:Fighter)
		{
			this.fighter = fighter;

			Starling.current.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown)
		}

		public function checkForShoot():void
		{
			if(shoot)
			{
				shoot = false;
				fighter.shoot();
				SocketManager.getInstance().send(Message.FIGHTER_SHOOT,{})
			}
		}


		private function onKeyDown(event: KeyboardEvent): void
		{
			if(event.keyCode == Keyboard.SPACE)
			{
				shoot = false;
			}
		}

		private function onKeyUp(event: KeyboardEvent): void
		{
			if(event.keyCode == Keyboard.SPACE)
			{
				shoot = true;
			}
		}
	}
}
