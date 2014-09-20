package DryErase.Enemies.Castle.Boss
{
	import DryErase.Enemies.Boss;
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Castle.Boss.CLance;
	import DryErase.Enemies.Castle.WaveControl.Master_C;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;

	public class CHero_Horseback extends Boss
	{
		public var shieldUp:Boolean = false;
		public var shieldInv:Boolean = false;
		
		public var chargeRight:Boolean = false;
		public var chargeTimer:Number = 0;
		
		public var imagSprite:Spritemap = new Spritemap(Assets.C_HERO_IMAG, 500, 595);
		public var realSprite:Spritemap = new Spritemap(Assets.C_HERO_REAL, 500,595);
		public var shadowSprite:Spritemap = new Spritemap(Assets.C_HERO_IMAG, 500,595);
		public var rotCounts:Number = 3;
		public function CHero_Horseback()
		{
			super(imagSprite, realSprite, shadowSprite, 500, 3000, 270, 200,150,100,75,1.5);
			direction = 270;
			fixDirection = true;
			currentImage.angle = 0;
			
			x = 320;
			y = -200;
			
			imagSprite.add("shield",[4],0,false);
			imagSprite.add("sword",[3],0,false);
			imagSprite.play("sword");
			realSprite.add("shield",[4],0,false);
			realSprite.add("sword",[3],0,false);
			realSprite.play("sword");
		}
		override public function update():void
		{
			super.update();
			if (shieldUp && shieldInv)
			{
				invincible = 0.5;
			}
			if (shieldUp)
			{
				imagSprite.play("shield");
				realSprite.play("shield");
			}
			else
			{
				imagSprite.play("sword");
				realSprite.play("sword");
			}
			if (deathTrigger)
			{
				FP.world.remove(this);
				Master_C.bossDead = true;
			}
		}
		override public function introState():void
		{
			invincible = 0.8;
			if (y < 96)
			{
				y += 4;
			}
			else
			{
				currentState = "idle";
			}
		}
		override public function idleState():void
		{
			super.idleState();
			shieldInv = false;
			if (idleTimer > 15)
			{
				if (x < 320-8 || x > 320 + 8 || y < 96 - 8 || y > 96 + 8)
				{
					direction = 270;
					moveDirection(pointDirection(x,y,320,96),3);
				
				
				}
				else
				{
					idleTimer = 0;
					rotCounts += 1;
					if (rotCounts >= 4)
					{
						rotCounts = 0;
					}
					switch (rotCounts)
					{
						case 0:
						{
							basicTime = 0;
							shieldUp = true;
							currentState = "basic";
						}break;
						case 1:
						{
							alt1Time = 0;
							shieldUp = false;
							currentState = "alt1";
						}break;
						case 2:
						{
							alt2Time = 0;
							shieldUp = false;
							currentState = "alt2";
						}break;
						case 3:
						{
							alt3Time = 0;
							shieldUp = true;
							currentState = "alt3";
						}break;
					}
				}
			}
			else
			{
				if (y > 520)
				{
					y = -40;
					x = 100 + Math.random()*440;
					if (x < 320)
					{
						FP.world.add(new CLance(400,Listener.currentField,true));
					}
					else
					{
						FP.world.add(new CLance(240,Listener.currentField,true));
					}
				}
				else if (y < -40)
				{
					y= 520;
				}
				y += 4;
				chargeTimer += FP.elapsed;
				if (chargeTimer > 1)
				{
					chargeRight = !chargeRight;
					chargeTimer = 0;
				}
				if (chargeRight)
				{
					x += 1;
				}
				else
				{
					x -= 1;
				}
			}
			
		}
		//SHIELD ATTACKS
		public var basicTime:Number = 0;
		override public function basicState():void
		{
			basicTime += FP.elapsed;
			if (basicTime > 8)
			{
				currentState = "idle";
				idleTimer = 0;
			}
			shieldInv = true;
			super.basicState();
			if (basicTimer > 0.8)
			{
				if (Listener.currentField == false)
				{
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2),5,0,false,0,1,true),x,y,new Image(Assets.HEROBULLET1_IMAG));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2)+25,5,0,false,0,1,true),x,y,new Image(Assets.HEROBULLET1_IMAG));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2)-25,5,0,false,0,1,true),x,y,new Image(Assets.HEROBULLET1_IMAG));
				}
				else
				{
					shoot(new Bullet(new Image(Assets.HEROBULLET1_REAL),24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2),5,0,false,0,1,true),x,y,new Image(Assets.HEROBULLET1_REAL));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_REAL),24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2)+25,5,0,false,0,1,true),x,y,new Image(Assets.HEROBULLET1_REAL));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_REAL),24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2)-25,5,0,false,0,1,true),x,y,new Image(Assets.HEROBULLET1_REAL));
				}
				basicTimer = 0;
				var wall:Boolean = Boolean(Math.round(Math.random()));
				if (wall == false)
				{
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,false,0,1,true),0,2,new Image(Assets.HEROBULLET1_IMAG));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,false,0,1,true),32,2,new Image(Assets.HEROBULLET1_IMAG));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,false,0,1,true),64,2,new Image(Assets.HEROBULLET1_IMAG));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,false,0,1,true),96,2,new Image(Assets.HEROBULLET1_IMAG));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,false,0,1,true),128,2,new Image(Assets.HEROBULLET1_IMAG));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,false,0,1,true),160,2,new Image(Assets.HEROBULLET1_IMAG));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,false,0,1,true),192,2,new Image(Assets.HEROBULLET1_IMAG));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,false,0,1,true),224,2,new Image(Assets.HEROBULLET1_IMAG));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,false,0,1,true),256,2,new Image(Assets.HEROBULLET1_IMAG));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,false,0,1,true),288,2,new Image(Assets.HEROBULLET1_IMAG));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,false,0,1,true),320,2,new Image(Assets.HEROBULLET1_IMAG));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,false,0,1,true),352,2,new Image(Assets.HEROBULLET1_IMAG));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,false,0,1,true),384,2,new Image(Assets.HEROBULLET1_IMAG));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,false,0,1,true),416,2,new Image(Assets.HEROBULLET1_IMAG));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,false,0,1,true),448,2,new Image(Assets.HEROBULLET1_IMAG));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,false,0,1,true),480,2,new Image(Assets.HEROBULLET1_IMAG));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,false,0,1,true),512,2,new Image(Assets.HEROBULLET1_IMAG));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,false,0,1,true),544,2,new Image(Assets.HEROBULLET1_IMAG));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,false,0,1,true),576,2,new Image(Assets.HEROBULLET1_IMAG));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,false,0,1,true),608,2,new Image(Assets.HEROBULLET1_IMAG));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,false,0,1,true),640,2,new Image(Assets.HEROBULLET1_IMAG));
				}
				else
				{
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,true,0,1,true),0,2,new Image(Assets.HEROBULLET1_REAL));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,true,0,1,true),32,2,new Image(Assets.HEROBULLET1_REAL));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,true,0,1,true),64,2,new Image(Assets.HEROBULLET1_REAL));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,true,0,1,true),96,2,new Image(Assets.HEROBULLET1_REAL));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,true,0,1,true),128,2,new Image(Assets.HEROBULLET1_REAL));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,true,0,1,true),160,2,new Image(Assets.HEROBULLET1_REAL));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,true,0,1,true),192,2,new Image(Assets.HEROBULLET1_REAL));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,true,0,1,true),224,2,new Image(Assets.HEROBULLET1_REAL));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,true,0,1,true),256,2,new Image(Assets.HEROBULLET1_REAL));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,true,0,1,true),288,2,new Image(Assets.HEROBULLET1_REAL));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,true,0,1,true),320,2,new Image(Assets.HEROBULLET1_REAL));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,true,0,1,true),352,2,new Image(Assets.HEROBULLET1_REAL));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,true,0,1,true),384,2,new Image(Assets.HEROBULLET1_REAL));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,true,0,1,true),416,2,new Image(Assets.HEROBULLET1_REAL));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,true,0,1,true),448,2,new Image(Assets.HEROBULLET1_REAL));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,true,0,1,true),480,2,new Image(Assets.HEROBULLET1_REAL));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,true,0,1,true),512,2,new Image(Assets.HEROBULLET1_REAL));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,true,0,1,true),544,2,new Image(Assets.HEROBULLET1_REAL));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,true,0,1,true),576,2,new Image(Assets.HEROBULLET1_REAL));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,true,0,1,true),608,2,new Image(Assets.HEROBULLET1_REAL));
					shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,270,5,0,true,0,1,true),640,2,new Image(Assets.HEROBULLET1_REAL));
				}
			}
		}
		public var alt3Time:Number = 0;
		override public function altState3():void
		{
			if (chargeRight == true)
			{
				x += 1;
			}
			else
			{
				x -= 1;
			}
			if (x > 540)
			{
				chargeRight = false;
			}
			else if (x < 100)
			{
				chargeRight = true;
			}
			alt3Time += FP.elapsed;
			if (alt3Time > 5)
			{
				currentState = "idle";
				idleTimer = 0;
			}
			shieldInv = true;
			super.altState3();
			if (altTimer[2] > 0.4)
			{
				altTimer[2] = 0;
				shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,180+Math.random()*180,5,0,Boolean(Math.round(Math.random())),0,1,true),x,y,new Image(Assets.HEROBULLET1_REAL));
				shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,180+Math.random()*180,5,0,Boolean(Math.round(Math.random())),0,1,true),x,y,new Image(Assets.HEROBULLET1_REAL));
				shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,180+Math.random()*180,5,0,Boolean(Math.round(Math.random())),0,1,true),x,y,new Image(Assets.HEROBULLET1_REAL));
				shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,180+Math.random()*180,5,0,Boolean(Math.round(Math.random())),0,1,true),x,y,new Image(Assets.HEROBULLET1_REAL));
				shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,180+Math.random()*180,5,0,Boolean(Math.round(Math.random())),0,1,true),x,y,new Image(Assets.HEROBULLET1_REAL));
				shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,180+Math.random()*180,5,0,Boolean(Math.round(Math.random())),0,1,true),x,y,new Image(Assets.HEROBULLET1_REAL));
				shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,180+Math.random()*180,5,0,Boolean(Math.round(Math.random())),0,1,true),x,y,new Image(Assets.HEROBULLET1_REAL));
				shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,180+Math.random()*180,5,0,Boolean(Math.round(Math.random())),0,1,true),x,y,new Image(Assets.HEROBULLET1_REAL));
				shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,180+Math.random()*180,5,0,Boolean(Math.round(Math.random())),0,1,true),x,y,new Image(Assets.HEROBULLET1_REAL));
				shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,180+Math.random()*180,5,0,Boolean(Math.round(Math.random())),0,1,true),x,y,new Image(Assets.HEROBULLET1_REAL));
				shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,180+Math.random()*180,5,0,Boolean(Math.round(Math.random())),0,1,true),x,y,new Image(Assets.HEROBULLET1_REAL));
				shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,180+Math.random()*180,5,0,Boolean(Math.round(Math.random())),0,1,true),x,y,new Image(Assets.HEROBULLET1_REAL));
				shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,180+Math.random()*180,5,0,Boolean(Math.round(Math.random())),0,1,true),x,y,new Image(Assets.HEROBULLET1_REAL));
				shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,180+Math.random()*180,5,0,Boolean(Math.round(Math.random())),0,1,true),x,y,new Image(Assets.HEROBULLET1_REAL));
				shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,180+Math.random()*180,5,0,Boolean(Math.round(Math.random())),0,1,true),x,y,new Image(Assets.HEROBULLET1_REAL));
				shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,180+Math.random()*180,5,0,Boolean(Math.round(Math.random())),0,1,true),x,y,new Image(Assets.HEROBULLET1_REAL));
				shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,180+Math.random()*180,5,0,Boolean(Math.round(Math.random())),0,1,true),x,y,new Image(Assets.HEROBULLET1_REAL));
				shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,180+Math.random()*180,5,0,Boolean(Math.round(Math.random())),0,1,true),x,y,new Image(Assets.HEROBULLET1_REAL));
				shoot(new Bullet(new Image(Assets.HEROBULLET1_IMAG),24,24,12,12,180+Math.random()*180,5,0,Boolean(Math.round(Math.random())),0,1,true),x,y,new Image(Assets.HEROBULLET1_REAL));
			}
			
		}
		
		//SPEAR ATTACKS
		public var pattern:Number = 0;
		public var alt1Time:Number = 0;
		override public function altState1():void
		{
			if (chargeRight == true)
			{
				x += 1;
			}
			else
			{
				x -= 1;
			}
			if (x > 540)
			{
				chargeRight = false;
			}
			else if (x < 100)
			{
				chargeRight = true;
			}
			alt1Time += FP.elapsed;
			if (alt1Time > 16)
			{
				currentState = "idle";
				idleTimer = 0;
			}
			super.altState1();
			if (altTimer[0] > 0.16)
			{
				altTimer[0] = 0;
				pattern += 1;
				if (int(pattern / 4) % 2 == 0)
				{
					if (Listener.currentField == false)
					{
						shoot(new Bullet(new Image(Assets.HEROBULLET2_IMAG),24,24,12,12,210,7,0,false,0,1,true),x,y,new Image(Assets.HEROBULLET2_IMAG));
						shoot(new Bullet(new Image(Assets.HEROBULLET2_IMAG),24,24,12,12,240,7,0,false,0,1,true),x,y,new Image(Assets.HEROBULLET2_IMAG));
						shoot(new Bullet(new Image(Assets.HEROBULLET2_IMAG),24,24,12,12,270,7,0,false,0,1,true),x,y,new Image(Assets.HEROBULLET2_IMAG));
						shoot(new Bullet(new Image(Assets.HEROBULLET2_IMAG),24,24,12,12,300,7,0,false,0,1,true),x,y,new Image(Assets.HEROBULLET2_IMAG));
						shoot(new Bullet(new Image(Assets.HEROBULLET2_IMAG),24,24,12,12,330,7,0,false,0,1,true),x,y,new Image(Assets.HEROBULLET2_IMAG));
					}
					else
					{
						shoot(new Bullet(new Image(Assets.HEROBULLET2_REAL),24,24,12,12,210,7,0,true,0,1,true),x,y,new Image(Assets.HEROBULLET2_REAL));
						shoot(new Bullet(new Image(Assets.HEROBULLET2_REAL),24,24,12,12,240,7,0,true,0,1,true),x,y,new Image(Assets.HEROBULLET2_REAL));
						shoot(new Bullet(new Image(Assets.HEROBULLET2_REAL),24,24,12,12,270,7,0,true,0,1,true),x,y,new Image(Assets.HEROBULLET2_REAL));
						shoot(new Bullet(new Image(Assets.HEROBULLET2_REAL),24,24,12,12,300,7,0,true,0,1,true),x,y,new Image(Assets.HEROBULLET2_REAL));
						shoot(new Bullet(new Image(Assets.HEROBULLET2_REAL),24,24,12,12,330,7,0,true,0,1,true),x,y,new Image(Assets.HEROBULLET2_REAL));
					}
				}
				else
				{
					if (Listener.currentField == false)
					{
						shoot(new Bullet(new Image(Assets.HEROBULLET2_IMAG),24,24,12,12,195,7,0,false,0,1,true),x,y,new Image(Assets.HEROBULLET2_IMAG));
						shoot(new Bullet(new Image(Assets.HEROBULLET2_IMAG),24,24,12,12,225,7,0,false,0,1,true),x,y,new Image(Assets.HEROBULLET2_IMAG));
						shoot(new Bullet(new Image(Assets.HEROBULLET2_IMAG),24,24,12,12,255,7,0,false,0,1,true),x,y,new Image(Assets.HEROBULLET2_IMAG));
						shoot(new Bullet(new Image(Assets.HEROBULLET2_IMAG),24,24,12,12,285,7,0,false,0,1,true),x,y,new Image(Assets.HEROBULLET2_IMAG));
						shoot(new Bullet(new Image(Assets.HEROBULLET2_IMAG),24,24,12,12,315,7,0,false,0,1,true),x,y,new Image(Assets.HEROBULLET2_IMAG));
						shoot(new Bullet(new Image(Assets.HEROBULLET2_IMAG),24,24,12,12,345,7,0,false,0,1,true),x,y,new Image(Assets.HEROBULLET2_IMAG));
					}
					else
					{
						shoot(new Bullet(new Image(Assets.HEROBULLET2_REAL),24,24,12,12,195,7,0,true,0,1,true),x,y,new Image(Assets.HEROBULLET2_REAL));
						shoot(new Bullet(new Image(Assets.HEROBULLET2_REAL),24,24,12,12,225,7,0,true,0,1,true),x,y,new Image(Assets.HEROBULLET2_REAL));
						shoot(new Bullet(new Image(Assets.HEROBULLET2_REAL),24,24,12,12,255,7,0,true,0,1,true),x,y,new Image(Assets.HEROBULLET2_REAL));
						shoot(new Bullet(new Image(Assets.HEROBULLET2_REAL),24,24,12,12,285,7,0,true,0,1,true),x,y,new Image(Assets.HEROBULLET2_REAL));
						shoot(new Bullet(new Image(Assets.HEROBULLET2_REAL),24,24,12,12,315,7,0,true,0,1,true),x,y,new Image(Assets.HEROBULLET2_REAL));
						shoot(new Bullet(new Image(Assets.HEROBULLET2_REAL),24,24,12,12,345,7,0,true,0,1,true),x,y,new Image(Assets.HEROBULLET2_REAL));
					}
				}
			}
		}		
		public var alt2Time:Number = 0;
		override public function altState2():void
		{
			chargeTimer += FP.elapsed;
			if (y > 600)
			{
				y = -40;
				x = 100 + Math.random()*440;
			}
			else if (y < -40)
			{
				y= 520;
			}
			y += 3;
			chargeTimer += FP.elapsed;
			if (chargeTimer > 1)
			{
				chargeRight = !chargeRight;
				chargeTimer = 0;
			}
			if (chargeRight)
			{
				x += 1;
			}
			else
			{
				x -= 1;
			}
			alt2Time += FP.elapsed;
			if (alt2Time > 14)
			{
				currentState = "idle";
				idleTimer = 0;
			}
			super.altState2();
			if (altTimer[1] > 0.1)
			{
				if (Listener.currentField == false)
				{
					shoot(new Bullet(new Image(Assets.HEROBULLET2_IMAG),24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2),8,0,false,0,1,true),x,y,new Image(Assets.HEROBULLET2_IMAG));
					
				}
				else
				{
					shoot(new Bullet(new Image(Assets.HEROBULLET2_REAL),24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2),8,0,true,0,1,true),x,y,new Image(Assets.HEROBULLET2_REAL));
					
				}
				altTimer[1] = 0;
			}
		}
	}
}