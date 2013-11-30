package com.example.hangman.view
{
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

public class CounterView extends Sprite
{
	private var label:TextField;

	public function CounterView()
	{
		createLabel();
	}

	public function setResults(won:int, lost:int):void
	{
		label.text = "Won: " + won + " Lost: " + lost;
		label.x = stage.stageWidth / 2 - label.width / 2;
	}

	private function createLabel():void
	{
		var textFormat:TextFormat = new TextFormat();
		textFormat.color = 0xFFFFFF;
		textFormat.font = "Arial";
		textFormat.size = 12;

		label = new TextField();
		label.defaultTextFormat = textFormat;
		label.selectable = false;
		label.autoSize = TextFieldAutoSize.LEFT;
		addChild(label);
	}
}
}
