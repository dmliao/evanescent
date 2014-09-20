package Worlds
{
	import DryErase.Cutscenes.scenes.BeforeScene;
	
	import Worlds.classes.CutsceneWorld;
	import Worlds.classes.Title.TitleWorld;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;

	public class SplashScreen extends World
	{
		private var splashTimer:Number = 0;
		private var whiteImage:Image = new Image(Assets.TITLE_BACK);

		public function SplashScreen()
		{
			
			Utils.flash.start(0xFFFFFF,2,1);
			add(new Entity(0,0,new Image(Assets.SPLASHSCREEN)));
			whiteImage.alpha = 0;
			add(new Entity(0, 0, whiteImage));
			
		}
		override public function update():void
		{
			
			splashTimer += FP.elapsed;
			if (splashTimer > 3)
			{
				whiteImage.alpha += 0.015 * Main.frameRate * FP.elapsed;
			}
			if (splashTimer > 4.5)
			{
				FP.world = new CutsceneWorld(new BeforeScene(),false);
				//FP.world = new TitleWorld();
			}
		
		}
	}
}