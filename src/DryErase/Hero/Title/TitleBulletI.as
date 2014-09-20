package DryErase.Hero.Title
{
	/**
	 * ...
	 * @author 
	 */
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	 
	public class TitleBulletI extends Entity
	{
		
		//INITIALIZE IMAGES
		private var currentImage:Image;
		
		private var scaleFactor:Number;
		
		public function TitleBulletI() 
		{
			currentImage = new Image(Assets.TITLEBULLET);	
			currentImage.centerOO();
			currentImage.smooth = true;
			
			currentImage.alpha = 0;
			
			type = "bullet_imagination";
			
			layer = 500;
			
			setHitbox(16, 64, 8, 38);
		}
		
		override public function update():void 
		{
			
			if (y <0)
			{
				FP.world.remove(this);
				
			}
			else
			{
				y -= 12;
				//UPDATING
				
				graphic = currentImage;
				
				if (currentImage.alpha < 0.3)
				{
					currentImage.alpha += 0.05 + ((layer + 800) / 5000);
				}
				currentImage.scale = 1 - (( -(y - FP.camera.y) + 600) / 1000);
				
				
			}
			
		}
		
			
	}
}

