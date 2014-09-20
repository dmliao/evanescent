package DryErase.Enemies.Void.Enemies.boss
{
	import DryErase.Enemies.Boss;
	import DryErase.Enemies.Bullets.AniBullet;
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Hero.Listener;
	
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class VBurst extends Boss
	{
		public var mode:Number = -2;
		public var bulb:Image = new Image(Assets.V_BULB); 
		public var bulb2:Image = new Image(Assets.V_BULB); 
		public var modeTimer:Number = 0;
		public var flashSwitch:Boolean = true;
		
		public var lungSprite:Image = new Image(Assets.lungReal, new Rectangle(0,0,556, 750));
		public var gueySprite:Image = new Image(Assets.V_GUEYFADE);
		public var muonSprite:Image = new Image(Assets.F_MUON_REAL, new Rectangle(0,0,450, 225));
		public var tauSprite:Image = new Image(Assets.F_TAU_REAL, new Rectangle(0,0,313,240));
		public var heroSprite:Image = new Image(Assets.C_HERO_REAL, new Rectangle(0,0,500,595));
		
		public var shootTimer:Number = 0;
		
		public static var sparkLung:Boolean = false;
		public static var sparkGuey:Boolean = false;
		public static var sparkMuon:Boolean = false;
		public static var sparkTau:Boolean = false;
		public static var sparkHero:Boolean = false;
		public function VBurst(xx:Number = 320, yy:Number = 0)
		{
			super(bulb, bulb2, new Image(Assets.V_BULB), -100, 0, 0, 0, 0, 0, 0, 1);
			x = xx;
			y=yy;
			
			lungSprite.angle = 270;
			lungSprite.alpha = 0;
			lungSprite.centerOO();
			
			gueySprite.alpha = 0;
			gueySprite.centerOO();
			
			muonSprite.angle = 270;
			muonSprite.alpha = 0;
			muonSprite.centerOO();
			
			tauSprite.angle = 270;
			tauSprite.alpha = 0;
			tauSprite.centerOO();
			
			heroSprite.alpha = 0;
			heroSprite.centerOO();
			bulb.angle += 0.3;
			bulb2.angle += 0.3;
			
		}
		override public function update():void
		{
			
			
			if (y > 500)
			{
				FP.world.remove(this);
			}
			else
			{
				currentDir += 0.5;
				super.update();
				
				direction += 1;
				bulb.angle = direction;
				bulb2.angle = direction;
				
				shootTimer += FP.elapsed;
				
				if (lungSprite.alpha > 0)
				{
					lungSprite.alpha -=0.005;
				}
				if (gueySprite.alpha > 0)
				{
					gueySprite.alpha -=0.005;
					gueySprite.angle -= 0.5;
				}
				if (muonSprite.alpha > 0)
				{
					muonSprite.alpha -=0.005;
				}
				if (tauSprite.alpha > 0)
				{
					tauSprite.alpha -=0.005;
				}
				if (heroSprite.alpha > 0)
				{
					heroSprite.alpha -=0.005;
				}
				
				if (sparkMuon)
				{
					sparkMuon = false;
					muonSprite.alpha = 0.5;
				}
				if (sparkTau)
				{
					sparkTau = false;
					tauSprite.alpha = 0.5;
				}
				if (sparkLung)
				{
					sparkLung = false;
					lungSprite.alpha = 0.5;
				}
				if (sparkGuey)
				{
					sparkGuey = false;
					gueySprite.alpha = 0.5;
					gueySprite.angle = 90;
				}
				if (sparkHero)
				{
					sparkHero = false;
					heroSprite.alpha = 0.5;
				}
				modeTimer += FP.elapsed;
				if (mode == 0)
				{
					flashSwitch = true;
				}
			if (y < 240 || modeTimer > 80)
			{
				y += 2;
			}
			if (modeTimer < 2)
			{
				mode = 0;
			}
			else if (modeTimer < 16)
			{
				mode = 1;
			}
			else if (modeTimer < 18)
			{
				mode = 0;
			}
			else if (modeTimer < 32)
			{
				mode = 2;
			}
			else if (modeTimer < 34)
			{
				mode = 0;
			}
			else if (modeTimer < 48)
			{
				mode = 3;
			}
			else if (modeTimer < 50)
			{
				mode = 0;
			}
			else if (modeTimer < 64)
			{
				mode = 4;
			}
			else if (modeTimer < 66)
			{
				mode = 0;
			}
			else if (modeTimer < 80)
			{
				mode = 5;
			}
			else if (modeTimer > 80)
			{
				bulb.alpha -=0.05;
			}
			
			switch (mode)
			{
				case 0: //NONE
				{
					bulb.color = 0x000000;
					bulb2.color = 0x000000;
				}break;
				case 1: ///MUON
				{
					bulb.color = 0x0066ff;
					bulb2.color = 0x0066ff;
					if (flashSwitch == true)
					{
						flashSwitch = false;
						sparkMuon = true;
					}
					if (shootTimer > 0.4)
					{
						shootTimer = 0;
						muonShoot();
					}
				}break;
				case 2: ///TAU
				{
					bulb.color = 0x880000;
					bulb2.color = 0x880000;
					if (flashSwitch == true)
					{
						flashSwitch = false;
						sparkTau = true;
					}
					if (shootTimer > 0.4)
					{
						shootTimer = 0;
						tauShoot();
					}
				}break;
				case 3: ///LUNG
				{
					bulb.color = 0xff8400;
					bulb2.color = 0xff8400;
					if (flashSwitch == true)
					{
						flashSwitch = false;
						sparkLung = true;
					}
					if (shootTimer > 0.3)
					{
						shootTimer = 0;
						lungShoot();
					}
				}break;
				case 4: ///GUEY
				{
					bulb.color = 0x009d0f;
					bulb2.color = 0x009d0f;
					if (flashSwitch == true)
					{
						flashSwitch = false;
						sparkGuey = true;
					}
					if (shootTimer > 0.4)
					{
						var random:Boolean = Boolean(Math.round(Math.random()));
						if (random == false)
						{
							gueyShootImag();
						}
						else
						{
							gueyShootReal();
						}
						shootTimer = 0;
						
					}
				}break;
				case 5: ///HERO
				{
					bulb.color = 0x777777;
					bulb2.color = 0x777777;
					if (flashSwitch == true)
					{
						flashSwitch = false;
						sparkHero = true;
					}
					
					if (shootTimer > 0.2)
					{
						shootTimer = 0;
						heroShoot();
					}
				}break;
			}
			}
		}
		
		override public function render():void
		{
			
			super.render();
			lungSprite.render(FP.buffer, new Point(320,240), FP.camera);
			gueySprite.render(FP.buffer, new Point(320,240), FP.camera);
			muonSprite.render(FP.buffer, new Point(320,240), FP.camera);
			tauSprite.render(FP.buffer, new Point(320,240), FP.camera);
			heroSprite.render(FP.buffer, new Point(320,240), FP.camera);
		}
		public function heroShoot():void
		{
			if (Listener.currentField == false)
			{
				shoot(new Bullet(new Image(Assets.HEROBULLET2_IMAG),24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2),8,0,false,0,1,true),x,y,new Image(Assets.HEROBULLET2_IMAG));
				
			}
			else
			{
				shoot(new Bullet(new Image(Assets.HEROBULLET2_REAL),24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2),8,0,true,0,1,true),x,y,new Image(Assets.HEROBULLET2_REAL));
				
			}
		}
		public var currentDir:Number = 0;
		public function lungShoot():void
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
		}
		
		public function gueyShootImag():void
		{
			shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,210,5,0,true,0,1,true),x,y,new Image(Assets.GUEYBULLET1_REAL));
			shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,230,5,0,true,0,1,true),x,y,new Image(Assets.GUEYBULLET1_REAL));
			shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,250,5,0,true,0,1,true),x,y,new Image(Assets.GUEYBULLET1_REAL));
			shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,270,5,0,true,0,1,true),x,y,new Image(Assets.GUEYBULLET1_REAL));
			shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,290,5,0,true,0,1,true),x,y,new Image(Assets.GUEYBULLET1_REAL));
			shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,310,5,0,true,0,1,true),x,y,new Image(Assets.GUEYBULLET1_REAL));
			shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,330,5,0,true,0,1,true),x,y,new Image(Assets.GUEYBULLET1_REAL));
			
			shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,210,5,0,false,0,1,true),x,y,new Image(Assets.GUEYBULLET1_IMAG));
			shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,240,5,0,false,0,1,true),x,y,new Image(Assets.GUEYBULLET1_IMAG));
			shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,270,5,0,false,0,1,true),x,y,new Image(Assets.GUEYBULLET1_IMAG));
			shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,300,5,0,false,0,1,true),x,y,new Image(Assets.GUEYBULLET1_IMAG));
			shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,330,5,0,false,0,1,true),x,y,new Image(Assets.GUEYBULLET1_IMAG));
		}
		public function gueyShootReal():void
		{
			shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,210,5,0,false,0,1,true),x,y,new Image(Assets.GUEYBULLET1_IMAG));
			shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,230,5,0,false,0,1,true),x,y,new Image(Assets.GUEYBULLET1_IMAG));
			shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,250,5,0,false,0,1,true),x,y,new Image(Assets.GUEYBULLET1_IMAG));
			shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,270,5,0,false,0,1,true),x,y,new Image(Assets.GUEYBULLET1_IMAG));
			shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,290,5,0,false,0,1,true),x,y,new Image(Assets.GUEYBULLET1_IMAG));
			shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,310,5,0,false,0,1,true),x,y,new Image(Assets.GUEYBULLET1_IMAG));
			shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,330,5,0,false,0,1,true),x,y,new Image(Assets.GUEYBULLET1_IMAG));
			
			shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,210,5,0,true,0,1,true),x,y,new Image(Assets.GUEYBULLET1_REAL));
			shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,240,5,0,true,0,1,true),x,y,new Image(Assets.GUEYBULLET1_REAL));
			shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,270,5,0,true,0,1,true),x,y,new Image(Assets.GUEYBULLET1_REAL));
			shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,300,5,0,true,0,1,true),x,y,new Image(Assets.GUEYBULLET1_REAL));
			shoot(new Bullet(new Image(Assets.GUEYBULLET1_IMAG),24,24,12,12,330,5,0,true,0,1,true),x,y,new Image(Assets.GUEYBULLET1_REAL));
		}
		public function muonShoot():void
		{
			shoot(new Bullet(new Image(Assets.MUONBULLET_REAL), 24,24,12,12,direction,5,0,true,3),x,y,new Image(Assets.MUONBULLET_REAL));
			shoot(new Bullet(new Image(Assets.MUONBULLET_REAL), 24,24,12,12,direction+45,5,0,true,3),x,y,new Image(Assets.MUONBULLET_REAL));
			shoot(new Bullet(new Image(Assets.MUONBULLET_REAL), 24,24,12,12,direction+90,5,0,true,3),x,y,new Image(Assets.MUONBULLET_REAL));
			shoot(new Bullet(new Image(Assets.MUONBULLET_REAL), 24,24,12,12,direction+135,5,0,true,3),x,y,new Image(Assets.MUONBULLET_REAL));
			shoot(new Bullet(new Image(Assets.MUONBULLET_REAL), 24,24,12,12,direction+180,5,0,true,3),x,y,new Image(Assets.MUONBULLET_REAL));
			shoot(new Bullet(new Image(Assets.MUONBULLET_REAL), 24,24,12,12,direction+225,5,0,true,3),x,y,new Image(Assets.MUONBULLET_REAL));
			shoot(new Bullet(new Image(Assets.MUONBULLET_REAL), 24,24,12,12,direction+270,5,0,true,3),x,y,new Image(Assets.MUONBULLET_REAL));
			shoot(new Bullet(new Image(Assets.MUONBULLET_REAL), 24,24,12,12,direction+315,5,0,true,3),x,y,new Image(Assets.MUONBULLET_REAL));
			
			shoot(new Bullet(new Image(Assets.MUONBULLET_IMAG), 24,24,12,12,direction - 90, 5, 0.2, false, 2),x,y,new Image(Assets.MUONBULLET_IMAG));
			shoot(new Bullet(new Image(Assets.MUONBULLET_IMAG), 24,24,12,12,direction + 90, 5, 0.2, false, 2),x,y,new Image(Assets.MUONBULLET_IMAG));
		}
		public function tauShoot():void
		{
			shoot(new Bullet(new Image(Assets.TAUBULLET_IMAG), 24,24,12,12,direction, 5, 0.3, false, 2),x,y,new Image(Assets.TAUBULLET_IMAG));
			shoot(new Bullet(new Image(Assets.TAUBULLET_IMAG), 24,24,12,12,direction +45, 5, 0.3, false, 2),x,y,new Image(Assets.TAUBULLET_IMAG));
			shoot(new Bullet(new Image(Assets.TAUBULLET_IMAG), 24,24,12,12,direction +90, 5, 0.3, false, 2),x,y,new Image(Assets.TAUBULLET_IMAG));
			shoot(new Bullet(new Image(Assets.TAUBULLET_IMAG), 24,24,12,12,direction +135, 5, 0.3, false, 2),x,y,new Image(Assets.TAUBULLET_IMAG));
			shoot(new Bullet(new Image(Assets.TAUBULLET_IMAG), 24,24,12,12,direction +180, 5, 0.3, false, 2),x,y,new Image(Assets.TAUBULLET_IMAG));
			shoot(new Bullet(new Image(Assets.TAUBULLET_IMAG), 24,24,12,12,direction +225, 5, 0.3, false, 2),x,y,new Image(Assets.TAUBULLET_IMAG));
			shoot(new Bullet(new Image(Assets.TAUBULLET_IMAG), 24,24,12,12,direction +270, 5, 0.3, false, 2),x,y,new Image(Assets.TAUBULLET_IMAG));
			shoot(new Bullet(new Image(Assets.TAUBULLET_IMAG), 24,24,12,12,direction +315, 5, 0.3, false, 2),x,y,new Image(Assets.TAUBULLET_IMAG));
			
			shoot(new Bullet(new Image(Assets.TAUBULLET_REAL), 24,24,12,12,direction,5,0,true,3),x,y,new Image(Assets.TAUBULLET_REAL));
			shoot(new Bullet(new Image(Assets.TAUBULLET_REAL), 24,24,12,12,direction-16,5,0,true,3),x,y,new Image(Assets.TAUBULLET_REAL));
			shoot(new Bullet(new Image(Assets.TAUBULLET_REAL), 24,24,12,12,direction+16,5,0,true,3),x,y,new Image(Assets.TAUBULLET_REAL));
			shoot(new Bullet(new Image(Assets.TAUBULLET_REAL), 24,24,12,12,direction-32,5,0,true,3),x,y,new Image(Assets.TAUBULLET_REAL));
			shoot(new Bullet(new Image(Assets.TAUBULLET_REAL), 24,24,12,12,direction+32,5,0,true,3),x,y,new Image(Assets.TAUBULLET_REAL));
		}
	}
}