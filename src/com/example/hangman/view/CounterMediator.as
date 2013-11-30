package com.example.hangman.view
{
import com.example.hangman.event.GameEvent;
import com.example.hangman.model.GameModel;

import robotlegs.bender.bundles.mvcs.Mediator;

public class CounterMediator extends Mediator
{
	[Inject]
	public var view:CounterView;

	[Inject]
	public var gameModel:GameModel;

	override public function initialize():void
	{
		addContextListener(GameEvent.END, refreshResults);
		refreshResults();
	}

	private function refreshResults(event:GameEvent = null):void
	{
		view.setResults(gameModel.won, gameModel.lost);
	}
}
}
