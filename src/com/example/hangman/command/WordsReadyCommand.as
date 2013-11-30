package com.example.hangman.command
{
import com.example.hangman.event.ChangeScreenEvent;
import com.example.hangman.event.WordsServiceEvent;
import com.example.hangman.model.WordsModel;
import com.example.hangman.view.StartView;

import flash.events.IEventDispatcher;

import robotlegs.bender.extensions.commandCenter.api.ICommand;

public class WordsReadyCommand implements ICommand
{
	[Inject]
	public var event:WordsServiceEvent;
	[Inject]
	public var eventDispatcher:IEventDispatcher;
	[Inject]
	public var wordsModel:WordsModel;

	public function execute():void
	{
		wordsModel.setWords(event.words);

		eventDispatcher.dispatchEvent(new ChangeScreenEvent(ChangeScreenEvent.CHANGE, new StartView()));
	}
}
}
