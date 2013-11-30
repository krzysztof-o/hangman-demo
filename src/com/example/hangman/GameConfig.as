package com.example.hangman
{
import com.example.hangman.command.LoadWordsCommand;
import com.example.hangman.command.StartGameCommand;
import com.example.hangman.command.WordsLoadingErrorCommand;
import com.example.hangman.command.WordsReadyCommand;
import com.example.hangman.event.GameEvent;
import com.example.hangman.event.WordsServiceEvent;
import com.example.hangman.model.GameModel;
import com.example.hangman.service.IWordsService;
import com.example.hangman.service.WordsService;
import com.example.hangman.view.CounterMediator;
import com.example.hangman.view.CounterView;
import com.example.hangman.view.GameMediator;
import com.example.hangman.view.GameView;
import com.example.hangman.view.MainMediator;
import com.example.hangman.view.MainView;
import com.example.hangman.view.StartMediator;
import com.example.hangman.view.StartView;

import flash.events.IEventDispatcher;

import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

public class GameConfig implements IConfig
{
	[Inject]
	public var injector:IInjector;
	[Inject]
	public var mediatorMap:IMediatorMap;
	[Inject]
	public var commandMap:IEventCommandMap;
	[Inject]
	public var contextView:ContextView;
	[Inject]
	public var eventDispatcher:IEventDispatcher;

	public function configure():void
	{
		injector.map(IWordsService).toType(WordsService);
		injector.map(GameModel).asSingleton();

		commandMap.map(WordsServiceEvent.LOAD).toCommand(LoadWordsCommand);
		commandMap.map(WordsServiceEvent.LOADING_ERROR).toCommand(WordsLoadingErrorCommand);
		commandMap.map(WordsServiceEvent.READY).toCommand(WordsReadyCommand);

		commandMap.map(GameEvent.START).toCommand(StartGameCommand);

		mediatorMap.map(MainView).toMediator(MainMediator);
		mediatorMap.map(StartView).toMediator(StartMediator);
		mediatorMap.map(CounterView).toMediator(CounterMediator);
		mediatorMap.map(GameView).toMediator(GameMediator);

		contextView.view.addChild(new MainView());
		eventDispatcher.dispatchEvent(new WordsServiceEvent(WordsServiceEvent.LOAD));
	}
}
}
