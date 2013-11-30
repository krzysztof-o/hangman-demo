package com.example.hangman.view
{
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.Event;

public class MainView extends Sprite
{
	[Embed("/../assets/images/bg.jpg")]
	private static const BG:Class;
	[Embed("/../assets/images/hangman.png")]
	private static const HANGMAN:Class;

	private var currentScreen:DisplayObject;
	private var bg:DisplayObject;

	public function MainView()
	{
		addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}

	private function onAddedToStage(event:Event):void
	{
		removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

		createBackground();
		createHangman();
		createCounter();
		createTitle();
	}

	public function changeScreen(screen:DisplayObject):void
	{
		if(currentScreen)
		{
			removeChild(currentScreen);
		}

		addChildAt(screen, getChildIndex(bg) + 1);
		currentScreen = screen;
	}

	private function createTitle():void
	{
		const MARGIN:Number = 20;
		var title:TitleView = new TitleView();
		addChild(title);
		title.x = MARGIN;
		title.y = MARGIN;
	}

	private function createCounter():void
	{
		const MARGIN:Number = 5;
		var counter:CounterView = new CounterView();
		addChild(counter);
		counter.y = stage.stageHeight - counter.height - MARGIN;
	}

	private function createHangman():void
	{
		const MARGIN_LEFT:Number = 5;
		var hangman:DisplayObject = new HANGMAN();
		addChild(hangman);
		hangman.x = MARGIN_LEFT;
		hangman.y = stage.stageHeight - hangman.height;
	}

	private function createBackground():void
	{
		bg = new BG();
		addChild(bg);
	}
}
}
