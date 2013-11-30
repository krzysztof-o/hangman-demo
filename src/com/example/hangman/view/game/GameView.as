package com.example.hangman.view.game
{
import com.example.hangman.view.ui.TextContainer;

import flash.display.Sprite;
import flash.text.TextFormatAlign;

public class GameView extends Sprite
{
	private const WON_TEXT:String = "Congratulations,\nyou guessed the word!";
	private const LOST_TEXT:String = "You lost :(";

	public function GameView()
	{
		super();
	}

	public function createGallows():void
	{
		const MARGIN_TOP:Number = 90;
		const MARGIN_LEFT:Number = 60;

		var gallows:Gallows = new Gallows();
		addChild(gallows);
		gallows.x = MARGIN_LEFT;
		gallows.y = MARGIN_TOP;
	}

	public function createVirtualKeyboard(letters:String):void
	{
		const MARGIN_RIGHT:Number = 5;
		const MARGIN_BOTTOM:Number = 35;

		var virtualKeyboard:VirtualKeyboard = new VirtualKeyboard(letters);
		addChild(virtualKeyboard);
		virtualKeyboard.x = stage.stageWidth - virtualKeyboard.width - MARGIN_RIGHT;
		virtualKeyboard.y = stage.stageHeight - virtualKeyboard.height - MARGIN_BOTTOM;
	}

	public function setWord(word:String):void
	{
		const MARGIN_TOP:Number = 55;
		var lettersContainer:WordLettersContainer = new WordLettersContainer(word);
		addChild(lettersContainer);
		lettersContainer.x = stage.stageWidth / 2 - lettersContainer.width / 2;
		lettersContainer.y = MARGIN_TOP;
	}

	public function showPopup(won:Boolean):void
	{
		var text:String = won ? WON_TEXT : LOST_TEXT;
		const MARGIN:Number = 50;
		var textContainer:TextContainer = new TextContainer(text, stage.stageWidth - MARGIN * 2, TextFormatAlign.CENTER);
		textContainer.x = stage.stageWidth / 2 - textContainer.width / 2;
		textContainer.y = stage.stageHeight / 2 - textContainer.height / 2;
		addChild(textContainer);
	}
}
}
