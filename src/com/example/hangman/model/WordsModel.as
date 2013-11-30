package com.example.hangman.model
{
public class WordsModel
{
	public const ALL_LETTERS:String = "abcdefghijklmnopqrstuvwxyz".toUpperCase();
	private var words:Vector.<String>;

	public function WordsModel()
	{
	}

	public function setWords(words:Vector.<String>):void
	{
		this.words = words;
	}

	public function getRandomWord():String
	{
		return words[Math.floor(Math.random() * words.length)];
	}

	public function isCorrectLetter(letter:String):Boolean
	{
		return ALL_LETTERS.indexOf(letter) >= 0;
	}
}
}
