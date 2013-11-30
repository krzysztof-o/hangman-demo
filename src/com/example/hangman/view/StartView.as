package com.example.hangman.view
{
import flash.display.Sprite;
import flash.events.Event;

public class StartView extends Sprite
{
	public function StartView()
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}

	private function onAddedToStage(event:Event):void
	{
		removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);


	}
}
}
