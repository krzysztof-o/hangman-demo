package com.example.hangman.service
{
import com.example.hangman.event.WordsServiceEvent;

import flash.events.Event;
import flash.events.IEventDispatcher;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;
import flash.net.URLLoader;
import flash.net.URLRequest;

public class WordsService implements IWordsService
{
	[Inject]
	public var eventDispatcher:IEventDispatcher;
	private var urlLoader:URLLoader;
	private const WORDS_FILE_PATH:String = "words.txt";

	public function WordsService()
	{
	}

	public function load():void
	{
		urlLoader = new URLLoader();
		urlLoader.addEventListener(Event.COMPLETE, onComplete);
		urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
		urlLoader.addEventListener(IOErrorEvent.IO_ERROR, onIOErrorHandler);
		urlLoader.load(new URLRequest(WORDS_FILE_PATH));
	}

	private function removeListeners():void
	{
		urlLoader.addEventListener(Event.COMPLETE, onComplete);
		urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
		urlLoader.addEventListener(IOErrorEvent.IO_ERROR, onIOErrorHandler);

	}

	private function onComplete(event:Event):void
	{
		removeListeners();
		var data:Array = urlLoader.data.split(/\r\n|\r|\n/);
		var words:Vector.<String> = Vector.<String>(data);

		eventDispatcher.dispatchEvent(new WordsServiceEvent(WordsServiceEvent.READY, words));
	}

	private function onSecurityError(event:SecurityErrorEvent):void
	{
		removeListeners();
		eventDispatcher.dispatchEvent(new WordsServiceEvent(WordsServiceEvent.LOADING_ERROR));
	}

	private function onIOErrorHandler(event:IOErrorEvent):void
	{
		removeListeners();
		eventDispatcher.dispatchEvent(new WordsServiceEvent(WordsServiceEvent.LOADING_ERROR));
	}
}
}
