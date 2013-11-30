package com.example.hangman.model
{
import com.example.hangman.util.StringUtils;

public class RoundModel
{
	public const MAX_WRONG_GUESSES:int = 7;
	public var currentWord:String;
	public var numberOfWrongGuesses:int;
	private var alreadyGuessedCharacters:Vector.<String>;

	public function RoundModel()
	{
	}

	public function clear():void
	{
		alreadyGuessedCharacters = new Vector.<String>();
		numberOfWrongGuesses = 0;
	}

	public function setCurrentWord(word:String):void
	{
		currentWord = StringUtils.clone(word.toUpperCase());
	}

	public function checkCharacter(character:String):Boolean
	{
		var correctGuess:Boolean = false;
		while(currentWord.indexOf(character) >= 0)
		{
			correctGuess = true;
			currentWord = currentWord.replace(character, "");
		}
		return correctGuess;
	}

	public function alreadyGuessed(character:String):Boolean
	{
		if(alreadyGuessedCharacters.indexOf(character) >= 0) return true;

		alreadyGuessedCharacters.push(character);
		return false;
	}

	public function wordIsGuessed():Boolean
	{
		return currentWord.length == 0;
	}
}
}
