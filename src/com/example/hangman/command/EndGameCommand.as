package com.example.hangman.command
{
import com.example.hangman.event.ChangeScreenEvent;
import com.example.hangman.event.GameEvent;
import com.example.hangman.model.GameModel;
import com.example.hangman.view.StartView;

import flash.events.IEventDispatcher;
import flash.events.KeyboardEvent;
import flash.media.Sound;
import flash.utils.setTimeout;

import robotlegs.bender.extensions.commandCenter.api.ICommand;
import robotlegs.bender.extensions.contextView.ContextView;

public class EndGameCommand implements ICommand
{
	[Embed("/../assets/sounds/win.mp3")]
	private static const WIN_SOUND:Class;
	[Embed("/../assets/sounds/lose.mp3")]
	private static const LOSE_SOUND:Class;
	[Inject]
	public var eventDispatcher:IEventDispatcher;
	[Inject]
	public var contextView:ContextView;
	[Inject]
	public var event:GameEvent;
	[Inject]
	public var gameModel:GameModel;

	public function execute():void
	{
		contextView.view.stage.removeEventListener(KeyboardEvent.KEY_DOWN, eventDispatcher.dispatchEvent);

		if(event.won)
		{
			gameModel.won++;
			playSound(WIN_SOUND);
		}
		else
		{
			gameModel.lost++;
			playSound(LOSE_SOUND);
		}

		setTimeout(showStartScreen, 6000);
	}

	private function playSound(soundClass:Class):void
	{
		var sound:Sound = new soundClass();
		sound.play();
	}

	private function showStartScreen():void
	{
		eventDispatcher.dispatchEvent(new ChangeScreenEvent(ChangeScreenEvent.CHANGE, new StartView()));
	}
}
}
