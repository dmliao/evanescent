package DryErase.Enemies.Mountain.Enemies
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class MinibossMFly extends Entity
	{
	
		public var iImage:Image;
		public var rImage:Image;
		public function MinibossMFly(xx:Number,yy:Number,dir:Number,field:Boolean)
		{
			
			x = xx;
			y = yy;
			
			
			
			iImage = new Image(Assets.M_MBOSS_IMAG);
			iImage.smooth = true;
			iImage.centerOO();
			iImage.alpha = 1;
			rImage = new Image(Assets.M_MBOSS_REAL);
			rImage.smooth = true;
			rImage.centerOO();
			rImage.alpha = 1;
			
			iImage.angle = dir;
			rImage.angle = dir;
			if (field ==false)
			{
				
				graphic = iImage;
				
			}
			else
			{
				layer = -(y - FP.camera.y) * 1.5;
				graphic = rImage;
			}
			layer = -(y - FP.camera.y) * 1.5-1;
		}
		
		override public function update():void
		{
			y += 6 * Main.frameRate * FP.elapsed;
			iImage.alpha -= 0.02 * Main.frameRate * FP.elapsed;
			rImage.alpha -= 0.02 * Main.frameRate * FP.elapsed;
			iImage.scale += 0.03 * Main.frameRate * FP.elapsed;
			rImage.scale += 0.03 * Main.frameRate * FP.elapsed;
			if (iImage.alpha <= 0.0)
			{
				FP.world.remove(this);
			}
		}
	}
}