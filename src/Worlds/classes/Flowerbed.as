package Worlds.classes
{
	import DryErase.Effects.Explosion_Imagination;
	import DryErase.Effects.Fire_Dark;
	import DryErase.Enemies.*;
	import DryErase.Enemies.Flower.Enemies.boss.BBoss_Imag;
	import DryErase.Enemies.Flower.Enemies.boss.BBoss_Real;
	import DryErase.Enemies.Flower.WaveControl.Master_B;
	import DryErase.Enemies.Generic.ForPauseEnemy;
	import DryErase.Enemies.Mountain.WaveControl.MArcWave_I01;
	import DryErase.Enemies.Mountain.WaveControl.Master_M;
	import DryErase.HUD.GUI;
	import DryErase.HUD.Score;
	import DryErase.Hero.Listener;
	import DryErase.Obstacle.Obstacle;
	
	import Worlds.GameWorld;
	import Worlds.classes.Backgrounds.Flower_Back;
	import Worlds.classes.Backgrounds.Flower_Back_Real;
	import Worlds.classes.Backgrounds.Fog;
	import Worlds.classes.Backgrounds.Transition;
	
	import com.amorphous.flame.Fire;
	
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;

	public class Flowerbed extends GameWorld
	{
		

		private var _background:Flower_Back;
		private var _backreal:Flower_Back_Real;
		private var _hero:Listener;
		public static var _glare:Entity;
		public var glareImage:Image;
		private var _hud:GUI;
		private var _score:Score;
		
		private var fireTimer:Number = 0;
		private var fireTimer2:Number = 0;
		
		private var isBurned:Boolean = false;
		private var burn:Entity;
		private var burnoverlay:Image = new Image(Assets.BURN_OVERLAY);
		private var fire:Fire = new Fire(0,0,640,480,30,24);
//		private var fire2:Fire = new Fire(320,240,240,240,25,25);
		
		private var burnSwitch:Boolean = false;
		
		private var burnImag:Boolean = false;
		private var burnReal:Boolean = false;
		
		private var isBurning:Boolean = false;
		public function Flowerbed()
		{
			burn = new Entity(0,0, new Image(Assets.BURNED));
			burn.layer = 0;
			burnoverlay.blend = "add";
			burnoverlay.alpha = 0.1;
			super();
			_hero = new Listener();
			_background = new Flower_Back();
			_backreal = new Flower_Back_Real();
			_backreal.visible = false;
			_hud = new GUI(_hero);
			_score = new Score();
			add(new Entity(0,0,_background));
			add(new Entity(0,0,_backreal));
			glareImage = new Image(Assets.glare);
			glareImage.blend = "add";
			glareImage.alpha = 0.3;
			_glare = new Entity(0,0,glareImage);
			_glare.layer = -9999999;
			add(new Fog());
			add(new Master_B());
			
			
			add(_hero);	
			
			add(_hud);
			add(_score);
			
			add(_glare);
			
		
		}
		override public function begin():void
		{
			super.begin();
			SoundManager.currentMusic=SoundManager.musicFlower;
		}
		override public function end():void
		{
			if (FP.engine.contains(fire))
			{
				FP.engine.removeChild(fire);
			}
		}
		override public function update():void
		{
			if (FP.engine.contains(fire))
			{
			fireTimer += FP.elapsed;
			fireTimer2 += FP.elapsed;
			if (fireTimer > 0.05)
			{
				
				fire.render(null);
				fireTimer = 0;
			}
			if (fireTimer2 > 0.25)
			{
				fire.addFuelCircle(Math.random()*640,Math.random()*480,1);
				
				fireTimer2 = 0;
			}
			}
		//	fire2.burnFuelCircle(100,200,1);
			_background.y += 2 * Main.frameRate * FP.elapsed;
			_backreal.y += 2 * Main.frameRate * FP.elapsed;
			if (Listener.currentField == false)
			{
				_background.visible = true;
				_backreal.visible = false;
				worldBackground = _background;
				
			}
			else
			{
				_background.visible = false;
				_backreal.visible = true;
				worldBackground = _backreal;
			}
			super.update();
			
			if (burnSwitch)
			{
				burnoverlay.alpha += 0.002;
			}
			else
			{
				burnoverlay.alpha -= 0.002;
			}
			
			if (burnoverlay.alpha > 0.3)
			{
				burnSwitch = false;
			}
			else if (burnoverlay.alpha < 0.05)
			{
				burnSwitch = true;
			}
			
			if (isBurning == false && Master_B.canBurn == true)
			{
				startburn();
				isBurning = true;
			}
			if (isBurning == true)
			{
				fire.addFuelCircle(BBoss_Imag.deadX,BBoss_Imag.deadY,1);
				fire.addFuelCircle(BBoss_Real.deadX,BBoss_Real.deadY,1);
				if (burnImag == false)
				{
					if (BBoss_Imag.defeated == true)
					{
						fire.addFuelCircle(BBoss_Imag.deadX,BBoss_Imag.deadY,5);
						fire.burnFuelPoint(BBoss_Imag.deadX,BBoss_Imag.deadY);
						burnImag = true;
					}
				}
				if (burnReal == false)
				{
					if (BBoss_Real.defeated == true)
					{
						fire.addFuelCircle(BBoss_Real.deadX,BBoss_Real.deadY,5);
						fire.burnFuelPoint(BBoss_Real.deadX,BBoss_Real.deadY);
						burnReal = true;
					}
				}
			}
		}
		
		public function startburn():void
		{
			fire.burnFuelCircle(120,470,1);
			fire.burnFuelCircle(540,460,1);
			
			fire.burnFuelCircle(300,440,2);
			fire.burnFuelCircle(166,450,1);
			fire.burnFuelCircle(480,460,1);
			
			FP.engine.addChild(fire);
			add(burn);
		//	add(new Fire_Dark(100,300));
			add(new Entity(0,0,burnoverlay));
			//	FP.engine.addChild(fire2);
			//FIRE STUFF
			fire.maxParticles = 0;
			//	fire.drawSmoke = false;
			fire.particleType = 0;
			fire.particleSize = 5;
			
			fire.smokeColor = 0xffc658;
			
			
		}
	}
}