package com.example.hangman.view
{
import com.example.hangman.view.ui.TextContainer;

import flash.display.Sprite;
import flash.events.Event;

public class ErrorScreenView extends Sprite
{
	public function ErrorScreenView()
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}

	private function onAddedToStage(event:Event):void
	{
		const MARGIN:Number = 20;
		var textContainer:TextContainer = new TextContainer("Error occurred.", stage.stageWidth - MARGIN * 2);
		textContainer.x = MARGIN;
		textContainer.y = stage.stageHeight / 2 - textContainer.height / 2;
		addChild(textContainer);
	}
}
}
