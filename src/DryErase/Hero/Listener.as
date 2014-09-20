package DryErase.Hero 
{
	/**
	 * ...
	 * @author 
	 */
	
	import DryErase.Effects.*;
	import DryErase.Effects.Laser;
	import DryErase.Enemies.Bullets.Bullet;
	
	import Worlds.GameWorld;
	import Worlds.classes.Backgrounds.Transition;
	import Worlds.classes.River;
	
	import be.nascom.flash.graphics.Rippler;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	import lib.Quake;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	import punk.blur.BlurWrapper;
	 
	public class Listener extends Entity
	{
		
		
		//INITIALIZE IMAGES
		private var currentImage:Image;
		private var RImage:Image;
		private var LImage:Image;
		
		private var RealImage:Image;
		private var RImageReal:Image;
		private var LImageReal:Image;
		
		private var SpiderImage:Image;
		private var SpiderImageR:Image;
		private var SpiderImageL:Image;
		
		private var ManImage:Image;
		
		private var InvinciImage:Image;
		
		private var Shadow:Image;
		
		private var White:Image;
		private var temp:Image;
		
		public static var inCutscene:Boolean = false;
		
		public static var lastCoinCollected:Number = 0;

		//TRANSITION SPEED
		private var transSpeed:Number = 0.1;
		
		//INITIALIZE VARIABLES
		private var basicShoot:Boolean;
		private var flyIn:Boolean;
		private var hoverPixel:Number;
		private var hoverDir:Number;
		
		public var yy:Number; //true Y value...in Reality field the player will be drawn several pixels above the yy
		private var depth:Number;
		
		public static var currentField:Boolean;
		//FALSE is IMAGINATION
		//TRUE is REALITY
		
		public static var powerups:Number = 1;
		//0 is normal
		//1 is sinewave pattern
		//2 is normal AND sinewave pattern
		
		
		public static var isTransitioning:Boolean;
		private var scaleFactor:Number; //the scale of the images
		
		public static var hitPoints:Number;
		public static var weaponBar:Number;
		public static var canSwitchFields:Boolean = true;
		
		public static var x2:Number;
		public static var y2:Number;
		
		//INITIALIZE BULLETS
		
		private var xBullet:Entity;
		private var yBullet:Entity;
		
		private var spider1:Spider;
		private var spider2:Spider;
		private var spider3:Spider;
		private var spider4:Spider;
		private var spider5:Spider;
		private var spider6:Spider;
		private var spider7:Spider;
		private var spider8:Spider;
		
		private var laser:Laser;
		
		public static var wave:Number = 0; //for the sine wave
		
		public static var killed:Boolean = false;
		
		public function Listener() 
		{
			canSwitchFields = true;
			
			inCutscene = false;
			
			currentImage = new Image(Assets.PLAYER);	
			currentImage.centerOO();
			currentImage.smooth = true;
			
			RImage = new Image(Assets.PLAYER_RIGHT);	
			RImage.centerOO();
			RImage.smooth = true;
			
			LImage = new Image(Assets.PLAYER_LEFT);	
			LImage.centerOO();
			LImage.smooth = true;
			
			RealImage = new Image(Assets.PLAYER_REAL);	
			RealImage.centerOO();
			RealImage.smooth = true;
			RealImage.alpha = 0;
			
			RImageReal = new Image(Assets.PLAYER_RIGHT_REAL);	
			RImageReal.centerOO();
			RImageReal.smooth = true;
			
			LImageReal = new Image(Assets.PLAYER_LEFT_REAL);	
			LImageReal.centerOO();
			LImageReal.smooth = true;
			
			SpiderImage = new Image(Assets.PLAYER_SPIDER);	
			SpiderImage.centerOO();
			SpiderImage.smooth = true;
			SpiderImage.alpha = 0;
			
			SpiderImageR = new Image(Assets.PLAYER_RIGHT_SPIDER);	
			SpiderImageR.centerOO();
			SpiderImageR.smooth = true;
			SpiderImageR.alpha = 0;
			
			SpiderImageL = new Image(Assets.PLAYER_LEFT_SPIDER);	
			SpiderImageL.centerOO();
			SpiderImageL.smooth = true;
			SpiderImageL.alpha = 0;
			
			ManImage = new Image(Assets.PLAYER_MAN);	
			ManImage.centerOO();
			ManImage.smooth = true;
			ManImage.alpha = 0;
			
			Shadow = new Image(Assets.PLAYER_SHADOW);	
			Shadow.centerOO();
			Shadow.smooth = true;
			
			InvinciImage = new Image(Assets.INVINC);
			InvinciImage.centerOO();
			InvinciImage.smooth = true;
			InvinciImage.blend = "add";

			White = new Image(Assets.WHITESPACE);
			White.alpha = 0;
			
		//	currentField = false;
			
			setHitbox(24, 32, 12, 16);
			
			isTransitioning = false;
			
			scaleFactor = (1 - (( -(yy - FP.camera.y) + 600) / 5000)) * 3 / 5;
			
			basicShoot = true;
			flyIn = true;
			hoverPixel = 0;
			hoverDir = 1;
			
			hitPoints = 7;
			weaponBar = 100;
			
			currentImage.scale = 3;
			currentImage.alpha = 0.2;
			
			RealImage.scale = 3;
			RealImage.alpha = 0.2;
			
			ManImage.scale = 3;
			ManImage.alpha = 0.2;
			
			laser = new Laser();
			laser.x = x;
			laser.y = y - 248;
			
			x = 320;
			y = 300;
			yy = 350;
			depth = 64;
			
			x2 = x;
			y2 = y;
			
			type = "hero";
			
			killed = false;
			
		}
		
		//INITIALIZE ALARMS
		public var bulletTimer:Number = 0;
		public var flyTimer:Number = 0;
		public var hoverTimer:Number = 0;
		public var invinciTimer:Number = 0;
		public var spiderTimer:Number = 0;
		public var inkjetTimer:Number = 0;
	
		
		override public function update():void 
		{
			lastCoinCollected += FP.elapsed;
			if (hitPoints > 0)
			{
			x2 = x;
			y2 = y;
			
			layer = -1000;
			if (hitPoints > 7)
			{
				hitPoints = 7;
			}
			scaleFactor = (1 - (( -(yy - FP.camera.y) + 600) / 1500)) * 3 / 5;
			setHitbox(24 * scaleFactor, 32 * scaleFactor, 12 * scaleFactor, 16 * scaleFactor);
			
			if (flyIn == true)
			{
				if (currentImage.scale > scaleFactor)
				{
					currentImage.scale -= 0.075 * Main.frameRate * FP.elapsed;
					currentImage.alpha += 0.025 * Main.frameRate * FP.elapsed;
					RealImage.scale -= 0.075 * Main.frameRate * FP.elapsed;
					RealImage.alpha += 0.025 * Main.frameRate * FP.elapsed;
					ManImage.scale -= 0.075 * Main.frameRate * FP.elapsed;
					ManImage.alpha += 0.025 * Main.frameRate * FP.elapsed;
					if (currentField == false)
					{
						y = yy - depth;
						RealImage.alpha = 0;
					}
					else
					{
						y = yy - depth - 16;
						currentImage.alpha = 0;
					}
					depth -= 2 * Main.frameRate * FP.elapsed;
					
					ManImage.alpha = RealImage.alpha;
				}
				else
				{
					flyIn = false;
					if (currentField == false)
					{
					y = yy;
					}
					else
					{
						y = yy - 16;
					}
				}
				
				graphic = currentImage;
				
				//y = yy;
			}
			
			else
			{
				if (isTransitioning == false)
				{
					stepEvent();
					if (White.alpha > 0)
					{
						White.alpha -= transSpeed / 2;
					}
				}
				else
				{
					if (currentField == false && inCutscene == false)
					{
						toRealityField();
					}
					else if (currentField == true && inCutscene == false)
					{
						toImaginationField();
					}
					if (White.alpha < 1)
					{
						White.alpha += transSpeed;
					}
				}
				
				currentImage.scale = scaleFactor;
				RImage.scale = scaleFactor;
				LImage.scale = scaleFactor;
			
				RealImage.scale = currentImage.scale;
				RImageReal.scale = RImage.scale;
				LImageReal.scale = LImage.scale;
				
				SpiderImage.scale = currentImage.scale;
				SpiderImageR.scale = RImage.scale;
				SpiderImageL.scale = LImage.scale;
			}
			
			
			
			
			if (isTransitioning == false && inCutscene == false)
			{
			if (Input.check("left"))
			{
				x -= 8 * Main.frameRate * FP.elapsed;
			}

			if (Input.check("right"))
			{	
				x += 8 * Main.frameRate * FP.elapsed;
			}

			if (Input.check("up"))
			{
				yy -= 6 * Main.frameRate * FP.elapsed;
			}
			
			if (Input.check("down"))
			{
				yy += 6 * Main.frameRate * FP.elapsed;
			}
			}
			
			if (x <= 72) x = 72;
			if (yy <= 48) yy = 48;
			if (x >= 640 - 72) x = 640-72;
			if (yy >= 480-48) yy = 480-48;
			ManImage.alpha = RealImage.alpha;
			ManImage.scale = RealImage.scale;
			Shadow.scale = currentImage.scale;
			
			//TIMER EVENTS
			invinciTimer += FP.elapsed;
			
			if (isTransitioning == true)
			{
				laser.visible = false;
			}
			}
			else
			{
				killed = true;
				laser.visible = false;
				FP.world.remove(this);
			}
		}
		public function checkCollisions():void
		{
			if (invinciTimer < 2)
			{
				InvinciImage.alpha = 2.2 - invinciTimer;
		/*		currentImage.blend = "difference";
				RealImage.blend = "add";
				RImage.blend = "difference";
				RImageReal.blend = "add";
				LImage.blend = "difference";
				LImageReal.blend = "add";
				*/
				ManImage.blend = "add";
				currentImage.color = 0xA6E1FF;
				
				RImage.color = 0xA6E1FF;
				LImage.color = 0xA6E1FF;
				
		
			}
			else
			{
				InvinciImage.alpha = 0;
		/*
				currentImage.blend = "normal";
				RealImage.blend = "normal";
				RImage.blend = "normal";
				RImageReal.blend = "normal";
				LImage.blend = "normal";
				LImageReal.blend = "normal";
				*/
				ManImage.blend = "normal";
				currentImage.color = 0xFFFFFF;
				
				RImage.color = 0xFFFFFF;
				LImage.color = 0xFFFFFF;
		
			}
			if (currentField == false && isTransitioning == false && inCutscene == false)
			{
				if (collide("enemy_imagination",x,y) || collide("dead_boss_imagination",x,y))
				{
					if (invinciTimer > 2)
					{
						SoundManager.playSound(SoundManager.SFX_HERO_HURT);
						invinciTimer = 0;
						Utils.quake.start(15);
						hitPoints -= 1;
					}
				}
				if (collide("enbullet_imagination",x,y))
				{
					if (invinciTimer > 2)
					{
						SoundManager.playSound(SoundManager.SFX_HERO_HURT);
						invinciTimer = 0;
						Utils.quake.start(10);
						hitPoints -= 1;
					}
				}
				
			}
			if (currentField == true && isTransitioning == false && inCutscene == false)
			{
				if (collide("enemy_reality",x,y) || collide("dead_boss_reality",x,y))
				{
					if (invinciTimer > 2)
					{
						SoundManager.playSound(SoundManager.SFX_HERO_HURT2);
						invinciTimer = 0;
						Utils.quake.start(15);
						hitPoints -= 1;
					}
					
				}
				if (collide("enbullet_reality",x,y))
				{
					if (invinciTimer > 2)
					{
						SoundManager.playSound(SoundManager.SFX_HERO_HURT2);
						invinciTimer = 0;
						Utils.quake.start(10);
						hitPoints -= 1;
					}
				}
			}
			
			if (inCutscene == true)
			{
				if (x < 320-8 || x > 320 + 8 || y < 300 - 8 || y > 300 + 8)
				{
					moveDirection(pointDirection(x,y,320,300),4);
				}else
				{
					x = 320;
					y = 300;
				}
			}
			
		}
		
		public function stepEvent():void
		{	
			checkCollisions();
			//Step Event
			laser.x = x-2;
			laser.y = y - 248;
			
			if (Input.check("shoot") && laser.visible == false && inCutscene == false)
			{
				wave += 0.1  * Main.frameRate * FP.elapsed;
				if (basicShoot == true)
				{
					
					if (currentField == false)
						{
							SoundManager.playSound(SoundManager.SFX_HERO_SHOOT2,(x-320)/320);
							xBullet = FP.world.create(SingleBulletI,true);
							yBullet = FP.world.create(SingleBulletIR,true);
							
							xBullet.x = x;
							xBullet.y = y-4;
							
							yBullet.x = x;
							yBullet.y = y-4;
						}
						else
						{
							SoundManager.playSound(SoundManager.SFX_HERO_SHOOT2,(x-320)/320);
							xBullet = FP.world.create(SingleBulletR,true);
							yBullet = FP.world.create(SingleBulletRR,true);
							
							xBullet.x = x;
							xBullet.y = y-4;
							xBullet.layer = -1998;
							yBullet.x = x;
							yBullet.y = y-4;
						}
						
					basicShoot = false;
					bulletTimer = 0;
				}
				
			}
			if (Input.check("special") && currentField == false && isTransitioning == false && weaponBar >=1 && inCutscene == false && killed == false)
			{
				weaponBar -= 1;
				laser.visible = true;
			}
			else
			{
				laser.visible = false;
			}
			if (Input.pressed("special") && inCutscene == false)
			{
				if (currentField == false)
				{
					FP.world.add(laser);
				}
				if (currentField == true && spiderTimer <= 0 && weaponBar > 10)
				{
					if (weaponBar > 18)
					{
						weaponBar -= 18;
					}
					else
					{
						weaponBar = 0;
					}
					spider1 = new Spider();
					spider1.x = x - 4;
					spider1.y = y - 4;
					spider1.direction = 100;
					FP.world.add(spider1);
					
					spider2 = new Spider();
					spider2.x = x - 4;
					spider2.y = y - 1;
					spider2.direction = 135;
					FP.world.add(spider2);
					
					spider3 = new Spider();
					spider3.x = x - 4;
					spider3.y = y + 1;
					spider3.direction = 180;
					FP.world.add(spider3);
					
					spider4 = new Spider();
					spider4.x = x - 4;
					spider4.y = y + 4;
					spider4.direction = 225;
					FP.world.add(spider4);
					
					spider5 = new Spider();
					spider5.x = x + 4;
					spider5.y = y - 4;
					spider5.direction = 80;
					FP.world.add(spider5);
					
					spider6 = new Spider();
					spider6.x = x + 4;
					spider6.y = y - 1;
					spider6.direction = 45;
					FP.world.add(spider6);
					
					spider7 = new Spider();
					spider7.x = x + 4;
					spider7.y = y + 1;
					spider7.direction = 0;
					FP.world.add(spider7);
					
					spider8 = new Spider();
					spider8.x = x + 4;
					spider8.y = y - 4;
					spider8.direction = 315;
					FP.world.add(spider8);
					
					spiderTimer = 2;
				}
			}
		
			//UPDATING
			if (currentField == false)
			{
				layer = -(y - FP.camera.y);
				y = yy;
				RealImage.alpha = 0;
				RImageReal.alpha = 0;
				LImageReal.alpha = 0;
			}
			else
			{
			//	layer = -(y - FP.camera.y) * 5;
				layer = -1999;
				y = yy - 16;
				currentImage.alpha = 0;
				RImage.alpha = 0;
				LImage.alpha = 0;
				
			}
			
			//WEAPON RECHARGE
			SpiderImage.alpha = spiderTimer / 3;
			SpiderImageR.alpha = spiderTimer / 3;
			SpiderImageL.alpha = spiderTimer / 3;
			
			if (Input.check("left") && !Input.check("right") && inCutscene == false)
			{
				graphic = LImage;
			}
			else if (Input.check("right") && !Input.check("left") && inCutscene == false)
			{	
				graphic = RImage;
			}
			else
			{
				graphic = currentImage;
			}
			
			if (Input.pressed("start") && inCutscene == false && Listener.canSwitchFields == true)
			{
				if (collide("forceReal", x, y))
				{
				}
				else
				{
					isTransitioning = true;
				}
			}
			
			if (collide("forceReal", x, y))
				{
					if (currentField == false && isTransitioning == false)
					{
						isTransitioning = true;
					}
				}
			//ALARMS
			bulletTimer += FP.elapsed;
			hoverTimer += FP.elapsed;
			
			spiderTimer -= FP.elapsed;
			inkjetTimer += FP.elapsed;
			
		
			//ALARM EVENTS
			if (bulletTimer > 0.075 && powerups > 0)
			{
				basicShoot = true;
			}
			if (bulletTimer > 0.1)
			{
				basicShoot = true;
			}
			
			
			
			
		}
		
		public function toRealityField():void
		{
			if (isTransitioning == false)
			{
				return;
			}
			if (currentField == false)
			{
				if (depth < 16)
				{
					depth += 1 * Main.frameRate * FP.elapsed;
					y = yy - depth;
				}
				if (currentImage.alpha > 0)
				{
					currentImage.alpha -= transSpeed * Main.frameRate * FP.elapsed;
					RImage.alpha -= transSpeed * Main.frameRate * FP.elapsed;
					LImage.alpha -= transSpeed * Main.frameRate * FP.elapsed;
				}
				if (RealImage.alpha < 1)
				{
					RealImage.alpha += transSpeed * Main.frameRate * FP.elapsed;
					RImageReal.alpha += transSpeed * Main.frameRate * FP.elapsed;
					LImageReal.alpha += transSpeed * Main.frameRate * FP.elapsed;
				}
				if (depth >= 16 && currentImage.alpha <= 0 && RealImage.alpha >= 1)
				{
					currentField = true;
					isTransitioning = false;
				}
			}
		}
		
		public function toImaginationField():void
		{
			if (isTransitioning == false)
			{
				return;
			}
			if (currentField == true)
			{
				if (depth > 0)
				{
					depth -= 1 * Main.frameRate * FP.elapsed;
					y = yy - depth;
				}
				if (currentImage.alpha < 1)
				{
					currentImage.alpha += transSpeed * Main.frameRate * FP.elapsed;
					RImage.alpha += transSpeed * Main.frameRate * FP.elapsed;
					LImage.alpha += transSpeed * Main.frameRate * FP.elapsed;
				}
				if (RealImage.alpha > 0)
				{
					RealImage.alpha -= transSpeed * Main.frameRate * FP.elapsed;
					RImageReal.alpha -= transSpeed * Main.frameRate * FP.elapsed;
					LImageReal.alpha -= transSpeed * Main.frameRate * FP.elapsed;
				}
				if (depth <= 0 && currentImage.alpha >= 1 && RealImage.alpha <= 0)
				{
					currentField = false;
					isTransitioning = false;
				}
			}
		}
		
		public function moveLocation(xx:Number, yy:Number):void
		{
			x=xx;
			y=yy;
		}
		override public function render():void
		{
			
			White.render(FP.buffer, new Point(0, 0), FP.camera);
			if (currentField == true || flyIn == true || isTransitioning == true)
			{
				Shadow.render(FP.buffer, new Point(x, yy), FP.camera);
			}
			super.render();
			switch (graphic)
			{
				case currentImage:
				{
					
					RealImage.render(FP.buffer, new Point(x, y), FP.camera);
					SpiderImage.render(FP.buffer, new Point(x, y), FP.camera);
					ManImage.angle = 0;
					ManImage.render(FP.buffer, new Point(x, y-2), FP.camera);
					
				}break;
				case RImage:
				{
					RImageReal.render(FP.buffer, new Point(x, y), FP.camera);
					SpiderImageR.render(FP.buffer, new Point(x, y), FP.camera);
					ManImage.angle = -12;
					ManImage.render(FP.buffer, new Point(x, y-2), FP.camera);
					
				}break;
				case LImage:
				{
					
					LImageReal.render(FP.buffer, new Point(x, y), FP.camera);
					SpiderImageL.render(FP.buffer, new Point(x, y), FP.camera);
					ManImage.angle = 10;
					ManImage.render(FP.buffer, new Point(x-2, y-2), FP.camera);
									
				}break;
			}
			
			InvinciImage.render(FP.buffer, new Point(x, y), FP.camera);
			
			
		}
		
		override public function removed():void
		{
			var b1:Bullet = new Bullet(new Image(Assets.BULLET_BLUE_REAL), 0, 0, 0, 0, 0, 12, 0, currentField, 3, 2.3, false);
			b1.x = x;
			b1.y = y;
			b1.layer = layer;
			var b2:Bullet = new Bullet(new Image(Assets.BULLET_BLUE_REAL), 0, 0, 0, 0, 60, 12, 0, currentField, 3, 2.3, false);
			b2.x=x;
			b2.y=y;
			b2.layer = layer;
			var b3:Bullet = new Bullet(new Image(Assets.BULLET_BLUE_REAL), 0, 0, 0, 0, 120, 12, 0, currentField, 3, 2.3, false);
			b3.x=x;
			b3.y=y;
			b3.layer = layer;
			var b4:Bullet = new Bullet(new Image(Assets.BULLET_BLUE_REAL), 0, 0, 0, 0, 180, 12, 0, currentField, 3, 2.3, false);
			b4.x=x;
			b4.y=y;
			b4.layer = layer;
			var b5:Bullet = new Bullet(new Image(Assets.BULLET_BLUE_REAL), 0, 0, 0, 0, 240, 12, 0, currentField, 3, 2.3, false);
			b5.x=x;
			b5.y=y;
			b5.layer = layer;
			var b6:Bullet = new Bullet(new Image(Assets.BULLET_BLUE_REAL), 0, 0, 0, 0, 300, 12, 0, currentField, 3, 2.3, false);
			b6.x=x;
			b6.y=y;
			b6.layer = layer;
			FP.world.add(b1);
			FP.world.add(b2);
			FP.world.add(b3);
			FP.world.add(b4);
			FP.world.add(b5);
			FP.world.add(b6);
			
			var blue:Spritemap = new Spritemap(Assets.explodeBlue, 256, 256);
			blue.add("ex",[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], 35, false);
			blue.centerOO();
			blue.smooth = true;
			blue.play("ex");
			if (currentField == true)
			{
				blue.blend = "add";
			}
			var ent:Entity = new Entity(x,y,blue);
			ent.layer = layer;
			FP.world.add(ent);
			super.removed();
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