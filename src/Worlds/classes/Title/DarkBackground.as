package Worlds.classes.Title
{
	/**
	 * ...
	 * @author 
	 */
	
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	
	
	
	public class DarkBackground extends Entity
	{
		
		
		
		public var backgroundImage:Image;
		public var titleWave:Array = new Array(new Image(Assets.TW00), new Image(Assets.TW01), new Image(Assets.TW02), new Image(Assets.TW03), new Image(Assets.TW04));
		
		//Switch fading in and out
		public var alphas:Array = new Array(false,false,false,false,false);
		
		
		public function DarkBackground(l:Number = 5000)
		{
			layer = l;
			backgroundImage = new Image(Assets.DARK_BACK);
			graphic = backgroundImage;
			
			titleWave[0].alpha = Math.random();
			titleWave[1].alpha = Math.random();
			titleWave[2].alpha = Math.random();
			titleWave[3].alpha = Math.random();
			titleWave[4].alpha = Math.random();
			
			
			
		}
		
		override public function update():void
		{
			
			
			if (titleWave[0].alpha >=1)
			{
				alphas[0] = true;
			}
			if (titleWave[0].alpha <=0)
			{
				alphas[0] = false;
			}
			if (alphas[0] == false)
			{
				titleWave[0].alpha += 0.005;
			}
			else
			{
				titleWave[0].alpha -= 0.005;
			}
			
			if (titleWave[1].alpha >=1)
			{
				alphas[1] = true;
			}
			if (titleWave[1].alpha <=0)
			{
				alphas[1] = false;
			}
			if (alphas[1] == false)
			{
				titleWave[1].alpha += 0.005;
			}
			else
			{
				titleWave[1].alpha -= 0.007;
			}
			
			if (titleWave[2].alpha >=1)
			{
				alphas[2] = true;
			}
			if (titleWave[2].alpha <=0)
			{
				alphas[2] = false;
			}
			if (alphas[2] == false)
			{
				titleWave[2].alpha += 0.008;
			}
			else
			{
				titleWave[2].alpha -= 0.007;
			}
			
			if (titleWave[3].alpha >=1)
			{
				alphas[3] = true;
			}
			if (titleWave[3].alpha <=0)
			{
				alphas[3] = false;
			}
			if (alphas[3] == false)
			{
				titleWave[3].alpha += 0.005;
			}
			else
			{
				titleWave[3].alpha -= 0.003;
			}
			
			if (titleWave[4].alpha >=1)
			{
				alphas[4] = true;
			}
			if (titleWave[4].alpha <=0)
			{
				alphas[4] = false;
			}
			if (alphas[4] == false)
			{
				titleWave[4].alpha += 0.002;
			}
			else
			{
				titleWave[4].alpha -= 0.002;
			}
			
		}
		
		override public function render():void
		{
			super.render();
			titleWave[0].render(FP.buffer, new Point(0,0),FP.camera);
			titleWave[1].render(FP.buffer, new Point(0,0),FP.camera);
			titleWave[2].render(FP.buffer, new Point(0,0),FP.camera);
			titleWave[3].render(FP.buffer, new Point(0,0),FP.camera);
			titleWave[4].render(FP.buffer, new Point(0,0),FP.camera);
		}
	}
	
}// ActionScript file