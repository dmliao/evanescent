package DryErase.Enemies
{
	import DryErase.Effects.*;
	import DryErase.Hero.Listener;
	
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class Boss extends Enemy
	{
		public var iImage:Image;
		public var rImage:Image;
		
		//a boss can have up to 5 states
		public var stateTimer:Number = 0;
		public var idleTimer:Number = 0;
		public var basicTimer:Number = 0;
		public var altTimer:Array = new Array(0, 0, 0);
		public var currentState:String = new String("intro");
		
		public var yy:Number;
		
		public var deathTrigger:Boolean = false;
		
		public function Boss(imagImage:Image, realImage:Image, shadow:Image, hp:Number = 5, points:Number = 100, dir:Number = 0, hboxWidth:Number = 0, hboxHeight:Number = 0, hboxOriginX:Number = 0, hboxOriginY:Number = 0, size:Number = 1)
		{
			super(imagImage,shadow,hp,points,false,dir,hboxWidth,hboxHeight,hboxOriginX,hboxOriginY,size,false,0);
			type = "enemy_both";
			
			imagImage.scale = currentImage.scale;
			imagImage.angle = currentImage.angle;
			imagImage.smooth = true;
			imagImage.centerOO();
			iImage = imagImage;
			
			realImage.scale = currentImage.scale;
			realImage.angle = currentImage.angle;
			realImage.smooth = true;
			realImage.centerOO();
			rImage = realImage;
			
			currentImage = imagImage;
			
			yy = y - 12;
		}
		override public function update():void
		{

			if (direction > 360)
			{
				direction -= 360;
			}
			if (direction < 0)
			{
				direction += 360;
			}
			
			if (currentField == false)
			{
				currentImage = iImage;
				currentField = false;
				type = "enemy_imagination";
				shadowImage.alpha = 0;
				yy = y;
				graphic = iImage;
			}
			if (currentField == true)
			{
				currentImage = rImage;
				currentField = true;
				type = "enemy_reality";
				shadowImage.alpha = 0.3;
				yy = y - 12;
				graphic = rImage;
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
			
			currentImage.scale = scaleFactor * imageScale;
			currentField = Listener.currentField;
			
			if (invincible > 0)
			{
				if (invincible > 0.2)
				{
					currentImage.color = 0xFFCC11;
					visible = true;
					currentImage.alpha = 1;
				}
				else
				{
					visible = false;
					currentImage.alpha = 0.4;
				}
			}
			else {
				visible = true;
				currentImage.blend = "normal";
				currentImage.color = 0xFFFFFF;
				currentImage.alpha = 1;
			}
			
			if (hitPoints <= 0)
			{
				
				deathTrigger = true;
	
				if (currentField == false)
				{
					type = "dead_boss_imagination";
					if (y > 0)
					{
						layer = -(y - FP.camera.y) / 2;
					}
					else
					{
						layer = -2;
					}
				}
				else if (currentField == true)
				{
					type = "dead_boss_reality";
					if (y > 0)
					{
						layer = -(y - FP.camera.y) * 1.5;
					}
					else
					{
						layer = - 3;
					}
				}
			}
			else
			{
				
				if (currentField == false)
				{
					if (y > 0)
					{
						layer = -(y - FP.camera.y) / 2;
					}
					else
					{
						layer = -2;
					}
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
					if (y > 0)
					{
						layer = -(y - FP.camera.y) * 1.5;
					}
					else
					{
						layer = - 3;
					}
					if (invincible <= 0)
					{
						if (collide("bullet_reality", x, y))
						{
							hitPoints -= 1;
							invincible = 0.05;
						}
					}
					if (collide("bullet_spider", x, y))
					{
						hitPoints -= 1;
						invincible = 0.1;
					}
				}
				
				if (destroyed == true)
				{
					deathTrigger = true;
				}
				
			}
			if (currentState == "intro")
			{
				introState();
			}	
			if (currentState == "idle")
			{
				idleState();
			}	
			if (currentState == "alt1")
			{
				altState1();
			}	
			if (currentState == "alt2")
			{
				altState2();
			}	
			if (currentState == "alt3")
			{
				altState3();
			}	
			if (currentState == "basic")
			{
				basicState();
			}	
			if (currentState == "killed")
			{
				killedState();
			}
			//alarms and switching
			stateTimer += FP.elapsed;
		}
		
		public function introState():void
		{
			//override this introduction for the boss
			//do stuff here
		}
		
		public function idleState():void
		{
			//override this
			//do stuff here
			idleTimer += FP.elapsed;
			altTimer[0] = 0;
			altTimer[1] = 0;
			altTimer[2] = 0;
			basicTimer = 0;
		}
		public function basicState():void
		{
			//basic attack state
			basicTimer += FP.elapsed;
			idleTimer = 0;
		}
		public function altState1():void
		{
			//altstate
			altTimer[0] += FP.elapsed;
			idleTimer = 0;
		}
		public function altState2():void
		{
			//altstate
			altTimer[1] += FP.elapsed;
			idleTimer = 0;
		}
		public function altState3():void
		{
			//altstate...usually a desperation attack
			altTimer[2] += FP.elapsed;
			idleTimer = 0;
		}
		public function killedState():void
		{
			//NEED TO DESTROY SOMETIME IN HERE
		}
		public function switchtoState(state:String):void
		{
			currentState = state;
		}
		override public function render():void
		{
			
			if (visible == true)
			{
				if (drawShadow == true)
				{
					shadowImage.render(FP.buffer, new Point(x, y), FP.camera);
				}
				graphic.render(FP.buffer, new Point(x,yy), FP.camera);
			}
			
		}
		
		public function turnTowards(targetDir:Number, turnspeed:Number):void
		{
			if ((targetDir+360) % 360 > direction + (turnspeed * Main.frameRate * FP.elapsed))
			{
				direction += turnspeed * Main.frameRate * FP.elapsed;
			}
			else if ((targetDir+360) % 360 < direction  - turnspeed)
			{
				direction -= turnspeed * Main.frameRate * FP.elapsed;
			}
			else
			{
				direction = targetDir;
			}
		}
		
		public function resetIdle():void
		{
			basicTimer = 0;
			altTimer[0] = 0;
			altTimer[1] = 0;
		}
		override public function removed():void
		{
			super.removed();
			rImage = null;
			iImage = null;
			if (Listener.currentField == false)
			{
				var Ex01:Entity = new Explosion_Imagination(x, y);
				FP.world.add(Ex01);
			}
			else
			{
				var Ex1:Entity = new Explosion_Reality(x,y,2);
				FP.world.add(Ex1);
			}
		}
		public function explode():void
		{
			if (currentField == false)
			{
				FP.world.add(new Explosion_Imagination(x,y));
				FP.world.add(new Explode_Small_Imag(x,y));
			}
			else
			{
				FP.world.add(new Explosion_Reality(x, y, 2));
				FP.world.add(new Explosion_Reality(x+32, y+32, 2));
				FP.world.add(new Explosion_Reality(x+32, y-32, 2));
				FP.world.add(new Explosion_Reality(x-32, y+32, 2));
				FP.world.add(new Explosion_Reality(x-32, y-32, 2));
			}
		}
	}
}