package {

import flash.display.Sprite;
import flash.text.TextField;

[SWF(frameRate=60, height="600", width="760")]
public class Jet_and_giant extends Sprite
{
    public function Jet_and_giant()
	{
        var textField:TextField = new TextField();
        textField.text = "Hello, World";
        addChild(textField);
    }
}
}
