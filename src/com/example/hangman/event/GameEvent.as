package com.example.hangman.event
{
import flash.events.Event;

public class GameEvent extends Event
{
	public static const START:String = "GameEvent::START";
	public static const END:String = "GameEvent::END";

	public var won:Boolean;

	public function GameEvent(type:String, won:Boolean = false, bubbles:Boolean = false, cancelable:Boolean = false)
	{
		this.won = won;
		super(type, bubbles, cancelable);
	}

	override public function clone():Event
	{
		return new GameEvent(type, won, bubbles, cancelable);
	}
}
}
