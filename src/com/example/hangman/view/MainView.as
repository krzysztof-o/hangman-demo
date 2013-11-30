package com.example.hangman.view
{
import flash.display.DisplayObject;
import flash.display.Sprite;

public class MainView extends Sprite
{
	[Embed("/../assets/images/bg.jpg")]
	private static const BG:Class;
	private var currentScreen:DisplayObject;

	public function MainView()
	{
		createBackground();
	}

	public function changeScreen(screen:DisplayObject):void
	{
		if(currentScreen)
		{
			removeChild(currentScreen);
		}

		addChild(screen);
		currentScreen = screen;
	}

	private function createBackground():void
	{
		addChild(new BG());
	}
}
}
