package DryErase.Enemies.Mountain.Enemies
{
	import DryErase.Effects.*;
	import DryErase.Enemies.Boss;
	import DryErase.Enemies.Bullets.*;
	import DryErase.Enemies.Mountain.WaveControl.Master_M;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class MinibossM extends Boss
	{
		public var flyAway:Boolean;
		
		public function MinibossM(firstTime:Boolean = true)
		{
			super(new Image(Assets.M_MBOSS_IMAG), new Image(Assets.M_MBOSS_REAL), new Image(Assets.M_MBOSS_REAL), 400, 1000, 270, 300, 300, 150, 150, 1);
			x = 320;
			y = -100;
			
			flyAway = firstTime;
		}
		
		override public function introState():void
		{
			if (y < 120)
			{
				y += 4;
			}
			else
			{
				currentState = "idle";
			}
		}
		
		public var idleShoot:Number = 0;
		public var idleImag:Boolean = false;
		public var idleBurst:Boolean = false;
		public var switchStates:Number;
		public var lazered:Boolean = false;
		public var flipswitch:Boolean = false;
		override public function idleState():void
		{
			if (x > 324 || x < 316 || y > 124 || y < 116)
			{
				direction = pointDirection(x,y,320,120);
				moveDirection(pointDirection(x,y,320,120),4);
			}
			else
			{
				super.idleState();
				basicSmallshoot = 0;
				basicWaveAlarm = 1;
				basicWave = 0;
				basicWaveCount = 0;
				chargedTimes = 0;
				resetIdle();
				idleShoot += FP.elapsed;
				turnTowards(270,4);
				laserTimer = 0;
				if (idleTimer > 5)
				{
					if (lazered == false && hitPoints < 238)
					{
						lazered = true;
						currentState = "alt3";
					}
					else
					{
						switchStates = Math.random();
						if (switchStates > 0.75)
						{
							currentState = "alt1";
						}
						else if (switchStates > 0.5)
						{
							currentState = "alt2";
						}
						else
						{
							currentState = "basic";
						}
					}
				}
				if (idleShoot > 0.5)
				{
					idleShoot = 0;
					if (flipswitch == false)
					{
						shoot(new AniBullet(24,24,12,12,270,4,0,false),x,y+96);
						shoot(new AniBullet(24,24,12,12,300,4,1,false),x,y+96);
						shoot(new AniBullet(24,24,12,12,240,4,-1,false),x,y+96);
						shoot(new AniBullet(24,24,12,12,270,4,0,true),x,y+96);
						shoot(new AniBullet(24,24,12,12,300,4,-1,true),x,y+96);
						shoot(new AniBullet(24,24,12,12,240,4,1,true),x,y+96);
						flipswitch = true;
				
					}
					else
					{
						shoot(new AniBullet(24,24,12,12,270,4,0,false),x,y+96);
						shoot(new AniBullet(24,24,12,12,300,4,-1,false),x,y+96);
						shoot(new AniBullet(24,24,12,12,240,4,1,false),x,y+96);
						shoot(new AniBullet(24,24,12,12,270,4,0,true),x,y+96);
						shoot(new AniBullet(24,24,12,12,300,4,1,true),x,y+96);
						shoot(new AniBullet(24,24,12,12,240,4,-1,true),x,y+96);
						flipswitch = false;
					}
				}
			}
		}
		
		public var basicSmallshoot:Number = 0;
		public var basicWaveAlarm:Number = 1;
		public var basicWave:Number = 0;
		public var basicWaveCount:Number = 0;
		override public function basicState():void
		{
			super.basicState();
			basicSmallshoot += FP.elapsed;
			if (basicWaveAlarm <= 2)
			{
				basicWaveAlarm += FP.elapsed;
				turnTowards(pointDirection(x,y,Listener.x2,Listener.y2),3);
			}
			if (basicWaveAlarm > 2 && basicWaveCount < 5)
			{
				if (basicWave < 5)
				{
					if (basicSmallshoot > 0.2)
					{
						basicSmallshoot = 0;
						basicWave += 1;
						
						if (Listener.currentField == false)
						{
							shoot(new AniBullet(24,24,12,12,direction,7,0,false),x + lengthDirX(128,direction),y + lengthDirY(128,direction));
							shoot(new AniBullet(24,24,12,12,direction+5,7,0,false),x + lengthDirX(128,direction),y + lengthDirY(128,direction));
							shoot(new AniBullet(24,24,12,12,direction-5,7,0,false),x + lengthDirX(128,direction),y + lengthDirY(128,direction));
							shoot(new AniBullet(24,24,12,12,direction+10,7,0,false),x + lengthDirX(128,direction),y + lengthDirY(128,direction));
							shoot(new AniBullet(24,24,12,12,direction-10,7,0,false),x + lengthDirX(128,direction),y + lengthDirY(128,direction));
							shoot(new AniBullet(24,24,12,12,direction+15,7,0,false),x + lengthDirX(128,direction),y + lengthDirY(128,direction));
							shoot(new AniBullet(24,24,12,12,direction-15,7,0,false),x + lengthDirX(128,direction),y + lengthDirY(128,direction));
							shoot(new AniBullet(24,24,12,12,direction+20,7,0,false),x + lengthDirX(128,direction),y + lengthDirY(128,direction));
							shoot(new AniBullet(24,24,12,12,direction-20,7,0,false),x + lengthDirX(128,direction),y + lengthDirY(128,direction));
						}
						else
						{
							shoot(new AniBullet(24,24,12,12,direction,7,0,true),x + lengthDirX(128,direction),y + lengthDirY(128,direction));
							shoot(new AniBullet(24,24,12,12,direction+5,7,0,true),x + lengthDirX(128,direction),y + lengthDirY(128,direction));
							shoot(new AniBullet(24,24,12,12,direction-5,7,0,true),x + lengthDirX(128,direction),y + lengthDirY(128,direction));
							shoot(new AniBullet(24,24,12,12,direction+10,7,0,true),x + lengthDirX(128,direction),y + lengthDirY(128,direction));
							shoot(new AniBullet(24,24,12,12,direction-10,7,0,true),x + lengthDirX(128,direction),y + lengthDirY(128,direction));
							shoot(new AniBullet(24,24,12,12,direction+15,7,0,true),x + lengthDirX(128,direction),y + lengthDirY(128,direction));
							shoot(new AniBullet(24,24,12,12,direction-15,7,0,true),x + lengthDirX(128,direction),y + lengthDirY(128,direction));
							shoot(new AniBullet(24,24,12,12,direction+20,7,0,true),x + lengthDirX(128,direction),y + lengthDirY(128,direction));
							shoot(new AniBullet(24,24,12,12,direction-20,7,0,true),x + lengthDirX(128,direction),y + lengthDirY(128,direction));
						}
					}
				}
				else
				{
					basicWave = 0;
					basicWaveAlarm = 0;
					basicWaveCount += 1;
				}
			}
			else if (basicWaveCount >= 5)
			{
				currentState = "idle";
			}
				
		}
		
		public var chargedTimes:Number = 0;		
		public var alt1Shoot:Number = 0;
		//charging forward to where the player is
		override public function altState1():void
		{
			if (chargedTimes < 4)
			{
				super.altState1();
				y += 8 * Main.frameRate * FP.elapsed;
				if (y > 640)
				{
					y = - 150;
					x = Listener.x2;
					chargedTimes += 1;
				}
			}
			else
			{
				currentState = "idle";
			}
		}
		
		//Large spray of bullets in a wide circle
		public var alt2Shoot:Number = 0;
		override public function altState2():void
		{
			super.altState2();
			alt2Shoot += FP.elapsed;
			if (altTimer[1] < 5)
			{
				if (alt2Shoot > 0.25)
				{
					alt2Shoot = 0;
					shoot(new AniBullet(24, 24, 12, 12, 0, 3, 0.2, false),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 45, 3, 0.2, false),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 90, 3, 0.2, false),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 135, 3, 0.2, false),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 180, 3, 0.2, false),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 225, 3, 0.2, false),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 270, 3, 0.2, false),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 315, 3, 0.2, false),x,y);
					
					shoot(new AniBullet(24, 24, 12, 12, 0, 3, -0.2, true),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 45, 3, -0.2, true),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 90, 3, -0.2, true),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 135, 3, -0.2, true),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 180, 3, -0.2, true),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 225, 3, -0.2, true),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 270, 3, -0.2, true),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 315, 3, -0.2, true),x,y);
				}
			}
			else
			{
				currentState = "idle";	
			}
		}
		
		public var flashBeam:Boolean = false;
		public var laserTimer:Number = 0;
		public var shootTimer:Number = 0;
		override public function altState3():void
		{
			super.altState3();
			invincible = 1;
			if (x < 316 || x > 324 || y < 236 || y > 244)
			{
				turnTowards(pointDirection(x,y,320,240),5);
				moveDirection(direction,4);
			}
			
			if (laserTimer < 10)
			{
				direction += 1 * Main.frameRate * FP.elapsed;
				shootTimer += FP.elapsed;
				laserTimer += FP.elapsed;
				if (shootTimer > 0.1)
				{
					shoot(new AniBullet(24, 24, 12, 12, direction, 5,0, false),x,y);
					shoot(new AniBullet(24, 24, 12, 12,direction + 45, 5, 0, true),x,y);
					shoot(new AniBullet(24, 24, 12, 12, direction + 90, 5, 0, false),x,y);
					shoot(new AniBullet(24, 24, 12, 12, direction + 135, 5,0, true),x,y);
					shoot(new AniBullet(24, 24, 12, 12, direction + 180, 5, 0, false),x,y);
					shoot(new AniBullet(24, 24, 12, 12, direction + 225, 5, 0, true),x,y);
					shoot(new AniBullet(24, 24, 12, 12, direction + 270, 5, 0, false),x,y);
					shoot(new AniBullet(24, 24, 12, 12, direction + 315, 5, 0, true),x,y);
					shootTimer = 0;
				}
			
			}	
			else if (laserTimer < 12)
			{
				laserTimer += FP.elapsed;
			}
			else
			{
				currentState = "idle";
			
			}
			
		}
		
		override public function update():void
		{
			super.update();
			if (this.deathTrigger == true)
			{
				killedState();
			}
		}
		override public function killedState():void
		{
			FP.world.remove(this);
		}
		override public function removed():void
		{
			//super.removed();
			if (flyAway == true)
			{
				Master_M.minibossKilled = true;
				FP.world.add(new MinibossMFly(x,y,270,currentField));
			}
			else
			{
				Master_M.canCreateBoss = true;
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
			super.removed();
		}
			
	}
}