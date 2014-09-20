package DryErase.Enemies.Forest.Enemies.Boss
{
	import DryErase.Enemies.Boss;
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Bullets.TimedBullet;
	import DryErase.Enemies.Forest.WaveControl.Master_F;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;

	public class FMuon extends Boss
	{
		public static var enter:Boolean = false;
		
		public var sImag:Spritemap = new Spritemap(Assets.F_MUON_IMAG,450,225);
		public var sReal:Spritemap = new Spritemap(Assets.F_MUON_REAL, 450, 225);
		public var sShadow:Spritemap = new Spritemap(Assets.F_MUON_REAL, 450, 225);
		
		public var shootTimer:Number = 0;
		
		public var last:String = "intro";
		
		public static var defeated:Boolean = false;
		
		public function FMuon()
		{
			sImag.add("normal", [1], 0, false);
			sImag.add("rush",[0],0,false);
			sReal.add("normal", [1], 0, false);
			sReal.add("rush", [0], 0, false);
			sShadow.add("normal",[1],0,false);
			sShadow.add("rush",[0],0,false);
			
			super(sImag, sReal, sShadow, 300, 2500, 270, 150,300,75, 150, 1.5);
			y = -400;
			x = 320;
			
			enter = true;
			defeated = false;
		}
		
		override public function update():void
		{
			
			if (deathTrigger == true)
			{
				defeated = true;
				FP.world.remove(this);
			}
			else
			{
				super.update();
				shootTimer += FP.elapsed;
				
			}
		}
		override public function idleState():void
		{
			FTau.enter = true;
			y = -400;
			x = 320;
			super.idleState();
			
		//	if (enter == true)
			{
				var random:Number = Math.random();
				if (random < 0.3)
				{
					if (last != "alt2")
					{
						turnRight = Boolean(Math.round(Math.random()));
						count = 0;
						currentState = "alt2";
					}
					else
					{
						random = Math.random();
					}
				}
				else if (random < 0.5)
				{
					if (last != "alt1")
					{
					turnRight = Boolean(Math.round(Math.random()));
					currentState = "intro";
					}
					else
					{
						random = Math.random();
					}
				}
				else if (random < 0.8)
				{
					if (last != "basic")
					{
						currentState = "basic";
					}
					else
					{
						random = Math.random();
					}
				}
				else if (hitPoints < 300)
				{
					if (last != "alt3")
					{
					x=100;
					currentState = "alt3";
					}
					else
					{
						random = Math.random();
					}
				}
				else
				{
					random = Math.random();
				}
			}
		}
		
		override public function introState():void
		{
			last = "intro";
			if (x < 320-8 || x > 320 + 8 || y < 80 - 8 || y > 80 + 8)
			{
				direction = 270;
				moveDirection(pointDirection(x,y,320,80),3);
				sImag.play("rush");
				sReal.play("rush");
				sShadow.play("rush");
			}
			else
			{
				currentState = "alt1";
				if (FTau.defeated == false)
				{
					FMuon.enter = false;
				}
			}
			
			
		}
		
		public var count:Number = 0;
		override public function altState1():void
		{
			last = "alt1";
			super.altState1();
			if (altTimer[0] < 10)
			{
				sImag.play("normal");
				sReal.play("normal");
				sShadow.play("normal");
				
				if (shootTimer > 0.5)
				{
					shootTimer = 0;
					shootArc();
					if (FTau.defeated)
					{
						shootFan2();
					}
				}
				direction = 270;
			}
			else if (y < 800)
			{
				if (shootTimer > 2)
				{
					shootTimer = 0;
					shootMissile();
				}
				sImag.play("rush");
				sReal.play("rush");
				sShadow.play("rush");
				moveDirection(direction, 5.5);
				if (turnRight)
				{
					direction += 0.3 * Main.frameRate * FP.elapsed;
				}
				else
				{
					direction -= 0.3 * Main.frameRate * FP.elapsed;
				}
			}
			else
			{
				currentState = "idle";
				if (FTau.defeated == false)
				{
					FMuon.enter = false;
				}
			}
		}
		
		public var turnRight:Boolean = true;
		override public function altState2():void
		{
			last = "alt2";
			moveDirection(direction, 5.5);
			if (shootTimer > 0.5)
			{
				shootTimer = 0;
				shoottwoBeam();
				if (FTau.defeated)
				{
					shootTwist();
				}
			}
			if (turnRight)
			{
				if (y < - 100)
				{
					x = 200;
					direction = 270;
				}
				else
				{
					
					direction += 0.3 * Main.frameRate * FP.elapsed;
				}
			}
			else
			{
				if (y < - 100)
				{
					x = 440;
					direction = 270;
				}
				else
				{

					direction -= 0.3 * Main.frameRate * FP.elapsed;
				}
			}
			if (y > 800)
			{
				turnRight = Boolean(Math.round(Math.random()));
				count += 1;
				y = - 400;
				if (count > 3)
				{
					currentState = "idle";
					if (FTau.defeated == false)
					{
						FMuon.enter = false;
					}
				}
			}
		}
		override public function altState3():void
		{
			last = "alt3";
			super.altState3();
			sImag.play("rush");
			sReal.play("rush");
			sShadow.play("rush");
			if (shootTimer > 0.5)
			{
				shootTimer = 0;
				shootFan();
				if (FTau.defeated)
				{
					shoottwoBeam2();
				}
			}
			if (altTimer[2] < 5)
			{
				direction = 270;
				moveDirection(direction, 3.5);
			}
			else if (altTimer[2] < 10)
			{
				direction = 30;
				moveDirection(direction, 3.5);
			}
			else if (altTimer[2] < 15)
			{
				direction = 180;
				moveDirection(direction, 3.5);
			}
			else if (altTimer[2] < 20)
			{
				direction = 300;
				moveDirection(direction, 3.5);
			}
			else
			{
				direction = 90;
				moveDirection(direction, 5.5);
				if (y < -400)
				{
					currentState = "idle";
				}
			}
		}
		
		override public function basicState():void
		{
			last = "basic";
			super.basicState();
			if (shootTimer > 0.85)
			{
				shootTimer = 0;
				shootFan();
				if (FTau.defeated)
				{
					shoottwoBeam2();
				}
			}
			if (basicTimer < 4)
			{
				direction = pointDirection(x,y,320,240);
				moveDirection(direction,2);
			}
			else if (basicTimer < 16)
			{
				circleAround(320,240,4,true);
				
			}
			else
			{
				direction = 270;
				moveDirection(direction,4);
			}
			if (y > 800)
			{
				currentState = "idle";
				if (FTau.defeated == false)
				{
					FMuon.enter = false;
				}
			}
		}
		override public function removed():void
		{
			super.removed();
			if (FTau.defeated == true)
			{
				Master_F.bossDead = true;
			}
		}
		public function shootArc():void
		{
			shoot(new Bullet(new Image(Assets.MUONBULLET_REAL), 24,24,12,12,direction,5,0,true,3),x,y,new Image(Assets.MUONBULLET_REAL));
			shoot(new Bullet(new Image(Assets.MUONBULLET_REAL), 24,24,12,12,direction-16,5,0,true,3),x,y,new Image(Assets.MUONBULLET_REAL));
			shoot(new Bullet(new Image(Assets.MUONBULLET_REAL), 24,24,12,12,direction+16,5,0,true,3),x,y,new Image(Assets.MUONBULLET_REAL));
			shoot(new Bullet(new Image(Assets.MUONBULLET_REAL), 24,24,12,12,direction-32,5,0,true,3),x,y,new Image(Assets.MUONBULLET_REAL));
			shoot(new Bullet(new Image(Assets.MUONBULLET_REAL), 24,24,12,12,direction+32,5,0,true,3),x,y,new Image(Assets.MUONBULLET_REAL));
		}
		public function shoottwoBeam():void
		{
			shoot(new Bullet(new Image(Assets.MUONBULLET_REAL), 24,24,12,12,direction-90,5,0,true,3),x,y,new Image(Assets.MUONBULLET_REAL));	
			shoot(new Bullet(new Image(Assets.MUONBULLET_REAL), 24,24,12,12,direction+90,5,0,true,3),x,y,new Image(Assets.MUONBULLET_REAL));
		}
		public function shootFan():void
		{
			shoot(new Bullet(new Image(Assets.MUONBULLET_REAL), 24,24,12,12,direction,5,0,true,3),x,y,new Image(Assets.MUONBULLET_REAL));
			shoot(new Bullet(new Image(Assets.MUONBULLET_REAL), 24,24,12,12,direction+45,5,0,true,3),x,y,new Image(Assets.MUONBULLET_REAL));
			shoot(new Bullet(new Image(Assets.MUONBULLET_REAL), 24,24,12,12,direction+90,5,0,true,3),x,y,new Image(Assets.MUONBULLET_REAL));
			shoot(new Bullet(new Image(Assets.MUONBULLET_REAL), 24,24,12,12,direction+135,5,0,true,3),x,y,new Image(Assets.MUONBULLET_REAL));
			shoot(new Bullet(new Image(Assets.MUONBULLET_REAL), 24,24,12,12,direction+180,5,0,true,3),x,y,new Image(Assets.MUONBULLET_REAL));
			shoot(new Bullet(new Image(Assets.MUONBULLET_REAL), 24,24,12,12,direction+225,5,0,true,3),x,y,new Image(Assets.MUONBULLET_REAL));
			shoot(new Bullet(new Image(Assets.MUONBULLET_REAL), 24,24,12,12,direction+270,5,0,true,3),x,y,new Image(Assets.MUONBULLET_REAL));
			shoot(new Bullet(new Image(Assets.MUONBULLET_REAL), 24,24,12,12,direction+315,5,0,true,3),x,y,new Image(Assets.MUONBULLET_REAL));
		}
		public function shootMissile():void
		{
			shoot(new TimedBullet(new Image(Assets.BULLET_GREY_REAL),direction,5,1,0,true,0,1,true),x,y,new Image(Assets.BULLET_GREY_REAL));
		}
		public function shoottwoBeam2():void
		{
			shoot(new Bullet(new Image(Assets.MUONBULLET_IMAG), 24,24,12,12,direction - 90, 5, 0.2, false, 2),x,y,new Image(Assets.MUONBULLET_IMAG));
			shoot(new Bullet(new Image(Assets.MUONBULLET_IMAG), 24,24,12,12,direction + 90, 5, 0.2, false, 2),x,y,new Image(Assets.MUONBULLET_IMAG));
		}
		public function shootFan2():void
		{
			shoot(new Bullet(new Image(Assets.MUONBULLET_IMAG), 24,24,12,12,direction, 5, 0.3, false, 2),x,y,new Image(Assets.MUONBULLET_IMAG));
			shoot(new Bullet(new Image(Assets.MUONBULLET_IMAG), 24,24,12,12,direction +45, 5, 0.3, false, 2),x,y,new Image(Assets.MUONBULLET_IMAG));
			shoot(new Bullet(new Image(Assets.MUONBULLET_IMAG), 24,24,12,12,direction +90, 5, 0.3, false, 2),x,y,new Image(Assets.MUONBULLET_IMAG));
			shoot(new Bullet(new Image(Assets.MUONBULLET_IMAG), 24,24,12,12,direction +135, 5, 0.3, false, 2),x,y,new Image(Assets.MUONBULLET_IMAG));
			shoot(new Bullet(new Image(Assets.MUONBULLET_IMAG), 24,24,12,12,direction +180, 5, 0.3, false, 2),x,y,new Image(Assets.MUONBULLET_IMAG));
			shoot(new Bullet(new Image(Assets.MUONBULLET_IMAG), 24,24,12,12,direction +225, 5, 0.3, false, 2),x,y,new Image(Assets.MUONBULLET_IMAG));
			shoot(new Bullet(new Image(Assets.MUONBULLET_IMAG), 24,24,12,12,direction +270, 5, 0.3, false, 2),x,y,new Image(Assets.MUONBULLET_IMAG));
			shoot(new Bullet(new Image(Assets.MUONBULLET_IMAG), 24,24,12,12,direction +315, 5, 0.3, false, 2),x,y,new Image(Assets.MUONBULLET_IMAG));
		}
		public function shootTwist():void
		{
			shoot(new Bullet(new Image(Assets.MUONBULLET_IMAG), 24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2) - 30, 5, 0.4, false, 2),x,y,new Image(Assets.MUONBULLET_IMAG));
			shoot(new Bullet(new Image(Assets.MUONBULLET_IMAG), 24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2) + 30, 5, -0.4, false, 2),x,y,new Image(Assets.MUONBULLET_IMAG));
		}
	}
}