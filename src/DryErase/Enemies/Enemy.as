package DryErase.Enemies 
{
	import DryErase.Effects.*;
	import DryErase.Enemies.Bullets.AniBullet;
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Bullets.TimedBullet;
	import DryErase.Hero.Coin;
	import DryErase.Hero.Listener;
	
	import Worlds.GameWorld;
	
	import flash.display.BlendMode;
	import flash.geom.Point;
	
	import lib.SplatterGraphic;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author 
	 */
	public class Enemy extends Entity
	{
		public var hitPoints:Number;
		public var pointValue:Number;
		
		public var fixDirection:Boolean = false;
		
		public var currentImage:Image;
		public var shadowImage:Image;
		public var scaleFactor:Number;
		
		public var currentField:Boolean;
		
		public var direction:Number;
		
		public var destroyed:Boolean; //whether this enemy is flagged for destruction
		
		public var invincible:Number; //timer to check invincibility
		
		public var hbWidth:Number;
		public var hbHeight:Number;
		public var hbOX:Number;
		public var hbOY:Number;
		
		public var previousX:Number;
		public var previousY:Number;
		
		public var prevX2:Number;
		public var prevY2:Number;
		
		public var diving:Boolean; //whether the enemy will 'dive' from field to field
		public var depth:Number; //between zero and one, zero is more imaginary and one is more real
		
		public var removeBounds:Boolean = true;
		public var sizeScale:Boolean = true;
		
		public var imageScale:Number;
		
		public var maxHP:Number;
		
		public var drawActive:Boolean = false;
		public function Enemy(newImage:Image, shadow:Image, hp:Number = 5, points:Number = 100, field:Boolean = false, dir:Number = 0, hboxWidth:Number = 0, hboxHeight:Number = 0, hboxOriginX:Number = 0, hboxOriginY:Number = 0, size:Number = 1, dive:Boolean = false, startingDepth:Number = 0) 
		{
			invincible = 0;
			
			type = "enemy";
			currentImage = newImage;
			currentImage.blend = "normal";
			currentImage.smooth = true;
			currentImage.color = 0xFFFFFF;
			currentImage.centerOO();
			currentImage.alpha = 0;
			graphic = currentImage;
			
			shadowImage = shadow;
			shadowImage.blend = "multiply";
			shadowImage.color = 0x000000;
			shadowImage.smooth = true;
			shadowImage.alpha = 0.3;
			shadowImage.centerOO();
			
			destroyed = false;
			
			hitPoints = hp;
			maxHP = hp;
			pointValue = points;
			
			hbWidth = hboxWidth;
			hbHeight = hboxHeight;
			hbOX = hboxOriginX;
			hbOY = hboxOriginY;
			
			scaleFactor = 1 - (( -(y - FP.camera.y) + 600) / 1200);
			
			diving = dive;
			depth = startingDepth;
			
			currentField = field;
			
			if (diving == true)
			{
				if (depth < 0.5)
				{
					currentField = false;
				}
				else if (depth > 0.5)
				{
					currentField = true;
				}
			}
			
			if (currentField == false)
			{
				type = "enemy_imagination";
				shadowImage.visible = false;
			}
			else
			{
				type = "enemy_reality";
				
				if (Listener.currentField == true)
				{
					shadowImage.alpha = 0.3;
					shadowImage.visible = true;
				}
				else
				{
					shadowImage.visible = false;
				}
			}
			setHitbox(hboxWidth * currentImage.scale, hboxHeight * currentImage.scale, hboxOriginX * currentImage.scale, hboxOriginY * currentImage.scale);
			
			direction = dir;
			
			if (Listener.currentField == currentField)
			{
				currentImage.alpha = 1;
			}
			else
			{
				currentImage.alpha = 0.5;
			}
			imageScale = size;
			currentImage.scale = scaleFactor * imageScale;
		}
		
		override public function update():void
		{
			
			
			if (hitPoints <= 0 && y < 480)
			{
				
				if (y < 480)
				{
					
				if (currentField == false)
				{
					SoundManager.playSound(SoundManager.SFX_ENEMY_EXPLODE,(x-320)/320);
					FP.world.add(new Explode_Small_Imag(x,y));
					FP.world.remove(this);
				}
				else
				{
					SoundManager.playSound(SoundManager.SFX_ENEMY_EXPLODE2,(x-320)/320);
					FP.world.add(new Explosion_Reality(x, y, 1.5));
					FP.world.remove(this);
				}
				}
			//	FP.world.remove(this);
			}
			else if (destroyed == true)
			{
				FP.world.remove(this);
			}
			else
			{
				if (fixDirection == true)
				{
					if (direction > 360)
					{
						direction -= 360;
					}
					if (direction < 0)
					{
						direction += 360;
					}
				}
				
				previousX = x;
				previousY = y;
				prevX2 = previousX;
				prevY2 = previousY;
				
				if (diving == true)
				{
					if (depth < 0.5)
					{
						currentField = false;
					}
					else if (depth > 0.5)
					{
						currentField = true;
					}
				}
				
				if (currentField == false)
				{
					type = "enemy_imagination";
					shadowImage.visible = false;
				}
				else
				{
					type = "enemy_reality";
					if (Listener.currentField == true)
					{
						shadowImage.visible = true;
					}
					else
					{
						shadowImage.visible = false;
					}
				}
				
				shadowImage.angle = currentImage.angle;
				shadowImage.scale = currentImage.scale * 1.15;
				setHitbox(hbWidth * scaleFactor, hbHeight * scaleFactor, hbOX * scaleFactor, hbOY * scaleFactor);
				
				invincible -= FP.elapsed;
				if (fixDirection == false)
				{
					currentImage.angle = direction;
				}
				scaleFactor = 1 - (( -(y - FP.camera.y) + 600) / 1200);
				
				if (removeBounds == true)
				{
					if (y < -400 || y > 800 || x < -400 || x > 1000)
					{
						
						destroyed = true;
					}
				}
				if (sizeScale == true)
				{
					currentImage.scale = scaleFactor * imageScale;
				}
				else
				{
					currentImage.scale = imageScale;
				}
				if (Listener.currentField == currentField)
				{
					currentImage.alpha = 1;
				}
				else
				{
					currentImage.alpha = Main.FADEFIELD;
				}
				
				if (invincible > 0)
				{
					visible = false;
				}
				else {
					visible = true;
				}
				if (currentField == false)
				{
					//layer = -(y - FP.camera.y)/8;
					layer = -1;
					if (invincible <= 0)
					{
						if (collide("bullet_imagination", x, y))
						{
							hitPoints -= 1;
							invincible = 0.05;
						}
						if (collide("bullet_laser", x, y))
						{
							hitPoints -= 3;
							invincible = 0.1;
						}
						
					}
				}
				else if (currentField == true)
				{
					//layer = -(y - FP.camera.y) * 1.5;
					layer = -5;
					if (invincible <= 0)
					{
						if (collide("bullet_reality", x, y))
						{
							hitPoints -= 1;
							invincible = 0.05;
						}
						if (collide("bullet_spider", x, y))
						{
							hitPoints -= 1;
							invincible = 0.001;
						}
					}
					
				}
				
				
				
				
				
			}
		}
		public function circleAround(targetX:Number, targetY:Number, speed:Number, clockwise:Boolean):void
		{
			var tempDir:Number;
			if (clockwise == true)
			{
				tempDir = pointDirection(x,y,targetX,targetY);
				x+=lengthDirX(1, tempDir - 90)*speed * Main.frameRate * FP.elapsed;
				y+=lengthDirY(1,tempDir-90)*speed * Main.frameRate * FP.elapsed;
				direction = tempDir - 90;
			}
			else
			{
				tempDir = pointDirection(x,y,targetX,targetY);
				x+=lengthDirX(1, tempDir + 90)*speed * Main.frameRate * FP.elapsed;
				y+=lengthDirY(1,tempDir+90)*speed * Main.frameRate * FP.elapsed;
				direction = tempDir + 90;
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
		
		override public function removed():void
		{
			this.currentImage = null;
			this.shadowImage = null;
			
			if (hitPoints <= 0)
			{
				Main.currentScore += pointValue;
				GameWorld.killStreak += 1;
				var count:Number = 0;
				while (count < maxHP && count < 120)
				{
				var coin:Coin=FP.world.create(Coin, true) as Coin;
				var xx = x+Math.random()*width - width/2;
				var yy = y+Math.random()*height - height/2;
				if (xx < 32)
				{
					xx = 32;
				}
				if (xx > 640-32)
				{
					xx = 640-32;
				}
				if (yy < 32)
				{
					yy= 32;
				}
				if (yy > 480-32)
				{
					yy = 480-32;
				}
				coin.x = xx;
				coin.y = yy;
				coin.currentField = currentField;
				count += 6;
				}
				
			}
		}
		
		public function shoot(bullet:Bullet, bulletX:Number, bulletY:Number, image:Image = null):Entity
		{
			var bulletClass:Class = Object( bullet ).constructor;
			var tempBullet:Bullet = bullet;
			
			if (bullet != null && bulletClass == AniBullet)
			{
				var aniBullet:AniBullet = bullet as AniBullet;
				aniBullet.currentImage = bullet.currentImage;
				aniBullet = FP.world.create(bulletClass,true) as AniBullet;
				aniBullet.direction = bullet.direction;
				aniBullet.c = (bullet as AniBullet).c;
				aniBullet.currentImage = bullet.currentImage;
				aniBullet.currentImage.alpha = bullet.currentImage.alpha;
				aniBullet.hbWidth = bullet.hbWidth;
				aniBullet.hbHeight = bullet.hbHeight;
				aniBullet.hbOX = bullet.hbOX;
				aniBullet.hbOY = bullet.hbOY;
				aniBullet.speed = bullet.speed;
				aniBullet.imageRotation = bullet.imageRotation;
				aniBullet.imageScale = bullet.imageScale;
				aniBullet.currentField = bullet.currentField;
				aniBullet.rotSpeed = bullet.rotSpeed*.8;
				aniBullet.x = bulletX;
				aniBullet.y = bulletY;
				aniBullet.killTimer = 0;
				return aniBullet;
			}
			else if (bullet != null && bulletClass == TimedBullet)
			{
				var timedBullet:TimedBullet = bullet as TimedBullet;
				if (image != null)
				{
					timedBullet.currentImage = image;
					
				}
				else
				{
					timedBullet.currentImage = bullet.currentImage;
				}
			
				timedBullet = FP.world.create(bulletClass, true) as TimedBullet;
				if (image != null)
				{
					timedBullet.currentImage = image;
				}
				else
				{
					timedBullet.currentImage = bullet.currentImage;
				}
				timedBullet.direction = bullet.direction;
				timedBullet.homeTimer = 0;
				timedBullet.currentImage.alpha = bullet.currentImage.alpha;
				timedBullet.hbWidth = bullet.hbWidth;
				timedBullet.hbHeight = bullet.hbHeight;
				timedBullet.hbOX = bullet.hbOX;
				timedBullet.hbOY = bullet.hbOY;
				timedBullet.speed = bullet.speed;
				timedBullet.imageRotation = bullet.imageRotation;
				timedBullet.imageScale = bullet.imageScale;
				timedBullet.currentField = bullet.currentField;
				timedBullet.bufferTimer = 0;
				timedBullet.visible = false;
				timedBullet.rotSpeed = bullet.rotSpeed*.8;
				timedBullet.point = bullet.point;
				timedBullet.x = bulletX;
				timedBullet.y = bulletY;
				timedBullet.currentImage.centerOO();
				timedBullet.killTimer = 0;
				return timedBullet;
			}
			else if (bullet != null && bulletClass == Bullet)
			{
				if (image != null)
				{
					tempBullet.currentImage = image;
					
				}
				else
				{
					tempBullet.currentImage = bullet.currentImage;
				}
				
				tempBullet = FP.world.create(bulletClass, true) as Bullet;
				if (image != null)
				{
					tempBullet.currentImage = image;
				}
				else
				{
					tempBullet.currentImage = bullet.currentImage;
				}
				tempBullet.direction = bullet.direction;
				tempBullet.currentImage.alpha = bullet.currentImage.alpha;
				tempBullet.hbWidth = bullet.hbWidth;
				tempBullet.hbHeight = bullet.hbHeight;
				tempBullet.hbOX = bullet.hbOX;
				tempBullet.hbOY = bullet.hbOY;
				tempBullet.speed = bullet.speed;
				tempBullet.imageRotation = bullet.imageRotation;
				tempBullet.imageScale = bullet.imageScale;
				tempBullet.currentField = bullet.currentField;
				tempBullet.bufferTimer = 0;
				tempBullet.visible = false;
				tempBullet.rotSpeed = bullet.rotSpeed*.8;
				tempBullet.point = bullet.point;
				tempBullet.x = bulletX;
				tempBullet.y = bulletY;
				tempBullet.currentImage.centerOO();
				tempBullet.killTimer = 0;
				return tempBullet;
			}
			
			else
			{
				return null;
			}
			
		}
		
		public var drawShadow:Boolean = true;
		override public function render():void
		{
			if (drawActive == false)
			{
				drawActive = true;
			}
			else
			{
				if (hitPoints > 0)
				{
				if (shadowImage.visible == true && drawShadow == true)
				{
					shadowImage.render(FP.buffer, new Point(x, y+8), FP.camera);
				}
				//currentImage.render(new Point(x, y), FP.camera);
				if (visible == true)
				{
					super.render();
				}
				}
			}
		}
	}
	
}