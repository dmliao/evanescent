package Worlds.classes 
{
	/**
	 * ...
	 * @author 
	 */
	import DryErase.Effects.Explosion_Imagination;
	import DryErase.Effects.LensFlare;
	import DryErase.Enemies.*;
	import DryErase.Enemies.Generic.ForPauseEnemy;
	import DryErase.Enemies.Mountain.WaveControl.MArcWave_I01;
	import DryErase.Enemies.Mountain.WaveControl.Master_M;
	import DryErase.HUD.GUI;
	import DryErase.HUD.Score;
	import DryErase.Hero.Listener;
	import DryErase.Obstacle.Obstacle;
	
	import Worlds.GameWorld;
	import Worlds.classes.Backgrounds.Fog;
	import Worlds.classes.Backgrounds.Mountain_Back;
	import Worlds.classes.Backgrounds.Mountain_Back_Real;
	import Worlds.classes.Backgrounds.Transition;
	import Worlds.classes.Backgrounds.test.Parallax_Mountain;
	
	import lib.clouds.MovingClouds;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	
	public class Mountain extends GameWorld
	{
		
		private var _background:Mountain_Back;
		private var _backreal:Mountain_Back_Real;
		private var _hero:Listener;
		
		
		public static var _sunset:Entity;
		public static var _sunsetreal:Entity;
		
		public static var _glare:Entity;
		public var glareImage:Image;
		
		private var _hud:GUI;
		private var _score:Score;
		
		public var flare:LensFlare;
		
		public var cloud1:MovingClouds;
		public var cloud2:MovingClouds;
		
		public static var overMountains:Boolean = true;
		
		
		public function Mountain() 
		{
			
			super();
			cloud1 = new MovingClouds(640,480, -2, -3,false,0x000000);
			cloud1.x = 0;
			cloud1.y = 0;
			cloud1.alpha = 0.3;
			cloud2 = new MovingClouds(640,480,-1,1,false,0x000000);
			cloud2.x = 0;
			cloud2.y = 0;
			cloud2.alpha =0.4;
			flare = new LensFlare(120, 166, -30);
			
			_sunset = new Entity(0,0,new Image(Assets.SUNSET));
			_sunset.layer = 100;
			_sunsetreal = new Entity(0,0,new Image(Assets.SUNSETR));
			_sunsetreal.layer = 100;
			
			glareImage = new Image(Assets.glare);
			glareImage.blend = "add";
			glareImage.alpha = 0.1;
			_glare = new Entity(0,0,glareImage);
			_glare.layer = -9999999;
		//	FP.engine.addChild(cloud1);
			FP.engine.addChild(cloud2);
			
			_hero = new Listener();
			_background = new Mountain_Back();
			_backreal = new Mountain_Back_Real();
			_backreal.visible = false;
			
			_hud = new GUI(_hero);
			_score = new Score();
			add(flare);
			add(_sunset);
			add(_sunsetreal);
			add(_glare);
		//	add(new Entity(0, 0, _background));
		//	add(new Entity(0, 0, _backreal));
			
			add(new Fog());
			
			add(new Master_M() );
			
			//add(new Explosion_Imagination(300, 200));
			
			add(_hero);	
			
			add(_hud);
			add(_score);
			
			//TEST
			add(new Parallax_Mountain(-300,1));
			add(new Parallax_Mountain(-240,2));
			add(new Parallax_Mountain(-180,1));
			add(new Parallax_Mountain(-100,2));
			add(new Parallax_Mountain(-20,1));
			add(new Parallax_Mountain(80,2));
			add(new Parallax_Mountain(190,1));
			add(new Parallax_Mountain(290,2));
			add(new Parallax_Mountain(400,1));
			add(new Parallax_Mountain(540,2));
			add(new Parallax_Mountain(640,1));
			add(new Parallax_Mountain(780,2));
			
		}
		override public function begin():void
		{
			super.begin();
			SoundManager.currentMusic = SoundManager.musicMountain;
		}
		override public function update():void
		{
			
			
			_background.y += 2 * Main.frameRate * FP.elapsed;
			_backreal.y += 2 * Main.frameRate * FP.elapsed;
			
			if (Listener.currentField == false)
			{
				if (overMountains == true)
				{
					_background.visible = true;
					_backreal.visible = false;
					_sunset.visible =true;
					_sunsetreal.visible = false;
				}
				else
				{
					_background.visible = false;
					_backreal.visible = false;
					_sunset.visible =true;
					_sunsetreal.visible = false;
				}
				worldBackground = _background;
				
				flare.visible = false;
				if (Listener.isTransitioning == false)
				{
					_glare.visible = false;
				}
				else
				{
					_glare.visible = true;
				}
				
			}
			else
			{
				if (overMountains == true)
				{
					_background.visible = false;
					_backreal.visible = true;
					_sunset.visible = false;
					_sunsetreal.visible =true;
				}
				else
				{
					_background.visible = false;
					_backreal.visible = false;
					_sunset.visible = false;
					_sunsetreal.visible =true;
				}
				worldBackground = _backreal;
				_glare.visible = true;
				if (Listener.isTransitioning == false)
				{
					flare.visible = true;
					
					
				}
				else
				{
					flare.visible = false;
					//_glare.visible = false;
				}
			}
			//_background.y = _background.y % FP.height;
			super.update();
			
			if (flare.image.angle < 355)
			{
				flare.image.angle += 0.005;
			}
		}
		
		override public function end():void
		{
			FP.engine.removeChild(cloud2);
		}
		
	}

}