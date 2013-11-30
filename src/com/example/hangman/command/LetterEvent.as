package com.example.hangman.command
{
import flash.events.Event;

public class LetterEvent extends Event
{
	public static const LETTER_GUESSED:String = "LetterEvent::LETTER_GUESSED";

	public var letter:String;
	public var guessed:Boolean;

	public function LetterEvent(type:String, letter:String, guessed:Boolean, bubbles:Boolean = false, cancelable:Boolean = false)
	{
		this.letter = letter;
		this.guessed = guessed;

		super(type, bubbles, cancelable);
	}

	override public function clone():Event
	{
		return new LetterEvent(type, letter, guessed, bubbles, cancelable);
	}
}
}
