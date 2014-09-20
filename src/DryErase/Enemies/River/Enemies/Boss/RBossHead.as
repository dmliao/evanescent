package DryErase.Enemies.River.Enemies.Boss
{
	import DryErase.Enemies.Boss;
	import DryErase.Enemies.Bullets.AniBullet;
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Bullets.TimedBullet;
	import DryErase.Hero.Listener;
	
	import com.debug.Debug;
	
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class RBossHead extends Boss
	{
		
		
		public static var spawnPoint:Point = new Point(0,0);
		
		public static var neckPoint:Point = new Point(0,0);
		
		public var upImag:Image = new Image(Assets.GUEY_HEAD_IMAG_UP);
		
		public var up2Imag:Image = new Image(Assets.GUEY_HEAD_IMAG_DOWN);
		public var downImag:Image = new Image(Assets.GUEY_HEAD_IMAG_DOWN);
		
		public var upReal:Image = new Image(Assets.GUEY_HEAD_REAL_UP);
		public var downReal:Image = new Image(Assets.GUEY_HEAD_REAL_DOWN);
		
		public static var x2:Number;
		public static var y2:Number;
		public static var dir:Number;
		
		public var chargeDir:Number;
		public var phase:Boolean = false;
		public function RBossHead()
		{
			upImag.centerOO();
			upImag.smooth = true;
			
			downImag.centerOO();
			downImag.smooth = true;
			
			upReal.centerOO();
			upReal.smooth = true;
			
			downReal.centerOO();
			downReal.smooth = true;
			
			super(up2Imag,up2Imag,up2Imag,300, 600, 0, 120, 120, 60, 60, 1);
			fixDirection = true;
			drawShadow = false;
			
			chargeDir = pointDirection(x,y,Listener.x2,Listener.y2);
		}
		override public function update():void
		{
			if (RBoss.numDead < 4)
			{
			super.update();
			if (deathTrigger == true)
			{
				upImag.color = 0xCCCCCC;
				upReal.color = 0xFFA9A9;
				downImag.color = 0xCCCCCC;
				downReal.color = 0xFFA9A9;
			}
			x2=x;
			y2=y;
			dir = direction;
			scaleFactor = 1 - (( -(y - FP.camera.y) + 600) / 1200);
			
			if (upImag.flipped == false)
			{
				neckPoint.x = x-12;
			}
			else
			{
				neckPoint.x = x+12;
			}
			neckPoint.y = y;
			
			upImag.scale = scaleFactor * imageScale;
			downImag.scale = scaleFactor * imageScale;
			
			upReal.scale = scaleFactor * imageScale;
			downReal.scale = scaleFactor * imageScale;
			if (direction > 360)
			{
				direction -= 360;
			}
			if (direction < 0)
			{
				direction += 360;
			}
			dir = direction;
			if (direction > 0 && direction <= 90)
			{
				upImag.flipped = false;
				upReal.flipped = false;
				if (Listener.currentField == false)
				{
					graphic = upImag;
				}
				else
				{
					graphic = upReal;
				}
			}
			else if (direction <= 180)
			{
				upImag.flipped = true;
				upReal.flipped = true;
				if (Listener.currentField == false)
				{
					graphic = upImag;
				}
				else
				{
					graphic = upReal;
				}
			}
			else if (direction <= 270)
			{
				downImag.flipped = true;
				downReal.flipped = true;
				if (Listener.currentField == false)
				{
					graphic = downImag;
				}
				else
				{
					graphic = downReal;
				}
			}
			else
			{
				downImag.flipped = false;
				downReal.flipped = false;
				if (Listener.currentField == false)
				{
					graphic = downImag;
				}
				else
				{
					graphic = downReal;
				}
			}
			
		}
		}
		public var idleShootTimer:Number = 0;
		public var idleShootTimer2:Number = 1;
		public var idleShootTimer3:Number = 2;
		override public function idleState():void
		{
			idleShootTimer += FP.elapsed;
			idleShootTimer2 += FP.elapsed;
			idleShootTimer3 += FP.elapsed;
			
			idleTimer += FP.elapsed;
			if (idleTimer > 20)
			{
				chargedtimes = 0;
				currentState = "alt1";
			}
			else
			{
				
			
			if (idleShootTimer > 3)
			{
				RBoss.upper.shootDir();
				
				if (phase == false)
				{
					
					shoot(new AniBullet(24, 24, 12, 12, 0, 3, 0.6, false),RBoss.upper.x,RBoss.upper.y);
					shoot(new AniBullet(24, 24, 12, 12, 45, 3, 0.6, false),RBoss.upper.x,RBoss.upper.y);
					shoot(new AniBullet(24, 24, 12, 12, 90, 3, 0.6, false),RBoss.upper.x,RBoss.upper.y);
					shoot(new AniBullet(24, 24, 12, 12, 135, 3, 0.6, false),RBoss.upper.x,RBoss.upper.y);
					shoot(new AniBullet(24, 24, 12, 12, 180, 3, 0.6, false),RBoss.upper.x,RBoss.upper.y);
					shoot(new AniBullet(24, 24, 12, 12, 225, 3, 0.6, false),RBoss.upper.x,RBoss.upper.y);
					shoot(new AniBullet(24, 24, 12, 12, 270, 3, 0.6, false),RBoss.upper.x,RBoss.upper.y);
					shoot(new AniBullet(24, 24, 12, 12, 315, 3, 0.6, false),RBoss.upper.x,RBoss.upper.y);
				}
				if (phase == true)
				{
					
					shoot(new AniBullet(24, 24, 12, 12, 0, 3, 0.6, true),RBoss.upper.x,RBoss.upper.y);
					shoot(new AniBullet(24, 24, 12, 12, 45, 3, 0.6,true),RBoss.upper.x,RBoss.upper.y);
					shoot(new AniBullet(24, 24, 12, 12, 90, 3, 0.6, true),RBoss.upper.x,RBoss.upper.y);
					shoot(new AniBullet(24, 24, 12, 12, 135, 3, 0.6, true),RBoss.upper.x,RBoss.upper.y);
					shoot(new AniBullet(24, 24, 12, 12, 180, 3, 0.6, true),RBoss.upper.x,RBoss.upper.y);
					shoot(new AniBullet(24, 24, 12, 12, 225, 3, 0.6, true),RBoss.upper.x,RBoss.upper.y);
					shoot(new AniBullet(24, 24, 12, 12, 270, 3, 0.6, true),RBoss.upper.x,RBoss.upper.y);
					shoot(new AniBullet(24, 24, 12, 12, 315, 3, 0.6, true),RBoss.upper.x,RBoss.upper.y);
				}
				idleShootTimer = 0;
			}
			if (idleShootTimer2 > 3)
			{
				if (phase == false)
				{
					
					shoot(new AniBullet(24, 24, 12, 12, 0, 3, 0.6, false),RBoss.lower.x,RBoss.lower.y);
					
					shoot(new AniBullet(24, 24, 12, 12, 90, 3, 0.6, false),RBoss.lower.x,RBoss.lower.y);
					
					shoot(new AniBullet(24, 24, 12, 12, 180, 3, 0.6, false),RBoss.lower.x,RBoss.lower.y);
					
					shoot(new AniBullet(24, 24, 12, 12, 270, 3, 0.6, false),RBoss.lower.x,RBoss.lower.y);
					
				}
				if (phase == true)
				{
					
					shoot(new AniBullet(24, 24, 12, 12, 0, 3, 0.6, true),RBoss.lower.x,RBoss.lower.y);
					
					shoot(new AniBullet(24, 24, 12, 12, 90, 3, 0.6, true),RBoss.lower.x,RBoss.lower.y);
					
					shoot(new AniBullet(24, 24, 12, 12, 180, 3, 0.6, true),RBoss.lower.x,RBoss.lower.y);
					
					shoot(new AniBullet(24, 24, 12, 12, 270, 3, 0.6, true),RBoss.lower.x,RBoss.lower.y);
					
				}
				RBoss.lower.shootDir();
				idleShootTimer2 = 0;
			}
			if (idleShootTimer3 > 3)
			{
				RBoss.tail.shootDir();
				shootBurst();
				idleShootTimer3 = 0;
			}
			//move in a counter clockwise diamond
			if (x >= 320 && y >= 240)
			{
				x += 4 * Main.frameRate * FP.elapsed;
				y -= 2* Main.frameRate * FP.elapsed;
				direction = 45;
			}
			if (x < 320 && y >= 240)
			{
				x += 4* Main.frameRate * FP.elapsed;
				y += 2* Main.frameRate * FP.elapsed;
				direction = 315;
			}
			if (x < 320 && y < 240)
			{
				x -= 4* Main.frameRate * FP.elapsed;
				y += 2* Main.frameRate * FP.elapsed;
				direction = 225;
			}
			if (x >= 320 && y < 240)
			{
				x -= 4* Main.frameRate * FP.elapsed;
				y -= 2* Main.frameRate * FP.elapsed;
				direction = 135;
			}
			chargeDir = pointDirection(x,y,Listener.x2,Listener.y2);
			
			}
		}
		public var counter:Number = 0;
		override public function introState():void
		{
			alt2Alarm = 0;
			if (x < 320-8 || x > 320 + 8 || y < 80 - 8 || y > 80 + 8)
			{
				moveDirection(pointDirection(x,y,320,80),3);
				direction=pointDirection(x,y,320,80);
			}else
			{
				counter+= 1;
				chargeDir = pointDirection(x,y,Listener.x2,Listener.y2);
				if (counter % 3 == 1)
				{
				currentState = "alt2";
				}
				else
				{
					currentState = "idle";
				}
			}
			
		}
		
		public var chargedtimes:Number = 0;
		override public function altState1():void
		{
			if (chargedtimes < 5)
			{
				if (direction > 360)
				{
					direction -= 360;
				}
				if (direction < 0)
				{
					direction += 360;
				}
				direction = chargeDir;
				if (y < -400 || y > 900 || x < -400 || x > 1000)
				{
					chargedtimes += 1;
					spawnPoint.x = Math.random()*640;
					if (y < -200)
					{
						spawnPoint.y = -280;
					}
					if (y > 600)
					{
						spawnPoint.y = 680
					}
					x = spawnPoint.x;
					y = spawnPoint.y;
					chargeDir = pointDirection(x,y,Listener.x2,Listener.y2);
				}
				else
				{
					moveDirection(chargeDir,4);
				}
			}
			else
			{
				idleTimer = 0;
				currentState = "intro";
				phase = !phase;
			}
		}
		
		public var goRight:Boolean = false;
		public var alt2ShootTimer:Number = 1;
		public var alt2ShootTimer2:Number = 0;
		public var alt2Alarm:Number = 0;
		override public function altState2():void
		{
			super.altState2();
			alt2Alarm += FP.elapsed;
			if (alt2Alarm > 10)
			{
				currentState = "idle";
			}
			if (x > 400)
			{
				goRight = false;
			}
			else if (x < 240)
			{
				goRight = true;
			}
			if (goRight == false)
			{
				direction = 240;
				x -= 1* Main.frameRate * FP.elapsed;
			}
			else
			{
				direction = 300;
				x += 1 * Main.frameRate * FP.elapsed;
			}
			alt2ShootTimer2 += FP.elapsed;
			if (alt2ShootTimer2 > 3 && RBoss.numDead > 0)
			{
				alt2ShootTimer2 = 0;
				if (phase == false)
				{
					shoot(new Bullet(new Image(Assets.GUEYBULLET2_REAL), 30,30,15,15,pointDirection(x,y,Listener.x2,Listener.y2),6,0,true,0,1,true),x,y,new Image(Assets.GUEYBULLET2_REAL));
					shoot(new Bullet(new Image(Assets.GUEYBULLET2_REAL), 30,30,15,15,pointDirection(x,y,Listener.x2,Listener.y2)+20,6,0,true,0,1,true),x,y,new Image(Assets.GUEYBULLET2_REAL));
					shoot(new Bullet(new Image(Assets.GUEYBULLET2_REAL), 30,30,15,15,pointDirection(x,y,Listener.x2,Listener.y2)-20,6,0,true,0,1,true),x,y,new Image(Assets.GUEYBULLET2_REAL));
				}
				if (phase == true)
				{
					shoot(new Bullet(new Image(Assets.GUEYBULLET2_IMAG), 30,30,15,15,pointDirection(x,y,Listener.x2,Listener.y2),6,0,false,0,1,true),x,y,new Image(Assets.GUEYBULLET2_IMAG));
					shoot(new Bullet(new Image(Assets.GUEYBULLET2_IMAG), 30,30,15,15,pointDirection(x,y,Listener.x2,Listener.y2)+20,6,0,false,0,1,true),x,y,new Image(Assets.GUEYBULLET2_IMAG));
					shoot(new Bullet(new Image(Assets.GUEYBULLET2_IMAG), 30,30,15,15,pointDirection(x,y,Listener.x2,Listener.y2)-20,6,0,false,0,1,true),x,y,new Image(Assets.GUEYBULLET2_IMAG));
				}
			}
			alt2ShootTimer += FP.elapsed;
			if (alt2ShootTimer > 2)
			{
				alt2ShootTimer = 1.8;
				if (phase == false)
				{
					shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,210,5,0,false,0,1,true),x,y,new Image(Assets.GUEYBULLET1_IMAG));
					shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,230,5,0,false,0,1,true),x,y,new Image(Assets.GUEYBULLET1_IMAG));
					shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,250,5,0,false,0,1,true),x,y,new Image(Assets.GUEYBULLET1_IMAG));
					shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,270,5,0,false,0,1,true),x,y,new Image(Assets.GUEYBULLET1_IMAG));
					shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,290,5,0,false,0,1,true),x,y,new Image(Assets.GUEYBULLET1_IMAG));
					shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,310,5,0,false,0,1,true),x,y,new Image(Assets.GUEYBULLET1_IMAG));
					shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,330,5,0,false,0,1,true),x,y,new Image(Assets.GUEYBULLET1_IMAG));
					
					shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,210,5,0,true,0,1,true),RBoss.upper.x,RBoss.upper.y,new Image(Assets.GUEYBULLET1_REAL));
					shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,240,5,0,true,0,1,true),RBoss.upper.x,RBoss.upper.y,new Image(Assets.GUEYBULLET1_REAL));
					shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,270,5,0,true,0,1,true),RBoss.upper.x,RBoss.upper.y,new Image(Assets.GUEYBULLET1_REAL));
					shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,300,5,0,true,0,1,true),RBoss.upper.x,RBoss.upper.y,new Image(Assets.GUEYBULLET1_REAL));
					shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,330,5,0,true,0,1,true),RBoss.upper.x,RBoss.upper.y,new Image(Assets.GUEYBULLET1_REAL));
				}
				if (phase == true)
				{
					shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,210,5,0,true,0,1,true),x,y,new Image(Assets.GUEYBULLET1_REAL));
					shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,230,5,0,true,0,1,true),x,y,new Image(Assets.GUEYBULLET1_REAL));
					shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,250,5,0,true,0,1,true),x,y,new Image(Assets.GUEYBULLET1_REAL));
					shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,270,5,0,true,0,1,true),x,y,new Image(Assets.GUEYBULLET1_REAL));
					shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,290,5,0,true,0,1,true),x,y,new Image(Assets.GUEYBULLET1_REAL));
					shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,310,5,0,true,0,1,true),x,y,new Image(Assets.GUEYBULLET1_REAL));
					shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,330,5,0,true,0,1,true),x,y,new Image(Assets.GUEYBULLET1_REAL));
					
					shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,210,5,0,false,0,1,true),RBoss.upper.x,RBoss.upper.y,new Image(Assets.GUEYBULLET1_IMAG));
					shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,240,5,0,false,0,1,true),RBoss.upper.x,RBoss.upper.y,new Image(Assets.GUEYBULLET1_IMAG));
					shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,270,5,0,false,0,1,true),RBoss.upper.x,RBoss.upper.y,new Image(Assets.GUEYBULLET1_IMAG));
					shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,300,5,0,false,0,1,true),RBoss.upper.x,RBoss.upper.y,new Image(Assets.GUEYBULLET1_IMAG));
					shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,330,5,0,false,0,1,true),RBoss.upper.x,RBoss.upper.y,new Image(Assets.GUEYBULLET1_IMAG));
				}
			}
		}
		
		public function shootBurst():void
		{
			if (RBoss.numDead == 0)
			{
			if (Listener.currentField == false)
			{
				shoot(new Bullet(new Image(Assets.GUEYBULLET2_IMAG), 30,30,15,15,pointDirection(x,y,Listener.x2,Listener.y2),6,0,false,0,1,true),x,y,new Image(Assets.GUEYBULLET2_IMAG));
				shoot(new Bullet(new Image(Assets.GUEYBULLET2_IMAG), 30,30,15,15,pointDirection(x,y,Listener.x2,Listener.y2)+20,6,0,false,0,1,true),x,y,new Image(Assets.GUEYBULLET2_IMAG));
				shoot(new Bullet(new Image(Assets.GUEYBULLET2_IMAG), 30,30,15,15,pointDirection(x,y,Listener.x2,Listener.y2)-20,6,0,false,0,1,true),x,y,new Image(Assets.GUEYBULLET2_IMAG));
			}
			if (Listener.currentField == true)
			{
				shoot(new Bullet(new Image(Assets.GUEYBULLET2_REAL), 30,30,15,15,pointDirection(x,y,Listener.x2,Listener.y2),6,0,true,0,1,true),x,y,new Image(Assets.GUEYBULLET2_REAL));
				shoot(new Bullet(new Image(Assets.GUEYBULLET2_REAL), 30,30,15,15,pointDirection(x,y,Listener.x2,Listener.y2)+20,6,0,true,0,1,true),x,y,new Image(Assets.GUEYBULLET2_REAL));
				shoot(new Bullet(new Image(Assets.GUEYBULLET2_REAL), 30,30,15,15,pointDirection(x,y,Listener.x2,Listener.y2)-20,6,0,true,0,1,true),x,y,new Image(Assets.GUEYBULLET2_REAL));
			}
			}
			else
			{
				if (Listener.currentField == false)
				{
					
					shoot(new TimedBullet(new Image(Assets.GUEYBULLET2_IMAG),pointDirection(x,y,Listener.x2,Listener.y2),6,0.8,0,false,0,1,true),x,y,new Image(Assets.GUEYBULLET2_IMAG));
					shoot(new TimedBullet(new Image(Assets.GUEYBULLET2_IMAG),pointDirection(x,y,Listener.x2,Listener.y2)+20,6,0.6,0,false,0,1,true),x,y,new Image(Assets.GUEYBULLET2_IMAG));
					shoot(new TimedBullet(new Image(Assets.GUEYBULLET2_IMAG),pointDirection(x,y,Listener.x2,Listener.y2)-20,6,0.3,0,false,0,1,true),x,y,new Image(Assets.GUEYBULLET2_IMAG));
				}
				if (Listener.currentField == true)
				{
					shoot(new TimedBullet(new Image(Assets.GUEYBULLET2_REAL),pointDirection(x,y,Listener.x2,Listener.y2),6,0.8,0,true,0,1,true),x,y,new Image(Assets.GUEYBULLET2_REAL));
					shoot(new TimedBullet(new Image(Assets.GUEYBULLET2_REAL),pointDirection(x,y,Listener.x2,Listener.y2)+20,6,0.6,0,true,0,1,true),x,y,new Image(Assets.GUEYBULLET2_REAL));
					shoot(new TimedBullet(new Image(Assets.GUEYBULLET2_REAL),pointDirection(x,y,Listener.x2,Listener.y2)-20,6,0.3,0,true,0,1,true),x,y,new Image(Assets.GUEYBULLET2_REAL));
				}
			}
			
		}
	}
}