package com.example.hangman.view.ui
{
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

public class TextContainer extends Sprite
{
	private const PADDING:Number = 10;
	private var label:TextField;

	public function TextContainer(text:String, width:Number)
	{
		super();

		createText(text, width);
		createBg();
	}

	private function createText(text:String, width:Number):void
	{
		var textFormat:TextFormat = new TextFormat();
		textFormat.color = 0x000000;
		textFormat.font = "Arial";
		textFormat.size = 18;

		label = new TextField();
		label.defaultTextFormat = textFormat;
		label.selectable = false;
		label.wordWrap = true;
		label.multiline = true;
		label.autoSize = TextFieldAutoSize.LEFT;
		label.width = width - PADDING * 2;
		label.text = text;
		addChild(label);

		label.x = PADDING;
		label.y = PADDING;
	}

	private function createBg():void
	{
		var bg:Sprite = new Sprite();
		bg.graphics.beginFill(0xFFFFFF, .75);
		bg.graphics.lineStyle(2, 0xFFFFFF);
		bg.graphics.drawRoundRect(0, 0, label.width + PADDING * 2, label.height + PADDING * 2, 20, 20);
		bg.graphics.endFill();
		addChildAt(bg, 0);
	}
}
}
