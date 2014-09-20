package Worlds.classes.Title
{
	import DryErase.Cutscenes.Textbox;
	import DryErase.HUD.ControlsGUI;
	import DryErase.Hero.Title.ListenerTitle;
	
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;

	public class TitleWorld extends World
	{
		public var backGround:TitleBackground;
		public var menu:TitleMenu;
		public var title:Title;

		public function TitleWorld(flashOver:Boolean = true)
		{
			super();
			
			if (flashOver)
			{
				Utils.flash.start(0xFFFFFF,3);
			}
		}
		override public function begin():void
		{
			SoundManager.currentMusic = SoundManager.musicTitle;
			super.begin();
			backGround = new TitleBackground();
			menu = new TitleMenu();
			title = new Title();
			
			add(backGround);
			add(menu);
			add(title);
			add(new TitleTree());
			add(new ListenerTitle());
		}
	}
}
