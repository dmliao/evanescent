package DryErase.Enemies.Forest.Enemies.Boss
{
	import DryErase.Enemies.Boss;
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Forest.WaveControl.Master_F;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;

	public class FTau extends Boss
	{
		public static var enter:Boolean = false;
		public var sImag:Spritemap = new Spritemap(Assets.F_TAU_IMAG,313,240);
		public var sReal:Spritemap = new Spritemap(Assets.F_TAU_REAL, 313, 240);
		public var sShadow:Spritemap = new Spritemap(Assets.F_TAU_REAL, 313, 240);
		
		public var shootTimer:Number = 0;
		
		public static var defeated:Boolean = false;
		public var last:String = "intro";
		public function FTau()
		{
		 	sImag.add("normal",[2,1,0,1],8,true);
			sReal.add("normal",[2,1,0,1],8,true);
			sShadow.add("normal",[2,1,0,1],8,true);
			
			sImag.add("rush",[3],0,false);
			sReal.add("rush",[3],0,false);
			sShadow.add("rush",[3],0,false);
			
			sImag.add("2rush",[4],0,false);
			sReal.add("2rush",[4],0,false);
			sShadow.add("2rush",[4],0,false);
			
			super(sImag,sReal,sShadow,180,2500,270,100,100,50,50,1.5);
			x = 320;
			y= -400;
			sImag.play("normal");
			sReal.play("normal");
			sShadow.play("normal");
			enter = false;
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
		
		public var goStraight:Boolean = true;
		public var turnRight:Boolean = false;
		override public function idleState():void
		{
			super.idleState();
			x = 320;
			y = -400;
			FMuon.enter = true;
		//	if (enter == true)
			{
				var random:Number = Math.random();
				
				if (random < 0.3)
				{
					if (last != "alt1")
					{
					x = 0;
					y = -400;
					currentState = "alt1";
					goStraight = false;
					}
					else
					{
						random = Math.random();
					}
				}
				else if (random < 0.7)
				{
					turnRight = Boolean(Math.round(Math.random()));
					currentState = "alt2";
				}
				else
				{
					if (last != "alt3")
					{
						x = 320;
						y = -400;
						direction = 270;
						currentState = "alt3";
					}
					else
					{
						random = Math.random();
					}
				}
			}
			
		}
		override public function introState():void
		{
			currentState="idle";
		}
		override public function altState1():void
		{
			if (shootTimer > 0.5)
			{
				shootTimer = 0;
				shootTwist();
				if (FMuon.defeated == true)
				{
					shoottwoBeam2();
				}
			}
			
			last = "alt1";
			super.altState1();
			if (altTimer[0] > 4)
			{
				altTimer[0] = 0;
				goStraight = !goStraight;
			}
			if (goStraight)
			{
				sImag.play("normal");
				sReal.play("normal");
				sShadow.play("normal");
				moveDirection(75,4);
				direction = 75;
			}
			else
			{
				sImag.play("rush");
				sReal.play("rush");
				sShadow.play("rush");
				moveDirection(270,4.5);
				direction = 270;
			}
			if (x > 700)
			{
				currentState = "idle";
				if (FMuon.defeated == false)
				{
					FTau.enter = false;
				}
			}
		}
		override public function altState2():void
		{
			
			if (shootTimer > 0.5)
			{
				shootTimer = 0;
				shoottwoBeam();
				if (FMuon.defeated == true)
				{
					shootFan2();
				}
			}
			sImag.play("2rush");
			sReal.play("2rush");
			sShadow.play("2rush");
			last = "alt2";
			super.altState2();
			if (turnRight == true)
			{
				x = 440;
				y += 4;
				direction = 270;
			}
			else
			{
				x = 200;
				y += 4;
				direction = 270;
			}
			if (y > 750)
			{
				currentState = "idle";
				if (FMuon.defeated == false)
				{
					FTau.enter = false;
				}
			}
		}
		
		public var oscilRight:Boolean = false;
		override public function altState3():void
		{
			if (shootTimer > 0.5)
			{
				shootTimer = 0;
				shootFan();
				if (FMuon.defeated == true)
				{
					shootArc();
				}
			}
			last = "alt3";
			sImag.play("normal");
			sReal.play("normal");
			sShadow.play("normal");
			super.altState3();
			if (altTimer[2] > 1)
			{
				altTimer[2] = -1;
				oscilRight = !oscilRight;
			}
			if (oscilRight == true)
			{
				direction += 0.5 * Main.frameRate * FP.elapsed;
			}
			else
			{
				direction -= 0.5 * Main.frameRate * FP.elapsed;
			}
			moveDirection(direction,3);
			
			if (y > 750)
			{
				currentState = "idle";
				if (FMuon.defeated == false)
				{
					FTau.enter = false;
				}
			}
		}
		
		override public function removed():void
		{
			super.removed();
			if (FMuon.defeated == true)
			{
				Master_F.bossDead = true;
			}
		}
		
		public function shoottwoBeam():void
		{
			shoot(new Bullet(new Image(Assets.TAUBULLET_IMAG), 24,24,12,12,direction - 90, 5, 0.2, false, 2),x,y,new Image(Assets.TAUBULLET_IMAG));
			shoot(new Bullet(new Image(Assets.TAUBULLET_IMAG), 24,24,12,12,direction + 90, 5, 0.2, false, 2),x,y,new Image(Assets.TAUBULLET_IMAG));
		}
		public function shootFan():void
		{
			shoot(new Bullet(new Image(Assets.TAUBULLET_IMAG), 24,24,12,12,direction, 5, 0.3, false, 2),x,y,new Image(Assets.TAUBULLET_IMAG));
			shoot(new Bullet(new Image(Assets.TAUBULLET_IMAG), 24,24,12,12,direction +45, 5, 0.3, false, 2),x,y,new Image(Assets.TAUBULLET_IMAG));
			shoot(new Bullet(new Image(Assets.TAUBULLET_IMAG), 24,24,12,12,direction +90, 5, 0.3, false, 2),x,y,new Image(Assets.TAUBULLET_IMAG));
			shoot(new Bullet(new Image(Assets.TAUBULLET_IMAG), 24,24,12,12,direction +135, 5, 0.3, false, 2),x,y,new Image(Assets.TAUBULLET_IMAG));
			shoot(new Bullet(new Image(Assets.TAUBULLET_IMAG), 24,24,12,12,direction +180, 5, 0.3, false, 2),x,y,new Image(Assets.TAUBULLET_IMAG));
			shoot(new Bullet(new Image(Assets.TAUBULLET_IMAG), 24,24,12,12,direction +225, 5, 0.3, false, 2),x,y,new Image(Assets.TAUBULLET_IMAG));
			shoot(new Bullet(new Image(Assets.TAUBULLET_IMAG), 24,24,12,12,direction +270, 5, 0.3, false, 2),x,y,new Image(Assets.TAUBULLET_IMAG));
			shoot(new Bullet(new Image(Assets.TAUBULLET_IMAG), 24,24,12,12,direction +315, 5, 0.3, false, 2),x,y,new Image(Assets.TAUBULLET_IMAG));
		}
		public function shootTwist():void
		{
			shoot(new Bullet(new Image(Assets.TAUBULLET_IMAG), 24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2) - 30, 5, 0.4, false, 2),x,y,new Image(Assets.TAUBULLET_IMAG));
			shoot(new Bullet(new Image(Assets.TAUBULLET_IMAG), 24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2) + 30, 5, -0.4, false, 2),x,y,new Image(Assets.TAUBULLET_IMAG));
		}
		public function shootArc():void
		{
			shoot(new Bullet(new Image(Assets.TAUBULLET_REAL), 24,24,12,12,direction,5,0,true,3),x,y,new Image(Assets.TAUBULLET_REAL));
			shoot(new Bullet(new Image(Assets.TAUBULLET_REAL), 24,24,12,12,direction-16,5,0,true,3),x,y,new Image(Assets.TAUBULLET_REAL));
			shoot(new Bullet(new Image(Assets.TAUBULLET_REAL), 24,24,12,12,direction+16,5,0,true,3),x,y,new Image(Assets.TAUBULLET_REAL));
			shoot(new Bullet(new Image(Assets.TAUBULLET_REAL), 24,24,12,12,direction-32,5,0,true,3),x,y,new Image(Assets.TAUBULLET_REAL));
			shoot(new Bullet(new Image(Assets.TAUBULLET_REAL), 24,24,12,12,direction+32,5,0,true,3),x,y,new Image(Assets.TAUBULLET_REAL));
		}
		public function shoottwoBeam2():void
		{
			shoot(new Bullet(new Image(Assets.TAUBULLET_REAL), 24,24,12,12,direction-90,5,0,true,3),x,y,new Image(Assets.TAUBULLET_REAL));	
			shoot(new Bullet(new Image(Assets.TAUBULLET_REAL), 24,24,12,12,direction+90,5,0,true,3),x,y,new Image(Assets.TAUBULLET_REAL));
		}
		public function shootFan2():void
		{
			shoot(new Bullet(new Image(Assets.TAUBULLET_REAL), 24,24,12,12,direction,5,0,true,3),x,y,new Image(Assets.TAUBULLET_REAL));
			shoot(new Bullet(new Image(Assets.TAUBULLET_REAL), 24,24,12,12,direction+45,5,0,true,3),x,y,new Image(Assets.TAUBULLET_REAL));
			shoot(new Bullet(new Image(Assets.TAUBULLET_REAL), 24,24,12,12,direction+90,5,0,true,3),x,y,new Image(Assets.TAUBULLET_REAL));
			shoot(new Bullet(new Image(Assets.TAUBULLET_REAL), 24,24,12,12,direction+135,5,0,true,3),x,y,new Image(Assets.TAUBULLET_REAL));
			shoot(new Bullet(new Image(Assets.TAUBULLET_REAL), 24,24,12,12,direction+180,5,0,true,3),x,y,new Image(Assets.TAUBULLET_REAL));
			shoot(new Bullet(new Image(Assets.TAUBULLET_REAL), 24,24,12,12,direction+225,5,0,true,3),x,y,new Image(Assets.TAUBULLET_REAL));
			shoot(new Bullet(new Image(Assets.TAUBULLET_REAL), 24,24,12,12,direction+270,5,0,true,3),x,y,new Image(Assets.TAUBULLET_REAL));
			shoot(new Bullet(new Image(Assets.TAUBULLET_REAL), 24,24,12,12,direction+315,5,0,true,3),x,y,new Image(Assets.TAUBULLET_REAL));
		}
	}
}