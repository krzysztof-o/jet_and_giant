/**
 * Created with IntelliJ IDEA.
 * User: grzegorz-przybylowic
 * Date: 29.11.12
 * Time: 18:53
 * To change this template use File | Settings | File Templates.
 */
package game.entities
{
	import flash.ui.Keyboard;

	import utlis.KeyboardManager;

	public class FighterShootController
	{
		static private var spacePressed:Boolean = false;

		static public function checkForShoot():Boolean
		{
			 if(!spacePressed && KeyboardManager.getInstance().isKeyPressed(Keyboard.SPACE))
			 {
				 spacePressed = true;
				 return true;
			 }
			 else
			 {
				 spacePressed = false;
				 return false;
			 }
		}
	}
}
