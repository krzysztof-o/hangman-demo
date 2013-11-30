package com.example.hangman
{
import com.example.hangman.command.EndGameCommand;
import com.example.hangman.command.KeyPressedCommand;
import com.example.hangman.command.VirtualKeyPressedCommand;
import com.example.hangman.command.LoadWordsCommand;
import com.example.hangman.command.StartGameCommand;
import com.example.hangman.command.WordsLoadingErrorCommand;
import com.example.hangman.command.WordsReadyCommand;
import com.example.hangman.event.GameEvent;
import com.example.hangman.event.VirtualKeyboardEvent;
import com.example.hangman.event.WordsServiceEvent;
import com.example.hangman.model.GameModel;
import com.example.hangman.model.RoundModel;
import com.example.hangman.model.WordsModel;
import com.example.hangman.service.IWordsService;
import com.example.hangman.service.WordsService;
import com.example.hangman.view.CounterMediator;
import com.example.hangman.view.CounterView;
import com.example.hangman.view.game.GameMediator;
import com.example.hangman.view.game.GameView;
import com.example.hangman.view.MainMediator;
import com.example.hangman.view.MainView;
import com.example.hangman.view.StartMediator;
import com.example.hangman.view.StartView;
import com.example.hangman.view.game.GamePlayMediator;
import com.example.hangman.view.game.IGamePlayView;

import flash.events.IEventDispatcher;
import flash.events.KeyboardEvent;

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
		injector.map(WordsModel).asSingleton();
		injector.map(GameModel).asSingleton();
		injector.map(RoundModel).asSingleton();

		commandMap.map(WordsServiceEvent.LOAD).toCommand(LoadWordsCommand);
		commandMap.map(WordsServiceEvent.LOADING_ERROR).toCommand(WordsLoadingErrorCommand);
		commandMap.map(WordsServiceEvent.READY).toCommand(WordsReadyCommand);

		commandMap.map(GameEvent.START).toCommand(StartGameCommand);
		commandMap.map(GameEvent.END).toCommand(EndGameCommand);
		commandMap.map(VirtualKeyboardEvent.KEY_PRESSED).toCommand(VirtualKeyPressedCommand);
		commandMap.map(KeyboardEvent.KEY_DOWN).toCommand(KeyPressedCommand);

		mediatorMap.map(MainView).toMediator(MainMediator);
		mediatorMap.map(StartView).toMediator(StartMediator);
		mediatorMap.map(CounterView).toMediator(CounterMediator);
		mediatorMap.map(GameView).toMediator(GameMediator);
		mediatorMap.map(IGamePlayView).toMediator(GamePlayMediator);

		contextView.view.addChild(new MainView());
		eventDispatcher.dispatchEvent(new WordsServiceEvent(WordsServiceEvent.LOAD));
	}
}
}
