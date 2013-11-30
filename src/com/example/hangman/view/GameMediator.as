package com.example.hangman.view
{
import robotlegs.bender.bundles.mvcs.Mediator;

public class GameMediator extends Mediator
{
	[Inject]
	public var view:GameView;

	override public function initialize():void
	{
	}
}
}
