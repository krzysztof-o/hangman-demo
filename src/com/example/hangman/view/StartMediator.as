package com.example.hangman.view
{
import com.example.hangman.event.GameEvent;

import robotlegs.bender.bundles.mvcs.Mediator;

public class StartMediator extends Mediator
{
	[Inject]
	public var view:StartView;

	override public function initialize():void
	{
		addViewListener(GameEvent.START, dispatch);
	}
}
}
