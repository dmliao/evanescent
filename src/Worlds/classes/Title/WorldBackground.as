package Worlds.classes.Title
{
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class WorldBackground extends Entity
	{
		
		[Embed(source = 'assets/VoidMap.png')]
		private const VOID:Class;
		
		[Embed(source = 'assets/CloudMap.png')]
		private const CLOUD:Class;
		
		public var titleImage:Image;
		public var voidImage:Image;
		public var cloudImage:Image;
		
		public var showCloud:Boolean = true;
		public var showVoid:Boolean = false;
		public function WorldBackground()
		{
			layer = 50;
			titleImage = new Image(Assets.WORLDMAP);
			voidImage = new Image(VOID);
			cloudImage = new Image(CLOUD);
			graphic = titleImage;
			setHitbox(200,200,-440,-280);
			type = "cloud";
		}
		
		override public function render():void
		{
			super.render();
			if (Main.levelsCompleted >= 4)
			{
				Main.castleOpen = true;
			}
			else
			{
				Main.castleOpen = false;
			}
			if (Main.levelsCompleted >= 5)
			{
				Main.emptyOpen = true;
			}
			else
			{
				Main.emptyOpen = false;
			}
			if (Main.emptyOpen || Main.isArcade)
			{
			voidImage.render(FP.buffer, new Point(0,0), FP.camera);
			}
			if (!Main.castleOpen && !Main.isArcade)
			{
				cloudImage.render(FP.buffer, new Point(0,0), FP.camera);
				type = "cloud";
			}
			else
			{
				type = "none";
			}
		}
	}
}