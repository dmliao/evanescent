package DryErase.Enemies.Bullets 
{
	import DryErase.Hero.Listener;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author 
	 */
	public class Bullet extends Entity
	{
		
		public var currentImage:Image;
		public var scaleFactor:Number;
		public var direction:Number;
		
		public var speed:Number;
		
		public var rotSpeed:Number = 0;//will it spin?
		
		public var destroyed:Boolean; //whether this enemy is flagged for destruction
		
		public var currentField:Boolean;
		
		public var hbWidth:Number;
		public var hbHeight:Number;
		public var hbOX:Number;
		public var hbOY:Number;
		
		public var imageScale:Number;
		
		public var imageRotation:Number;
		
		public var point:Boolean;
		
		public var tempImage:Image = new Image(Assets.BULLET_BLUE_REAL);
		
		public var bufferTimer:Number = 0;
		public var killTimer:Number = 0;
		
		public function Bullet(newImage:Image = null, hboxWidth:Number = 0, hboxHeight:Number = 0, hboxOriginX:Number = 0, hboxOriginY:Number = 0, dir:Number = 0, argspeed:Number = 8, rot:Number = 0, field:Boolean = false, imageRot:Number = 0, size:Number = 1, imagePoint:Boolean = false) 
		{
			visible = false;
			direction = dir;
			rotSpeed = rot*.7;
			speed = argspeed;
			
			imageScale = size;
			
			layer = 0;
			
			if (newImage != null)
			{
			currentImage = newImage;
			currentImage.centerOO();
			currentImage.smooth = true;
			currentImage.scale = scaleFactor * imageScale;
			currentImage.angle = direction;
			}
			else
			{
				currentImage = tempImage;
				currentImage.centerOO();
				currentImage.smooth = true;
				currentImage.scale = scaleFactor * imageScale;
				currentImage.angle = direction;
				currentImage.alpha = 0;
			}
			
			graphic = currentImage;
			
			hbWidth = hboxWidth;
			hbHeight = hboxHeight;
			hbOX = hboxOriginX;
			hbOY = hboxOriginY;
			
			imageRotation = imageRot;
			
			point = imagePoint;
			if (point == true)
			{
				currentImage.angle = direction;
			}
			
			currentField = field;
			if (currentField == false)
			{
				type = "enbullet_imagination";
			}
			else
			{
				type = "enbullet_reality";
			}
			
			scaleFactor = 1 - (( -(y - FP.camera.y) + 600) / 1200);
			setHitbox(hbWidth * scaleFactor, hbHeight * scaleFactor, hbOX * scaleFactor, hbOY * scaleFactor);
			bufferTimer = 0;
		}
		
		override public function update():void
		{
			layer = 0;
			if (speed > 2)
			{
				speed -= 0.01;
			}
			if (currentField == false)
			{
				type = "enbullet_imagination";
			}
			else
			{
				type = "enbullet_reality";
			}
			bufferTimer+=FP.elapsed;
			killTimer += FP.elapsed;
			if (bufferTimer > 0.05)
			{
				graphic = currentImage;
				visible = true;
			}
			if (y < -24 || y > 504 || x < -24 || x > 664 || killTimer > 8)
			{
				
				FP.world.recycle(this);
				
			}
			super.update();
			
			if (point == true)
			{
				currentImage.angle = direction;
			}
			
			direction += rotSpeed * Main.frameRate * FP.elapsed;
			
			moveDirection(direction, speed);
			currentImage.scale = scaleFactor * imageScale;
			currentImage.angle -= imageRotation * Main.frameRate * FP.elapsed; 
			setHitbox(hbWidth * scaleFactor * imageScale, hbHeight * scaleFactor * imageScale, hbOX * scaleFactor * imageScale, hbOY * scaleFactor * imageScale);
			
			if (collide("hero", x, y) == true)
			{
				FP.world.recycle(this);
			}
			
			if (Listener.currentField == currentField)
			{
				currentImage.alpha = 1;
			}
			else
			{
				currentImage.alpha = Main.FADEFIELD;
			}
			
			
			
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
		public function moveDirection(direction:Number, moveSpeed:Number):void
		{
			x += lengthDirX(1, direction) * moveSpeed * Main.frameRate * FP.elapsed;
			y += lengthDirY(1, direction) * moveSpeed * Main.frameRate * FP.elapsed;
		}
		
		public function Attractor(attractX:Number, attractY:Number, attractStrength:Number):void
		{
			var dir:Number = pointDirection(x, y, attractX, attractY);
			var dirDiff:Number = direction - dir;
			if (dirDiff <= -180) 
			{ 
				dirDiff += 360; 
			}
			else if (dirDiff >= 180) 
			{ 
				dirDiff -= 360; 
			}
			if (dirDiff >= -attractStrength)
			{
				direction -= attractStrength;
			}
			else if (dirDiff <= -attractStrength)
			{
				direction += attractStrength;
			}
			else
			{
				direction = dir;
			}

		}
		public function addSpin(rotateSpeed:Number):void
		{
			direction += rotateSpeed * Main.frameRate * FP.elapsed;
			currentImage.angle = direction;
		}
		
	}

}