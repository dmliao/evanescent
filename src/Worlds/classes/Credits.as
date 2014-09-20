package Worlds.classes
{
	import DryErase.Cutscenes.FadeText;
	import Worlds.SplashScreen;
	
	import Worlds.classes.Title.MenuButton;
	import Worlds.classes.Title.TitleWorld;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;

	public class Credits extends World
	{
		public var selected:Boolean = false;
		public var noButtonText:MenuButton = new MenuButton("No");
		public var yesButtonText:MenuButton = new MenuButton("Yes");

		public var noButton:Entity = new Entity(320,300,noButtonText);
		public var yesButton:Entity = new Entity(320,360,yesButtonText);
		
		public var entity:FadeText = new FadeText("Do you want to restart the story?",false);
		
		public var activate:Boolean = false;
		public var image2:Image = new Image(Assets.TITLE_BACK);
		public var image:Image = new Image(Assets.CREDITS2);
		public var confirmed:Number = 0;
		public var confirmTimer:Number = 0;
		public var entity2:FadeText = new FadeText("");

		public function Credits()
		{
			add(new Entity(0,0,new Image(Assets.TITLE_BACK)));
			add(noButton);
			add(yesButton);
			image.alpha = 0;
			image2.alpha = 0;
			add(entity);
			add(new Entity(0,0,image));
			add(new Entity(0,0,image2));
		}
		override public function update():void
		{
			super.update();
			
			entity.update();
			noButtonText.update();
			yesButtonText.update();
			if (Input.pressed("up") || Input.pressed("down"))
			{
				selected = !selected;
			}
			if (selected)
			{
				noButtonText.selected = false;
				yesButtonText.selected = true;
			}
			else
			{
				noButtonText.selected = true;
				yesButtonText.selected = false;
			}
			if (confirmed != 0)
			{
				confirmTimer += FP.elapsed;
				image.alpha += 0.015;
			}
			if (confirmed == 0.5)
			{
				if (confirmTimer > 3)
				{
					confirmed = 1;
					confirmTimer  = 0;
				}
			}
			if (confirmTimer > 3 && confirmed == 1)
			{
				confirmTimer = 0;
				confirmed = 2;
				add(entity2);
			}
			if (confirmed == 3)
			{
				image2.alpha += 0.025;
				if (image2.alpha >= 1)
				{
					FP.world = new SplashScreen();
				}
			}
			if (Input.pressed("confirm"))
			{
				if (confirmed == 0)
				{
				if (selected)
				{
					Main.softDelete();
					Main.storyCleared = true;
					Main.saveGame();
					yesButtonText.text = "The story has restarted.";
					yesButtonText.centerOO();
					confirmed = 0.5;
					entity.deleteOut();
				}
				else
				{
					confirmed = 1;
					entity.deleteOut();
					Main.storyCleared = true;
					Main.saveGame();
				}
				}
				if (confirmed == 2 && entity2.deleted == true)
				{
					confirmed = 3;
				}
			}
		}
	}
}