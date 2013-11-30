package com.example.hangman.view.game
{
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

public class VirtualKeyboardLetter extends Sprite
{
	[Embed("/../assets/images/virtual_keyboard_bg.png")]
	private static const VIRTUAL_KEYBOARD_BG:Class;

	public function VirtualKeyboardLetter(letter:String)
	{
		super();
		createBorder();
		createLabel(letter);
	}

	private function createBorder():void
	{
		addChild(new VIRTUAL_KEYBOARD_BG());
	}

	private function createLabel(letter:String):void
	{
		var textFormat:TextFormat = new TextFormat();
		textFormat.color = 0x000000;
		textFormat.font = "Arial";
		textFormat.bold = true;
		textFormat.size = 18;

		var label:TextField = new TextField();
		label.defaultTextFormat = textFormat;
		label.selectable = false;
		label.autoSize = TextFieldAutoSize.LEFT;
		label.text = letter;
		addChild(label);

		label.x = width / 2 - label.width / 2;
		label.y =  height / 2 - label.height / 2;
	}
}
}
