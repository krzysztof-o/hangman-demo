package com.example.hangman.command
{
import com.example.hangman.event.ChangeScreenEvent;
import com.example.hangman.view.ErrorScreenView;

import flash.events.IEventDispatcher;

import robotlegs.bender.extensions.commandCenter.api.ICommand;

public class WordsLoadingErrorCommand implements ICommand
{
	[Inject]
	public var eventDispatcher:IEventDispatcher;

	public function execute():void
	{
		eventDispatcher.dispatchEvent(new ChangeScreenEvent(ChangeScreenEvent.CHANGE, new ErrorScreenView()));
	}
}
}
