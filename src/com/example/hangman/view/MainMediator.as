package com.example.hangman.view
{
import com.example.hangman.event.ChangeScreenEvent;

import flash.display.DisplayObject;

import robotlegs.bender.bundles.mvcs.Mediator;

public class MainMediator extends Mediator
{
	[Inject]
	public var view:MainView;

	override public function initialize():void
	{
		addContextListener(ChangeScreenEvent.CHANGE, onScreenChange);
	}

	private function onScreenChange(event:ChangeScreenEvent):void
	{
		view.changeScreen(event.screen);
	}
}
}
