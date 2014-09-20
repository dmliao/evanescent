package DryErase.Hero.Title
{
	import Worlds.classes.Title.WorldMap;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

	public class MiniListener extends Entity
	{
		
		public var currentImage:Image;
		
		public var direction:Number = 90;
		
		public var canMove:Boolean = true;
		
		public function MiniListener()
		{
			currentImage = new Image(Assets.PLAYER_AVATAR);
			currentImage.smooth = true;
			currentImage.centerOO();
			
			currentImage.angle = direction - 90;
			setHitbox(32,32,16,16);
			
			graphic = currentImage;
			x=320;
			y=200;
		}
		
		override public function update():void
		{
			if (WorldMap.transImage.alpha == 0)
			{
				canMove = true;
			}
			else
			{
				canMove = false;
			}
			if (collide("cloud",x,y) && Main.castleOpen == false)
			{
				x -= 3;
				y -= 3;
			}
			currentImage.angle = direction - 90;
			if (x <= 72) x = 72;
			if (y <= 48) y = 48;
			if (x >= FP.stage.width-72) x = FP.stage.width-72;
			if (y >= FP.stage.height-48) y = FP.stage.height-48;
			if (canMove == true)
			{
			if (Input.check("left"))
			{
				type = "hero";
				if (!Input.check("up") && !Input.check("down"))
				{
					direction = 180;
				}
				else if (Input.check("up"))
				{
					direction = 135;
				}
				else if (Input.check("down"))
				{
					direction = 225;
				}
				
				moveDirection(direction,4);
			}
			else if (Input.check("right"))
			{
				type = "hero";
				if (!Input.check("up") && !Input.check("down"))
				{
					direction = 0;
				}
				else if (Input.check("up"))
				{
					direction = 45;
				}
				else if (Input.check("down"))
				{
					direction = 315;;
				}
				moveDirection(direction,4);
			}
			
			else if (Input.check("up"))
			{
				type = "hero";
				direction = 90;
				moveDirection(direction,4);
			}
			else if (Input.check("down"))
			{
				type = "hero";
				direction = 270;
				moveDirection(direction,4);
			}
			}
		}
		
		public function moveDirection(dir:Number, moveSpeed:Number):void
		{
			x += lengthDirX(1, dir) * moveSpeed;
			y += lengthDirY(1, dir) * moveSpeed;
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
		
		public function turnTowards(targetDir:Number, turnspeed:Number):void
		{
			if ((targetDir+360) % 360 > direction + turnspeed)
			{
				direction += turnspeed;
			}
			else if ((targetDir+360) % 360 < direction  - turnspeed)
			{
				direction -= turnspeed;
			}
			else
			{
				direction = targetDir;
			}
		}
	}
}