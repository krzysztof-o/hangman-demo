package com.example.hangman.command
{
import com.example.hangman.event.VirtualKeyboardEvent;

import flash.events.IEventDispatcher;
import flash.events.KeyboardEvent;

import robotlegs.bender.extensions.commandCenter.api.ICommand;

public class KeyPressedCommand implements ICommand
{
	[Inject]
	public var eventDispatcher:IEventDispatcher;
	[Inject]
	public var event:KeyboardEvent;

	public function execute():void
	{
		var character:String = String.fromCharCode(event.charCode);
		eventDispatcher.dispatchEvent(new VirtualKeyboardEvent(VirtualKeyboardEvent.KEY_PRESSED, character));
	}
}
}
