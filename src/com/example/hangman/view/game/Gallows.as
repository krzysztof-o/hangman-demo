package com.example.hangman.view.game
{
import flash.display.DisplayObject;
import flash.display.Sprite;

public class Gallows extends Sprite implements IGamePlayView
{
	[Embed("/../assets/images/gibbet/part1.png")]
	private static const PART_1:Class;
	[Embed("/../assets/images/gibbet/part2.png")]
	private static const PART_2:Class;
	[Embed("/../assets/images/gibbet/part3.png")]
	private static const PART_3:Class;
	[Embed("/../assets/images/gibbet/part4.png")]
	private static const PART_4:Class;
	[Embed("/../assets/images/gibbet/part5.png")]
	private static const PART_5:Class;
	[Embed("/../assets/images/gibbet/part6.png")]
	private static const PART_6:Class;
	[Embed("/../assets/images/gibbet/part7.png")]
	private static const PART_7:Class;

	private var parts:Vector.<Class> = new <Class>[PART_1, PART_2, PART_3, PART_4, PART_5, PART_6, PART_7];

	public function Gallows()
	{
		super();
	}

	public function letterGuessed(letter:String, correct:Boolean):void
	{
		if (correct) return;
		if (parts.length == 0) return;

		var partClass:Class = parts.shift();
		var part:DisplayObject = new partClass();
		addChild(part);
	}
}
}
