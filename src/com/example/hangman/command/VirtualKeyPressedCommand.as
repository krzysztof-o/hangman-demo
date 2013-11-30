package com.example.hangman.command
{
import com.example.hangman.event.GameEvent;
import com.example.hangman.event.VirtualKeyboardEvent;
import com.example.hangman.model.RoundModel;
import com.example.hangman.model.WordsModel;

import flash.events.IEventDispatcher;
import flash.media.Sound;

import robotlegs.bender.extensions.commandCenter.api.ICommand;

public class VirtualKeyPressedCommand implements ICommand
{
	[Inject]
	public var event:VirtualKeyboardEvent;
	[Inject]
	public var wordsModel:WordsModel;
	[Inject]
	public var eventDispatcher:IEventDispatcher;
	[Inject]
	public var roundModel:RoundModel;

	[Embed("/../assets/sounds/click.mp3")]
	private static const CLICK_SOUND:Class;

	public function execute():void
	{
		var character:String = event.character.toUpperCase();
		if(!wordsModel.isCorrectLetter(character)) return;
		if(roundModel.alreadyGuessed(character)) return;

		playSound();

		var guessed:Boolean = roundModel.checkCharacter(character);
		eventDispatcher.dispatchEvent(new LetterEvent(LetterEvent.LETTER_GUESSED, character, guessed));

		if(guessed)
		{
			checkWin();
		}
		else
		{
			checkLoss();
		}

	}

	private function playSound():void
	{
		var sound:Sound = new CLICK_SOUND();
		sound.play();
	}

	private function checkWin():void
	{
		if(roundModel.wordIsGuessed())
		{
			eventDispatcher.dispatchEvent(new GameEvent(GameEvent.END, true));
		}
	}

	private function checkLoss():void
	{
		roundModel.numberOfWrongGuesses++;
		if(roundModel.numberOfWrongGuesses >= roundModel.MAX_WRONG_GUESSES)
		{
			eventDispatcher.dispatchEvent(new GameEvent(GameEvent.END, false));
		}

	}
}
}
