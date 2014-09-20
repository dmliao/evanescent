package DryErase.Enemies.Void.Enemies.boss
{
	import DryErase.Enemies.Boss;
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Void.WaveControl.Master_V;
	import DryErase.Hero.Listener;
	
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;

	public class VStoryteller extends Boss
	{
		public var imagSprite:Spritemap = new Spritemap(Assets.V_STORYTELLER_IMAG,117,147);
		public var realSprite:Spritemap = new Spritemap(Assets.V_STORYTELLER_REAL,117,147);
		public var shadowSprite:Image = new Image(Assets.V_STORYTELLER_IMAG);
		
		
		//0 is floral patterns
		//1 is knives
		//2 is shooting boss stuff
		//3 is idle
		public var phase:Number = 0;
		public var phaseTimer:Number = 0;
		public var counter:Number = 0;
		public var lastPhase:Number = 0;
		
		public var deviantDir:Number = 0;
		public var deviantOut:Boolean = true;
		
		public var shootTimer:Number = 0;
		
		public function VStoryteller()
		{
			imagSprite.add("default",[0],0,false);
			imagSprite.add("turn",[0,1,2,3],6,false);
			imagSprite.add("turnBack",[3,2,1,0],6,false);
			
			realSprite.add("default",[0],0,false);
			realSprite.add("turn",[0,1,2,3],6,false);
			realSprite.add("turnBack",[3,2,1,0],6,false);
			
			//HP should be 1400
			super(imagSprite,realSprite,shadowSprite,1400, 8000, 0, 96, 64, 48, 32, 1);
			drawShadow = false;
			
			imagSprite.play("default");
			realSprite.play("default");
			x = 320;
			
		}
		override public function update():void
		{
			super.update();
			if (this.deathTrigger == true)
			{
				Listener.inCutscene = true;
				Master_V.bossDead = true;
			}
			y = VTree.Y + VTree.waverY+48;
			if (VTree.Y >= 96)
			{
			phaseTimer += FP.elapsed;
			shootTimer += FP.elapsed;
			if (phase == 0)
			{
				if (phaseTimer < 20)
				{
					if (deviantOut == false)
					{
						deviantDir -=0.5;
					}
					else
					{
						deviantDir += 0.5;
					}
					if (deviantDir <= -45)
					{
						deviantOut = true;
					}
					else if (deviantDir >=45)
					{
						deviantOut = false;
					}
					if (shootTimer >= 0.3)
					{
						shootTimer = 0;
						shootFocus(240,200,Boolean(Math.round(Math.random())),270+deviantDir);
						shootFocus(400,200,Boolean(Math.round(Math.random())),270-deviantDir);
						shootFocus(240,200,Boolean(Math.round(Math.random())),90-deviantDir);
						shootFocus(400,200,Boolean(Math.round(Math.random())),90+deviantDir);
					}
				}
				else
				{
					counter = 0;
					phaseTimer = 0;
					lastPhase = 0;
					phase = 3;
				}
			}
			else if (phase == 1)
			{
				if (phaseTimer > 2 && counter == 0)
				{
					counter = 1;
					FP.world.add(new VKnife(Math.random()*320, false, true));
					FP.world.add(new VKnife(640-Math.random()*320, false, false));
					
				}
				if (phaseTimer > 5 && counter == 1)
				{
					counter = 2;
					FP.world.add(new VKnife(Math.random()*320, true, false));
					FP.world.add(new VKnife(640-Math.random()*320, true, true));
				}
				if (phaseTimer > 14 && counter == 2)
				{
					counter = 0;
					phaseTimer = 0;
					lastPhase = 1;
					phase = 3;
				}
				if (shootTimer > 1)
				{
					shootTimer = 0;
					shootFocus(x,y,Listener.currentField,pointDirection(x,y,Listener.x2,Listener.y2));
					
				}
			}
			else if (phase == 2)
			{
				imagSprite.play("turn");
				realSprite.play("turn");
				if (imagSprite.complete || realSprite.complete)
				{
					if (counter == 0)
					{
						counter = 1;
						FP.world.add(new VBurst(x,y));
					}
					if (phaseTimer > 84)
					{
						imagSprite.play("turnBack");
						realSprite.play("turnBack");
						counter = 0;
						phase = 3;
						lastPhase = -1;
						phaseTimer = 0;
					}
				}
			}
			else if (phase == 3)
			{
				if (phaseTimer > 2)
				{
					phase = lastPhase + 1;
					phaseTimer = 0;
					shootTimer = 0;
				}
			}
			}
		}
		override public function render():void
		{
			super.render();
			
		}
		public function shootFocus(xx:Number, yy:Number, field:Boolean,dir:Number):void
		{
			if (field == false)
			{
				shoot(new Bullet(null,24,24,12,12,dir,4,0,false,3,1,false),xx,yy,FP.choose(new Image(Assets.BULLET_BLUE_IMAG), new Image(Assets.BULLET_RED_IMAG), new Image(Assets.BULLET_GREEN_IMAG)) as Image);
				shoot(new Bullet(null,24,24,12,12,dir+20,4,-0.6,false,3,1,false),xx,yy,FP.choose(new Image(Assets.BULLET_BLUE_IMAG), new Image(Assets.BULLET_RED_IMAG), new Image(Assets.BULLET_GREEN_IMAG)) as Image);
				shoot(new Bullet(null,24,24,12,12,dir-20,4,0.6,false,3,1,false),xx,yy,FP.choose(new Image(Assets.BULLET_BLUE_IMAG), new Image(Assets.BULLET_RED_IMAG), new Image(Assets.BULLET_GREEN_IMAG)) as Image);
				shoot(new Bullet(null,24,24,12,12,dir+40,4,-0.12,false,3,1,false),xx,yy,FP.choose(new Image(Assets.BULLET_BLUE_IMAG), new Image(Assets.BULLET_RED_IMAG), new Image(Assets.BULLET_GREEN_IMAG)) as Image);
				shoot(new Bullet(null,24,24,12,12,dir-40,4,0.12,false,3,1,false),xx,yy,FP.choose(new Image(Assets.BULLET_BLUE_IMAG), new Image(Assets.BULLET_RED_IMAG), new Image(Assets.BULLET_GREEN_IMAG)) as Image);
				shoot(new Bullet(null,24,24,12,12,dir+60,4,-0.2,false,3,1,false),xx,yy,FP.choose(new Image(Assets.BULLET_BLUE_IMAG), new Image(Assets.BULLET_RED_IMAG), new Image(Assets.BULLET_GREEN_IMAG)) as Image);
				shoot(new Bullet(null,24,24,12,12,dir-60,4,0.2,false,3,1,false),xx,yy,FP.choose(new Image(Assets.BULLET_BLUE_IMAG), new Image(Assets.BULLET_RED_IMAG), new Image(Assets.BULLET_GREEN_IMAG)) as Image);
			}
			else
			{
				shoot(new Bullet(null,24,24,12,12,dir,4,0,true,3,1,false),xx,yy,FP.choose(new Image(Assets.BULLET_BLUE_REAL), new Image(Assets.BULLET_RED_REAL), new Image(Assets.BULLET_GREEN_REAL)) as Image);
				shoot(new Bullet(null,24,24,12,12,dir+20,4,-0.6,true,3,1,false),xx,yy,FP.choose(new Image(Assets.BULLET_BLUE_REAL), new Image(Assets.BULLET_RED_REAL), new Image(Assets.BULLET_GREEN_REAL)) as Image);
				shoot(new Bullet(null,24,24,12,12,dir-20,4,0.6,true,3,1,false),xx,yy,FP.choose(new Image(Assets.BULLET_BLUE_REAL), new Image(Assets.BULLET_RED_REAL), new Image(Assets.BULLET_GREEN_REAL)) as Image);
				shoot(new Bullet(null,24,24,12,12,dir+40,4,-0.12,true,3,1,false),xx,yy,FP.choose(new Image(Assets.BULLET_BLUE_REAL), new Image(Assets.BULLET_RED_REAL), new Image(Assets.BULLET_GREEN_REAL)) as Image);
				shoot(new Bullet(null,24,24,12,12,dir-40,4,0.12,true,3,1,false),xx,yy,FP.choose(new Image(Assets.BULLET_BLUE_REAL), new Image(Assets.BULLET_RED_REAL), new Image(Assets.BULLET_GREEN_REAL)) as Image);
				shoot(new Bullet(null,24,24,12,12,dir+60,4,-0.2,true,3,1,false),xx,yy,FP.choose(new Image(Assets.BULLET_BLUE_REAL), new Image(Assets.BULLET_RED_REAL), new Image(Assets.BULLET_GREEN_REAL)) as Image);
				shoot(new Bullet(null,24,24,12,12,dir-60,4,0.2,true,3,1,false),xx,yy,FP.choose(new Image(Assets.BULLET_BLUE_REAL), new Image(Assets.BULLET_RED_REAL), new Image(Assets.BULLET_GREEN_REAL)) as Image);
			}
		}
		
	}
}