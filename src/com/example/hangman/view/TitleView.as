package com.example.hangman.view
{
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

public class TitleView extends Sprite
{
	public function TitleView()
	{
		super();

		createLabel();
	}

	private function createLabel():void
	{
		var textFormat:TextFormat = new TextFormat();
		textFormat.color = 0xFFFFFF;
		textFormat.font = "Arial";
		textFormat.bold = true;
		textFormat.size = 22;

		var label:TextField = new TextField();
		label.defaultTextFormat = textFormat;
		label.selectable = false;
		label.autoSize = TextFieldAutoSize.LEFT;
		label.text = "Hangman Game";
		addChild(label);
	}
}
}
