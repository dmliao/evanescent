package DryErase.Effects
{
	/**
	 * ...
	 * @author 
	 */
	import DryErase.Hero.Listener;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.masks.PreRotatedMask;
	 
	public class Laser extends Entity
	{
		
		//INITIALIZE IMAGES
		private var LImage:Spritemap = new Spritemap(Assets.LASER,96,480);
		private var hero:Listener;
		private var scaleFactor:Number;
		
		public function Laser() 
		{
			LImage.add("laser", [0, 1, 2, 3, 4, 5, 6, 7], 20, true);	
			LImage.centerOO();
			LImage.smooth = true;
			
			
			type = "bullet_laser";
			
			scaleFactor = 1 - (( -(y - FP.camera.y) + 600) / 1200);
			//LImage.scaleX = scaleFactor;
			visible = false;
			
			setHitbox(16, 480, 6, 240);
			//x = hero.x;
			//y = hero.y - 248;
			//hero = player;
			LImage.play("laser");
			LImage.scaleX = 0.75;
			
			graphic = LImage;
		}
		
		override public function update():void 
		{
			//x = hero.x;
			//y = hero.y - 248;
	
			//setHitbox(16 * scaleFactor, 480 * scaleFactor*0.9, 8 * scaleFactor, 240 * scaleFactor);
				
			LImage.alpha = Math.random() + 0.3;
			
			//UPDATING
			layer = -(y - FP.camera.y) - 480;
			
			//LImage.scaleX = scaleFactor;
			if (visible == false)
			{
				type = "no collisions";
			}
			else
			{
				type = "bullet_laser";
			}
		}
		
			
	}

}