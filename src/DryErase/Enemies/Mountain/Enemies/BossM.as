package DryErase.Enemies.Mountain.Enemies
{
	import DryErase.Cutscenes.scenes.M_AfterLevelScene;
	import DryErase.Enemies.Boss;
	import DryErase.Enemies.Bullets.AniBullet;
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Mountain.WaveControl.Master_M;
	import DryErase.Hero.Listener;
	
	import flash.display.BitmapData;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;

	public class BossM extends Boss
	{
		
		private var imagImage:Spritemap;
		private var realImage:Spritemap;
		private var shadow:Spritemap;
		
		
		public function BossM()
		{
			imagImage = new Spritemap(Assets.lungImag, 556, 750);
			realImage = new Spritemap(Assets.lungReal, 556, 750);
			shadow = new Spritemap(Assets.lungReal, 556, 750);
			
			imagImage.add("idle",[0,1,2,3],6, true);
			realImage.add("idle",[0,1,2,3],6, true);
			shadow.add("idle",[0,1,2,3],6, true);
			
			imagImage.play("idle");
			realImage.play("idle");
			shadow.play("idle");
			
			super(imagImage,realImage,shadow,650,5000,270,600,300,300,200,1.4);
			
			x = 320;
			y = -400;
		}
		public static var introFlag:Boolean = false;
		override public function introState():void
		{
			invincible = 0.8;
			if (y < 160)
			{
				y += 4;
			}
			else if (introFlag == true)
			{
				currentState = "idle";
			}
		}
		
		override public function update():void
		{
			
			super.update();
			if (deathTrigger == true)
			{
				currentState = "killed";
			}
		}
		
		//public var dirRight:Boolean = true;
		public var currentDir:Number = 0;
		public var idleShoot:Number = 0;
		public var randomNum:Number = 0;
		override public function idleState():void
		{
			if (direction!=270)
			{
				turnTowards(270,2);
			}
			super.idleState();
			randomNum = Math.random();
			//ALTSTATE 1 RESET VARIABLES
			beginShoot = false;
			targetDir = 200;
			shootAlarm = 0;
			wave = 0;
			
			//ALTSTATE 2 RESET VARIABLES
			altTimer[1] = 0;
			alt2pauseTimer = -2;
			alt2dirRight= 360;
			alt2dirLeft = 180;
			swingOut = false;
			alt2switch = 0;
			alt2bool = false;
			
			//ALTSTATE 3 RESET VARIABLES
			resetalt3 = false;
			altTimer[2] = 0;
			
			idleShoot += FP.elapsed;
			currentDir += 0.5;
			if (idleShoot > 0.25)
			{
				shoot(new AniBullet(24, 24, 12, 12, currentDir, 3, 0.2, false, "lung"),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 60 + currentDir, 3, 0.2, false, "lung"),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 120 + currentDir, 3, 0.2, false, "lung"),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 180 + currentDir, 3, 0.2, false, "lung"),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 240 + currentDir, 3, 0.2, false, "lung"),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 300 + currentDir, 3, 0.2, false, "lung"),x,y);
				
				
				shoot(new AniBullet(24, 24, 12, 12, -currentDir, 3, -0.2, true, "lung"),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 60 - currentDir, 3, -0.2, true, "lung"),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 120 - currentDir, 3, -0.2, true, "lung"),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 180 - currentDir, 3, -0.2, true, "lung"),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 240 - currentDir, 3, -0.2, true, "lung"),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 300 - currentDir, 3, -0.2, true, "lung"),x,y);
				idleShoot = 0;
			}
			
			if (idleTimer > 7)
			{
				if (randomNum > 0.8)
				{
					currentState = "alt1";
				}
				else if (randomNum <= 0.3 && hitPoints < 500)
				{
					currentState = "alt3";
					
				}
				else
				{
					currentState = "basic";
					targetDir = 340;
				}
				
				//currentState = "alt3";
			}
	
		}
		
		override public function basicState():void
		{
			//ALTSTATE 2 RESET VARIABLES
			altTimer[1] = 0;
			alt2pauseTimer = -2;
			alt2dirRight = 360;
			alt2dirLeft = 180;
			swingOut = false;
			alt2switch = 0;
			alt2bool = false;
			
			currentDir += 1;
			idleTimer = 0;
			if (targetDir == 340)
			{
				if (direction!=340)
				{
					turnTowards(targetDir, 2);
				}
				else
				{
					targetDir = 200;
				}
				
			}
			else if (direction != 200)
			{
				basicTimer = 0;
				turnTowards(targetDir, 1);
			}
			else if (basicTimer >= 1)
			{
				randomNum = Math.random();
				if (randomNum <= 0.3)
				{
					//ALTSTATE 1 RESET VARIABLES
					beginShoot = false;
					
					shootAlarm = 0;
					wave = 0;
					currentState = "alt1";
				}
				else if (randomNum <= 0.8)
				{
					//ALTSTATE 1 RESET VARIABLES
					beginShoot = false;
					
					shootAlarm = 0;
					wave = 0;
					currentState = "alt2";
				}
				else
				{
					//ALTSTATE 1 RESET VARIABLES
					beginShoot = false;
					
					shootAlarm = 0;
					wave = 0;
					currentState = "idle";
				}
			}
			super.basicState();
			idleShoot += FP.elapsed;
			if (idleShoot > 0.15)
			{
				if (randomNum > 0.4)
				{
				shoot(new AniBullet(24, 24, 12, 12, currentDir, 3, 0.2, false, "lung"),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 60 + currentDir, 3, 0.2, false, "lung"),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 120 + currentDir, 3, 0.2, false, "lung"),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 180 + currentDir, 3, 0.2, false, "lung"),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 240 + currentDir, 3, 0.2, false, "lung"),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 300 + currentDir, 3, 0.2, false, "lung"),x,y);
				
				shoot(new AniBullet(24, 24, 12, 12, Math.sin(wave)*5+direction+2,6,0,true, "lung"),x+lengthDirX(96,direction),y+lengthDirY(96,direction));
				shoot(new AniBullet(24, 24, 12, 12, Math.sin(-wave)*5+direction-2,6,0,true, "lung"),x+lengthDirX(96,direction),y+lengthDirY(96,direction));
				}
				else
				{
				
				shoot(new AniBullet(24, 24, 12, 12, -currentDir, 3, -0.2, true, "lung"),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 60 - currentDir, 3, -0.2, true, "lung"),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 120 - currentDir, 3, -0.2, true, "lung"),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 180 - currentDir, 3, -0.2, true, "lung"),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 240 - currentDir, 3, -0.2, true, "lung"),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 300 - currentDir, 3, -0.2, true, "lung"),x,y);
				
				
				shoot(new AniBullet(24, 24, 12, 12, Math.sin(wave)*8+direction+2,6,0,false, "lung"),x+lengthDirX(96,direction),y+lengthDirY(96,direction));
				shoot(new AniBullet(24, 24, 12, 12, Math.sin(-wave)*8+direction-2,6,0,false, "lung"),x+lengthDirX(96,direction),y+lengthDirY(96,direction));
				
				
				}
				
				
				
				idleShoot = 0;
			}
			
		}
		
		
		public var beginShoot:Boolean = false;
		public var targetDir:Number = 200;
		public var shootAlarm:Number = 0;
		public var wave:Number = 0;
		public var switchTimer:Number = 0;
		public var switchBool:Boolean = false;
		override public function altState1():void
		{
			//ALTSTATE 2 RESET VARIABLES
			altTimer[1] = 0;
			alt2pauseTimer = -2;
			alt2dirRight= 360;
			alt2dirLeft = 180;
			swingOut = false;
			alt2switch = 0;
			alt2bool = false;
			
			shootAlarm += FP.elapsed;
			if (shootAlarm >= 0.1)
			{
				shootAlarm = 0;
				shoot(new AniBullet(24, 24, 12, 12, Math.sin(wave)*5+direction+2,6,0,true, "lung"),x+lengthDirX(96,direction),y+lengthDirY(96,direction));
				shoot(new AniBullet(24, 24, 12, 12, Math.sin(-wave)*5+direction-2,6,0,true, "lung"),x+lengthDirX(96,direction),y+lengthDirY(96,direction));
				shoot(new AniBullet(24, 24, 12, 12, Math.sin(wave)*8+direction+2,6,0,false, "lung"),x+lengthDirX(96,direction),y+lengthDirY(96,direction));
				shoot(new AniBullet(24, 24, 12, 12, Math.sin(-wave)*8+direction-2,6,0,false, "lung"),x+lengthDirX(96,direction),y+lengthDirY(96,direction));
			}
			idleTimer = 0;
			wave += 0.1;
			if (targetDir == 200)
			{
				if (direction!=200)
				{
					turnTowards(targetDir, 2);
				}
				else
				{
					targetDir = 340;
				}
			}
			else if (direction != 340)
			{
				altTimer[0] = 0;
				turnTowards(targetDir, 1);
				
			}
			else
			{
				super.altState1();
				if (altTimer[0] > 0.5)
				{
					if (randomNum > 0.6)
					{
						currentState = "idle";
					}
					else if (randomNum > 0.3)
					{
						currentState = "alt2";
					}
					else if (hitPoints < 750)
					{
						currentState = "alt3";
					}
					else
					{
						currentState = "idle";
					}
				}
			}
		}
		
		
		public var alt2pauseTimer:Number = -2;
		public var alt2dirRight:Number = 360;
		public var alt2dirLeft:Number = 180;
		public var swingOut:Boolean = false;
		public var alt2switch:Number = 0;
		public var alt2bool:Boolean = false;
		override public function altState2():void
		{
			wave += 0.1;
			randomNum = Math.random();
			if (direction!=270)
			{
				turnTowards(270,2);
			}
			
			alt2pauseTimer += FP.elapsed;
			if (alt2pauseTimer > 3)
			{
				swingOut = !swingOut;
				alt2pauseTimer = 0;
			}
			
			alt2switch+= FP.elapsed;
			if (alt2switch > 1)
			{
				alt2bool = !alt2bool;
				alt2switch = 0;
			}
			
			if (swingOut == true)
			{
				alt2dirRight += 0.5;
				alt2dirLeft -= 0.5;
			}
			else
			{
				alt2dirRight -= 0.5;
				alt2dirLeft += 0.5;
			}
			super.altState2();
			shootAlarm += FP.elapsed;
			if (shootAlarm >= 0.18)
			{
				
				shoot(new AniBullet(24, 24, 12, 12, Math.sin(wave)*8+alt2dirRight+2,4,0,!alt2bool, "lung"),x + 144,y+84);
				shoot(new AniBullet(24, 24, 12, 12, Math.sin(-wave)*8+alt2dirRight-2,4,0,!alt2bool, "lung"),x + 144,y+84);
				
				shoot(new AniBullet(24, 24, 12, 12, Math.sin(wave)*8+alt2dirLeft+2,4,0,!alt2bool, "lung"),x - 144,y+84);
				shoot(new AniBullet(24, 24, 12, 12, Math.sin(-wave)*8+alt2dirLeft-2,4,0,!alt2bool, "lung"),x - 144,y+84);
				
				shoot(new AniBullet(24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2),3,0,alt2bool, "lung"),x + lengthDirX(84,direction),y + lengthDirY(84,direction));
				shoot(new AniBullet(24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2)+15,3,0,alt2bool, "lung"),x + lengthDirX(84,direction),y + lengthDirY(84,direction));
				shoot(new AniBullet(24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2)-15,3,0,alt2bool, "lung"),x + lengthDirX(84,direction),y + lengthDirY(84,direction));
			
				shootAlarm = 0;
			}
			
			if (altTimer[1] > 10)
			{
				if (randomNum > 0.6)
				{
					currentState = "idle";
				}
				else if (randomNum > 0.3)
				{
					currentState = "alt1";
				}
				else if (hitPoints < 500)
				{
					currentState = "alt3";
				}
				else
				{
					currentState = "basic";
				}
			}
		}
		
		public var resetalt3:Boolean = false;
		public var alt3shoot:Number = 0;
		public var alt3shootTimes:Number = 0;
		public var shootAlarm2:Number = 0;
		override public function altState3():void
		{
			if (direction!=270)
			{
				turnTowards(270,2);
			}
			wave += 0.1;
			super.altState3();
			if (resetalt3 == false)
			{
				alt2dirRight = 420;
				alt2dirLeft = 120;
				resetalt3 = true;
			}
			else
			{
				if (alt2dirRight > 270 + 1.5)
				{
					alt2dirRight -= 1.5;
				}
				else
				{
					alt2dirRight = 270;
				}
				if (alt2dirLeft < 270 - 1.5)
				{
					alt2dirLeft += 1.5;
				}
				else
				{
					alt2dirLeft = 270;
				}
			}
			shootAlarm += FP.elapsed;
			alt3shoot += FP.elapsed;
			shootAlarm2 += FP.elapsed;
			if (shootAlarm >= 0.1)
			{
				shoot(new AniBullet(24, 24, 12, 12, Math.sin(wave)*5+alt2dirRight+2,4,0,true, "lung"),x + 142,y+84);
				shoot(new AniBullet(24, 24, 12, 12, Math.sin(-wave)*5+alt2dirRight-2,4,0,true, "lung"),x + 142,y+84);
				shoot(new AniBullet(24, 24, 12, 12, Math.sin(wave)*8+alt2dirRight+2,4,0,false, "lung"),x + 142,y+84);
				shoot(new AniBullet(24, 24, 12, 12, Math.sin(-wave)*8+alt2dirRight-2,4,0,false, "lung"),x + 142,y+84);
				
				shoot(new AniBullet(24, 24, 12, 12, Math.sin(wave)*5+alt2dirLeft+2,4,0,true, "lung"),x - 142,y+84);
				shoot(new AniBullet(24, 24, 12, 12, Math.sin(-wave)*5+alt2dirLeft-2,4,0,true, "lung"),x - 142,y+84);
				shoot(new AniBullet(24, 24, 12, 12, Math.sin(wave)*8+alt2dirLeft+2,4,0,false, "lung"),x - 142,y+84);
				shoot(new AniBullet(24, 24, 12, 12, Math.sin(-wave)*8+alt2dirLeft-2,4,0,false, "lung"),x - 142,y+84);
				
				shootAlarm = 0;
				
			}
			if (alt3shoot >= 1.6)
			{
				if (alt3shootTimes < 4)
				{
					if (shootAlarm2 >= 0.1)
					{
					shoot(new AniBullet(24,24,12,12,pointDirection(x,y,Listener.x2, Listener.y2),4,0,Listener.currentField, "lung"),x,y+84);
					shoot(new AniBullet(24,24,12,12,pointDirection(x,y,Listener.x2, Listener.y2)+30,4,0,Listener.currentField, "lung"),x,y+84);
					shoot(new AniBullet(24,24,12,12,pointDirection(x,y,Listener.x2, Listener.y2)-30,4,0,Listener.currentField, "lung"),x,y+84);
					shoot(new AniBullet(24,24,12,12,pointDirection(x,y,Listener.x2, Listener.y2)+15,4,0,!Listener.currentField, "lung"),x,y+84);
					shoot(new AniBullet(24,24,12,12,pointDirection(x,y,Listener.x2, Listener.y2)-15,4,0,!Listener.currentField, "lung"),x,y+84);
					shootAlarm2 = 0;
					alt3shootTimes += 1;
					}
				}
				else
				{
					alt3shoot = 0;
					alt3shootTimes = 0;
				}
			}
			
			if (altTimer[2] > 12)
			{
				currentState = "idle";
			}
		}
		
		override public function killedState():void
		{
			Master_M.bossDead = true;
			FP.world.remove(this);
		}
		
	}
}