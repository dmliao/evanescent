package DryErase.HUD
{
	import Worlds.classes.Endless;
	
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class LivesHUD extends Entity
	{
		public var image:Image = new Image(Assets.PLAYER_AVATAR);
		public function LivesHUD()
		{
			layer = -99999999;
			
		}
		override public function render():void
		{
			switch (Endless.lives)
			{
				case 0:
				{
					
				}break;
				case 1:
				{
					image.render(FP.buffer,new Point(16,432),FP.camera);	
				}break;
				case 2:
				{
					image.render(FP.buffer,new Point(16,432),FP.camera);
					image.render(FP.buffer,new Point(64,432),FP.camera);
					
				}break;
			
				case 3:
				{
					image.render(FP.buffer,new Point(16,432),FP.camera);
					image.render(FP.buffer,new Point(64,432),FP.camera);
					image.render(FP.buffer,new Point(112,432),FP.camera);
				}break;
			}
			
		}
	}
}