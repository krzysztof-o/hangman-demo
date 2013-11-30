package com.example.hangman.event
{
import flash.events.Event;

public class WordsServiceEvent extends Event
{
	public static const LOAD:String = "WordsServiceEvent::LOAD";
	public static const LOADING_ERROR:String = "WordsServiceEvent::LOADING_ERROR";
	public static const READY:String = "WordsServiceEvent::READY";

	public var words:Vector.<String>;

	public function WordsServiceEvent(type:String, words:Vector.<String> = null, bubbles:Boolean = false, cancelable:Boolean = false)
	{
		this.words = words;
		super(type, bubbles, cancelable);
	}

	override public function clone():Event
	{
		return new WordsServiceEvent(type, words, bubbles, cancelable);
	}
}
}
