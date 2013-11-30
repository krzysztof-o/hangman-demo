package com.example.hangman.view
{
import flash.display.Sprite;

public class MainView extends Sprite
{
	[Embed("/../assets/images/bg.jpg")]
	private static const BG:Class;

	public function MainView()
	{
		createBackground();
	}

	private function createBackground():void
	{
		addChild(new BG());
	}
}
}
