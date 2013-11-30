package com.example.hangman.view.game
{
import flash.display.Sprite;
import flash.geom.Point;
import flash.utils.Dictionary;

public class VirtualKeyboard extends Sprite implements IGamePlayView
{
	private const MAX_PER_LINE:int = 8;
	private var lettersByCharacter:Dictionary;

	public function VirtualKeyboard(letters:String)
	{
		super();

		createLetters(letters);
	}

	private function createLetters(letters:String):void
	{
		lettersByCharacter = new Dictionary(true);

		const GAP:Number = 1;
		var position:Point = new Point();
		for(var i:uint = 0; i < letters.length; i++)
		{
			var letter:VirtualKeyboardLetter = createLetter(letters.charAt(i).toUpperCase());
			letter.x = position.x;
			letter.y = position.y;

			if((i + 1) % MAX_PER_LINE == 0)
			{
				position.x = 0;
				position.y += letter.height + GAP;
			}
			else
			{
				position.x += letter.width + GAP;
			}
		}
	}

	private function createLetter(character:String):VirtualKeyboardLetter
	{
		var letter:VirtualKeyboardLetter = new VirtualKeyboardLetter(character);
		addChild(letter);

		lettersByCharacter[character] = letter;

		return letter;
	}

	public function letterGuessed(character:String, guessed:Boolean):void
	{
		var letter:VirtualKeyboardLetter = lettersByCharacter[character];
		if (letter)
		{
			removeChild(letter);
			delete lettersByCharacter[character]
		}
	}
}
}
