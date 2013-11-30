package com.example.hangman.view.game
{
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

public class WordLetter extends Sprite
{
	public const BORDER_WIDTH:Number = 24;
	public const BORDER_HEIGHT:Number = 32;
	private var character:String;
	private var label:TextField;

	public function WordLetter(character:String)
	{
		this.character = character;
		super();
		createBorder();
		createLabel(character);
	}

	public function isGuessCorrect(character:String):Boolean
	{
		return character == this.character;
	}

	public function show():void
	{
		label.visible = true;
	}

	private function createBorder():void
	{
		graphics.beginFill(0xFFFFFF, .25);
		graphics.lineStyle(1, 0xFFFFFF);
		graphics.drawRect(0, 0, BORDER_WIDTH, BORDER_HEIGHT);
		graphics.endFill();
	}

	private function createLabel(letter:String):void
	{
		var textFormat:TextFormat = new TextFormat();
		textFormat.color = 0xFFFFFF;
		textFormat.font = "Arial";
		textFormat.bold = true;
		textFormat.size = 18;

		label = new TextField();
		label.defaultTextFormat = textFormat;
		label.selectable = false;
		label.autoSize = TextFieldAutoSize.LEFT;
		label.text = letter;
		label.visible = false;
		addChild(label);

		label.x = width / 2 - label.width / 2;
		label.y = height / 2 - label.height / 2;
	}
}
}
