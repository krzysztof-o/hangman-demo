package com.example.hangman.view.game
{
import com.example.hangman.command.LetterEvent;

import flash.events.KeyboardEvent;

import robotlegs.bender.bundles.mvcs.Mediator;
import robotlegs.bender.extensions.contextView.ContextView;

public class GamePlayMediator extends Mediator
{
	[Inject]
	public var view:IGamePlayView;
	[Inject]
	public var contextView:ContextView;

	override public function initialize():void
	{
		addContextListener(LetterEvent.LETTER_GUESSED, onLetterGuessed);
	}

	private function onLetterGuessed(event:LetterEvent):void
	{
		view.letterGuessed(event.letter, event.guessed);
	}
}
}
