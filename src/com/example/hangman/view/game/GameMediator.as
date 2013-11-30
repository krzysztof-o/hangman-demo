package com.example.hangman.view.game
{
import com.example.hangman.event.GameEvent;
import com.example.hangman.event.VirtualKeyboardEvent;
import com.example.hangman.model.RoundModel;
import com.example.hangman.model.WordsModel;

import robotlegs.bender.bundles.mvcs.Mediator;

public class GameMediator extends Mediator
{
	[Inject]
	public var view:GameView;
	[Inject]
	public var roundsModel:RoundModel;
	[Inject]
	public var wordsModel:WordsModel;

	override public function initialize():void
	{
		addContextListener(GameEvent.END, onGameEnd);
		addViewListener(VirtualKeyboardEvent.KEY_PRESSED, dispatch);

		view.setWord(roundsModel.currentWord);
		view.createGallows();
		view.createVirtualKeyboard(wordsModel.ALL_LETTERS);
	}

	private function onGameEnd(event:GameEvent):void
	{
		view.showPopup(event.won);
	}
}
}
