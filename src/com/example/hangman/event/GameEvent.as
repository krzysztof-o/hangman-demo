package com.example.hangman.event
{
import flash.events.Event;

public class GameEvent extends Event
{
	public static const START:String = "GameEvent::START";

	public function GameEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
	{
		super(type, bubbles, cancelable);
	}

	override public function clone():Event
	{
		return new GameEvent(type, bubbles, cancelable);
	}
}
}
