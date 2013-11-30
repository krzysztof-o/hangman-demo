package com.example.hangman.view
{
import flash.display.Sprite;
import flash.events.Event;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;

public class ErrorScreenView extends Sprite
{
	public function ErrorScreenView()
	{
		super();

		addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}

	private function onAddedToStage(event:Event):void
	{
		removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		createLabel();
		setPosition();
	}

	private function setPosition():void
	{
		x = stage.stageWidth / 2 - width / 2;
		y = stage.stageHeight / 2 - height / 2;
	}

	private function createLabel():void
	{
		var textFormat:TextFormat = new TextFormat();
		textFormat.color = 0xFFFFFF;
		textFormat.font = "Arial";
		textFormat.size = 25;
		textFormat.align = TextFormatAlign.CENTER;

		var label:TextField = new TextField();
		label.defaultTextFormat = textFormat;
		label.selectable = false;
		label.autoSize = TextFieldAutoSize.LEFT;
		label.text = "Some error\noccurred.";
		addChild(label);
	}
}
}
