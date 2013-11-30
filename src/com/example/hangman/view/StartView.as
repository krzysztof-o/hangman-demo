package com.example.hangman.view
{
import com.example.hangman.event.GameEvent;
import com.example.hangman.view.ui.StartButton;
import com.example.hangman.view.ui.TextContainer;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

public class StartView extends Sprite
{
	private const RULES_TEXT:String = "" +
			"As the game starts choose one letter of the alphabet. Your goal is to guess the word.\n" +
			"With each incorrect letter an element of the gallows appears. When the gallows are complete - you loose.\n" +
			"If you guess the letter, that letter will be opened.";

	private var button:StartButton;

	public function StartView()
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}

	private function onAddedToStage(event:Event):void
	{
		removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

		createRules();
		createButton();
	}

	private function createButton():void
	{
		const MARGIN_RIGHT:Number = 20;
		button = new StartButton();
		button.x = stage.stageWidth - button.width - MARGIN_RIGHT;
		button.y = stage.stageHeight - 150;
		addChild(button);

		button.addEventListener(MouseEvent.CLICK, onClick);
	}

	private function onClick(event:MouseEvent):void
	{
		button.removeEventListener(MouseEvent.CLICK, onClick);
		dispatchEvent(new GameEvent(GameEvent.START));
	}

	private function createRules():void
	{
		const MARGIN:Number = 20;
		var textContainer:TextContainer = new TextContainer(RULES_TEXT, stage.stageWidth - MARGIN * 2);
		textContainer.x = MARGIN;
		textContainer.y = 75;
		addChild(textContainer);
	}

}
}
