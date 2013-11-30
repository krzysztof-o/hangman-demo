package com.example.hangman.view.ui
{
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

public class StartButton extends Sprite
{
	[Embed("/../assets/images/button.png")]
	private static const BUTTON:Class;
	[Embed("/../assets/images/button_over.png")]
	private static const BUTTON_OVER:Class;

	private var normalState:DisplayObject;
	private var overState:DisplayObject;

	public function StartButton()
	{
		super();
		buttonMode = true;
		useHandCursor = true;

		normalState = createState(BUTTON);
		overState = createState(BUTTON_OVER);
		refreshState(false);

		addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}

	private function createState(assetClass:Class):DisplayObject
	{
		var state:DisplayObject = new assetClass();
		addChild(state);
		return state;
	}

	private function onAddedToStage(event:Event):void
	{
		removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);

		addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
		addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
	}

	private function onRemovedFromStage(event:Event):void
	{
		addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
	}

	private function onMouseOut(event:MouseEvent):void
	{
		refreshState(false);
	}

	private function onMouseOver(event:MouseEvent):void
	{
		refreshState(true);
	}

	private function refreshState(isOver:Boolean):void
	{
		overState.visible = isOver;
		normalState.visible = !isOver;
	}

}
}
