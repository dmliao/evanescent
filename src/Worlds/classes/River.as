package Worlds.classes 
{
	/**
	 * ...
	 * @author 
	 */
	import DryErase.Effects.Explosion_Imagination;
	import DryErase.Effects.Tests;
	import DryErase.Enemies.*;
	import DryErase.Enemies.Generic.ForPauseEnemy;
	import DryErase.Enemies.Mountain.WaveControl.MArcWave_I01;
	import DryErase.Enemies.Mountain.WaveControl.Master_M;
	import DryErase.Enemies.River.WaveControl.Master_R;
	import DryErase.HUD.GUI;
	import DryErase.HUD.Score;
	import DryErase.Hero.Listener;
	import DryErase.Obstacle.Obstacle;
	
	import Worlds.GameWorld;
	import Worlds.classes.Backgrounds.Fog;
	import Worlds.classes.Backgrounds.River_Back;
	import Worlds.classes.Backgrounds.River_Back_Real;
	import Worlds.classes.Backgrounds.Transition;
	
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	
	public class River extends GameWorld
	{
		
		private var _background:River_Back;
		private var _backreal:River_Back_Real;
		private var _hero:Listener;
		
		private var _hud:GUI;
		private var _score:Score;
		
		public static var worldBackground:Backdrop;
		public static var freezeFrame:Boolean = false;
		
		public static var icedOver:Boolean = false;
		
		public var iceImage:Image = new Image(Assets.riverIce);
		
		public var ice:Entity = new Entity(0,0,iceImage);
		
		public function River() 
		{
			super();
			_hero = new Listener();
			_background = new River_Back();
			_backreal = new River_Back_Real();
			_backreal.visible = false;
			
			_hud = new GUI(_hero);
			_score = new Score();
			
			add(new Entity(0, 0, _background));
			add(new Entity(0, 0, _backreal));
			
			add(new Master_R());
			
			add(new Fog());
			
			add(_hero);	
			
			add(_hud);
			add(_score);
			worldBackground = _background;
			add(ice);
			if (icedOver == true)
			{
				iceImage.alpha = 0.4;
			}
			else
			{
				iceImage.alpha = 0;
			}
			iceImage.blend = "add";
		}
		override public function begin():void
		{
			super.begin();
			SoundManager.currentMusic=SoundManager.musicRiver;
		}
		override public function update():void
		{

			if (freezeFrame == false)
			{
				_background.y += 2 * Main.frameRate * FP.elapsed;
				_backreal.y += 2 * Main.frameRate * FP.elapsed;
			}
		
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
			if (icedOver == true)
			{
				iceImage.alpha = 0.4;
			}
			else
			{
				iceImage.alpha = 0;
			}
		}
		
	}

}