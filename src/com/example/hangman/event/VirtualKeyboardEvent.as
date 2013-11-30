package com.example.hangman.event
{
import flash.events.Event;

public class VirtualKeyboardEvent extends Event
{
	public static const KEY_PRESSED:String = "VirtualKeyboardEvent::KEY_PRESSED";

	public var character:String;

	public function VirtualKeyboardEvent(type:String, character:String, bubbles:Boolean = false, cancelable:Boolean = false)
	{
		this.character = character;
		super(type, bubbles, cancelable);
	}

	override public function clone():Event
	{
		return new VirtualKeyboardEvent(type, character, bubbles, cancelable);
	}
}
}
