package com.example.hangman.view.game
{
import flash.display.Sprite;

public class WordLettersContainer extends Sprite implements IGamePlayView
{
	private var letters:Vector.<WordLetter>;
	public function WordLettersContainer(word:String)
	{
		createLetters(word);
	}

	public function letterGuessed(character:String, guessed:Boolean):void
	{
		for (var i:uint = 0; i < letters.length; i++)
		{
			if (letters[i].isGuessCorrect(character))
			{
				letters[i].show();
			}
		}
	}

	private function createLetters(word:String):void
	{
		letters = new Vector.<WordLetter>();
		var dx:Number = 0;
		const GAP:Number = 20;

		for(var i:uint = 0; i < word.length; i++)
		{
			var letter:WordLetter = new WordLetter(word.charAt(i).toUpperCase());
			letters.push(letter);
			letter.x = dx;
			dx += letter.width + GAP;
			addChild(letter);
		}
	}
}
}
