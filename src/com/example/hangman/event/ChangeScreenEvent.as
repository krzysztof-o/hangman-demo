package com.example.hangman.event
{
import flash.display.DisplayObject;
import flash.events.Event;

public class ChangeScreenEvent extends Event
{
	public static const CHANGE:String = "ChangeScreenEvent::CHANGE";

	public var screen:DisplayObject;

	public function ChangeScreenEvent(type:String, screen:DisplayObject, bubbles:Boolean = false, cancelable:Boolean = false)
	{
		this.screen = screen;
		super(type, bubbles, cancelable);
	}

	override public function clone():Event
	{
		return new ChangeScreenEvent(type, screen, bubbles, cancelable);
	}
}
}
