package DryErase.Hero 
{
	/**
	 * ...
	 * @author 
	 */
	import Worlds.GameWorld;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	import punk.blur.BlurWrapper;
	
	public class SingleBulletIR extends Entity
	{
		//INITIALIZE IMAGES
		private var currentImage:Image;
		
		public var speed:Number = 12;
		public var direction:Number;
		
		private var scaleFactor:Number;
		
		public var blur:BlurWrapper;
		
		public function SingleBulletIR() 
		{
			currentImage = new Image(Assets.BULLETI);	
			currentImage.centerOO();
			currentImage.smooth = true;
			
			direction = (Math.sin(-Listener.wave)*5)+90-2;
			currentImage.angle = direction;
			
			currentImage.alpha = 0;
			
			type = "bullet_imagination";
			
			scaleFactor = 1 - (( -(y - FP.camera.y) + 600) / 1200);
			
			setHitbox(16, 64, 8, 38);
			
			blur = new BlurWrapper(currentImage);
			graphic = blur;
		}
		
		override public function update():void 
		{
			if (y < 0 || collide("obstacle_both", x, y) || collide("obstacle_imagination", x, y) || collide ("enemy_imagination", x, y))
			{
				FP.world.recycle(this);
				direction = (Math.sin(-Listener.wave)*5)+90-2;
				currentImage.angle = direction;
			}
			else
			{
				setHitbox(32 * scaleFactor, 128 * scaleFactor*0.9, 16 * scaleFactor, 84 * scaleFactor);
				
				//y -= 12;
				moveDirection(direction,speed);
				
				//UPDATING
				layer = -(y - FP.camera.y);
				//graphic = new BlurWrapper(currentImage);
				
				if (currentImage.alpha < 1)
				{
					currentImage.alpha += 0.1 + ((layer + 800) / 5000);
				}
				currentImage.scale = 1 - (( -(y - FP.camera.y) + 600) / 1000);
				
			}
		}
		public function moveDirection(dir:Number, moveSpeed:Number):void
		{
			x += lengthDirX(1, dir) * moveSpeed * Main.frameRate * FP.elapsed;
			y += lengthDirY(1, dir) * moveSpeed * Main.frameRate * FP.elapsed;
		}
		
		public function pointDirection(x1:Number, y1:Number, x2:Number, y2:Number):Number
		{
			return radtodeg(Math.atan2(-(y2 - y1), x2 - x1));
		}
		
		public function radtodeg(angle:Number):Number
		{
			return angle * 180 / Math.PI;
		}
		public function lengthDirX(distance:Number, direction:Number):Number
		{
			return distance * Math.cos(direction * (Math.PI / 180));
		}
		public function lengthDirY(distance:Number, direction:Number):Number
		{
			return -distance * Math.sin(direction * (Math.PI / 180));
		}
		
		
	}
	
}