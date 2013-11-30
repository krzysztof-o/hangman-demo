package com.example.hangman.command
{
import com.example.hangman.event.ChangeScreenEvent;
import com.example.hangman.model.RoundModel;
import com.example.hangman.model.WordsModel;
import com.example.hangman.view.game.GameView;

import flash.events.IEventDispatcher;
import flash.events.KeyboardEvent;

import robotlegs.bender.extensions.commandCenter.api.ICommand;
import robotlegs.bender.extensions.contextView.ContextView;

public class StartGameCommand implements ICommand
{
	[Inject]
	public var eventDispatcher:IEventDispatcher;
	[Inject]
	public var contextView:ContextView;
	[Inject]
	public var roundModel:RoundModel;
	[Inject]
	public var wordsModel:WordsModel;

	public function execute():void
	{
		roundModel.clear();
		roundModel.setCurrentWord(wordsModel.getRandomWord());

		eventDispatcher.dispatchEvent(new ChangeScreenEvent(ChangeScreenEvent.CHANGE, new GameView()));
		contextView.view.stage.addEventListener(KeyboardEvent.KEY_DOWN, eventDispatcher.dispatchEvent);
		contextView.view.stage.focus = contextView.view.stage;
	}
}
}
