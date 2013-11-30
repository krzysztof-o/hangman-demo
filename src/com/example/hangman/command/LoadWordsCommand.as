package com.example.hangman.command
{
import com.example.hangman.service.IWordsService;

import robotlegs.bender.extensions.commandCenter.api.ICommand;

public class LoadWordsCommand implements ICommand
{
	[Inject]
	public var wordsService:IWordsService;

	public function execute():void
	{
		wordsService.load();
	}
}
}
