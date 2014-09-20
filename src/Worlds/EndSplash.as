package Worlds
{
	import DryErase.Cutscenes.Textbox;
	import flash.display.Stage;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import Worlds.classes.Title.TitleWorld;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;

	public class EndSplash extends World
	{
		private var splashTimer:Number = 0;
		private var whiteImage:Image = new Image(Assets.TITLE_BACK);
		
		private var text:Text = new Text("Game has been sitelocked. Click anywhere to go to the Evanescent website and play the game.");

		public function EndSplash()
		{
			
			Utils.flash.start(0xFFFFFF,2,1);
			add(new Entity(0,0,new Image(Assets.SPLASHSCREEN)));
			whiteImage.alpha = 0;
			add(new Entity(0, 0, whiteImage));
			
			
			add(new Entity(320, 420, text));
			text.color = 0x000000;
			text.size = 13;
			text.width = 300;
			text.height = 200;
			text.wordWrap = true;
			text.width = 300;
			text.height = 200;
			text.font = "mainFont";
			text.centerOO();
			text.align = "center";
		}
		override public function update():void
		{
			FP.engine.buttonMode = true;
			if (Input.mousePressed)
			{
				Utils.openURL("http://www.beastamorphous.com/games/evanescent/evanescent.html");
			}
			
		}
	}
}