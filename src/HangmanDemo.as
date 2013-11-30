package
{
import com.example.hangman.GameConfig;

import flash.display.Sprite;

import robotlegs.bender.bundles.mvcs.MVCSBundle;
import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.impl.Context;

[SWF(width="310", height="450")]
public class HangmanDemo extends Sprite
{
	private var context:IContext;

	public function HangmanDemo()
	{
		context = new Context()
				.install(MVCSBundle)
				.configure(GameConfig)
				.configure(new ContextView(this));
	}
}
}
