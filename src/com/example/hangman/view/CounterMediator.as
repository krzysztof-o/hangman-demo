package com.example.hangman.view
{
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
		refreshResults();
	}

	private function refreshResults():void
	{
		view.setResults(gameModel.won, gameModel.lost);
	}
}
}
