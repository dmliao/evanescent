package DryErase.Hero 
{
	/**
	 * ...
	 * @author 
	*/
	import DryErase.Enemies.Enemy;
	import DryErase.Hero.Listener;
	
	import Worlds.GameWorld;
	
	import com.debug.Debug;
	
	import flash.display.BlendMode;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	import punk.blur.BlurWrapper;

	public class Spider extends Entity
	{
		
		//INITIALIZE IMAGES
		private var currentImage:Image;
		
		public var target:Entity;
		public var direction:Number = 0;
		public var speed:Number = 12;
		
		private var e:Entity
		
		private var shadowCounter:Number;
		private var targetCounter:Number;
		private var searchCounter:Number;  //every few steps or so, start checking to see if you can find a new target
		
		private var scaleFactor:Number;
		
		public var shadow:SpiderShadow;
		
		public function Spider() 
		{
			// Find the nearest enemy:
			targetCounter = 0;
			searchCounter = 0;
			shadowCounter = 0;

			currentImage = new Image(Assets.SPIDER);
			currentImage.centerOO();
			currentImage.smooth = true;
			
			currentImage.blend = "hardlight";
			
			
			graphic = currentImage;
			
			type = "bullet_spider";
			
			currentImage.scale = scaleFactor;
			currentImage.angle = direction;
			
			scaleFactor = 1.5 - (( -(y - FP.camera.y) + 600) / 1200);
			
			setHitbox(24*scaleFactor, 24*scaleFactor, 12*scaleFactor, 12*scaleFactor);
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
		
		override public function update():void
		{
		if (y < 0 || y > FP.stage.height || x < 0 || x > FP.stage.width || collide("enemy_reality",x,y) || collide("obstacle",x,y))
			{
				FP.world.remove(this);
			}
			else
			{
			x += lengthDirX(1, direction) * speed * Main.frameRate * FP.elapsed;
			y += lengthDirY(1, direction) * speed * Main.frameRate * FP.elapsed;
			
			currentImage.scale = scaleFactor;
			currentImage.angle = direction;
			layer = -(y - FP.camera.y) -5;
			
			
			if (e != null)
			{
				if (pointDirection(x, y, e.x, e.y) > direction + 8)
				{
					direction += 8 * Main.frameRate * FP.elapsed;
				}
				else if (pointDirection(x, y, e.x, e.y) < direction - 8)
				{
					direction -= 8 * Main.frameRate * FP.elapsed;
				}
				else
				{
					direction = pointDirection(x, y, e.x, e.y);
				}
			}
			//ALARMS
			shadowCounter += FP.elapsed;
			targetCounter += FP.elapsed;
			searchCounter += FP.elapsed;
			
			if (shadowCounter >= 0.08)
			{
				shadow = new SpiderShadow;
				shadow.x = x;
				shadow.y = y;
				shadow.currentImage.angle = currentImage.angle;
				FP.world.add(shadow);
				shadowCounter = 0;
				
			}
			
			if (targetCounter >= 0.15)
			{
				e = FP.world.nearestToEntity("enemy_reality", this, true);
				if (e != null)
			{
				if (pointDirection(x, y, e.x, e.y) > direction + 8)
				{
					direction += 8 * Main.frameRate * FP.elapsed;
				}
				else if (pointDirection(x, y, e.x, e.y) < direction - 8)
				{
					direction -= 8 * Main.frameRate * FP.elapsed;
				}
				else
				{
					direction = pointDirection(x, y, e.x, e.y);
				}
			}
			}
			
			if (searchCounter >= 0.2)
			{
				e = FP.world.nearestToEntity("enemy_reality", this);
				searchCounter = 0;
			}
			}
			
		}
	}

}