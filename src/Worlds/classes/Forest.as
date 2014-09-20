package Worlds.classes 
{
	/**
	 * ...
	 * @author 
	 */
	import DryErase.Effects.Explosion_Imagination;
	import DryErase.Enemies.*;
	import DryErase.Enemies.Forest.WaveControl.Master_F;
	import DryErase.Enemies.Generic.ForPauseEnemy;
	import DryErase.Enemies.Mountain.WaveControl.MArcWave_I01;
	import DryErase.Enemies.Mountain.WaveControl.Master_M;
	import DryErase.HUD.GUI;
	import DryErase.HUD.Score;
	import DryErase.Hero.Listener;
	import DryErase.Obstacle.Obstacle;
	
	import Worlds.GameWorld;
	import Worlds.classes.Backgrounds.Fog;
	import Worlds.classes.Backgrounds.Forest_Back;
	import Worlds.classes.Backgrounds.Forest_Back_Real;
	import Worlds.classes.Backgrounds.Transition;
	import Worlds.classes.Backgrounds.test.Parallax_Forest;
	
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class Forest extends GameWorld
	{
		
		private var _background:Forest_Back;
		private var _backreal:Forest_Back_Real;
		private var _hero:Listener;
		public static var _glare:Entity;
		public var glareImage:Image;
		private var _hud:GUI;
		private var _score:Score;
		
		public function Forest() 
		{
			super();
			
			_hero = new Listener();
			_background = new Forest_Back();
			_backreal = new Forest_Back_Real();
			_backreal.visible = false;
			
			_hud = new GUI(_hero);
			_score = new Score();
			
			add(new Entity(0, 0, _background, null, 100));
			add(new Entity(0, 0, _backreal, null, 100));
			
			
			add(new Fog());
			
			add(new Master_F());
			
			
			add(_hero);	
			
			add(_hud);
			add(_score);
			
			add(new Parallax_Forest(-300,1));
			add(new Parallax_Forest(-240,2));
			add(new Parallax_Forest(-180,1));
			add(new Parallax_Forest(-100,2));
			add(new Parallax_Forest(-20,1));
			add(new Parallax_Forest(80,2));
			add(new Parallax_Forest(190,1));
			add(new Parallax_Forest(290,2));
			add(new Parallax_Forest(400,1));
			add(new Parallax_Forest(540,2));
			add(new Parallax_Forest(640,1));
			add(new Parallax_Forest(780,2));
		}
		override public function begin():void
		{
			super.begin();
			SoundManager.currentMusic=SoundManager.musicForest;
		}
		override public function update():void
		{
			
			_background.y += 0.4 * Main.frameRate * FP.elapsed;
			_backreal.y += 0.4 * Main.frameRate * FP.elapsed;
			
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
			//_background.y = _background.y % FP.height;
			super.update();
			
			
		}
		
	}
	
}