package com.example.hangman.view.game
{
import com.example.hangman.event.VirtualKeyboardEvent;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

public class VirtualKeyboardLetter extends Sprite
{
	[Embed("/../assets/images/virtual_keyboard_bg.png")]
	private static const VIRTUAL_KEYBOARD_BG:Class;

	private var character:String;

	public function VirtualKeyboardLetter(character:String)
	{
		this.character = character;
		super();
		createBorder();
		createLabel();

		buttonMode = true;
		useHandCursor = true;
		mouseChildren = false;
		addEventListener(MouseEvent.CLICK, onClick);
		addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
	}

	private function onClick(event:MouseEvent):void
	{
		dispatchEvent(new VirtualKeyboardEvent(VirtualKeyboardEvent.KEY_PRESSED, character, true));
	}

	private function onRemovedFromStage(event:Event):void
	{
		removeEventListener(MouseEvent.CLICK, onClick);
	}

	private function createBorder():void
	{
		addChild(new VIRTUAL_KEYBOARD_BG());
	}

	private function createLabel():void
	{
		var textFormat:TextFormat = new TextFormat();
		textFormat.color = 0x000000;
		textFormat.font = "Arial";
		textFormat.bold = true;
		textFormat.size = 18;

		var label:TextField = new TextField();
		label.defaultTextFormat = textFormat;
		label.selectable = false;
		label.autoSize = TextFieldAutoSize.LEFT;
		label.text = character;
		addChild(label);

		label.x = width / 2 - label.width / 2;
		label.y =  height / 2 - label.height / 2;
	}
}
}
