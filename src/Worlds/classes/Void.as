package Worlds.classes
{
	import DryErase.Enemies.Void.WaveControl.Master_V;
	import DryErase.HUD.GUI;
	import DryErase.HUD.Score;
	import DryErase.Hero.Listener;
	
	import Worlds.GameWorld;
	import Worlds.classes.Backgrounds.Fog;
	import Worlds.classes.Title.DarkBackground;
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;

	public class Void extends GameWorld
	{ 
		private var _background:Entity;
		private var _backreal:DarkBackground;
		private var _hero:Listener;
		
		private var _hud:GUI;
		private var _score:Score;
		public function Void()
		{
			_hero = new Listener();
			_background = new Entity(0,0,new Image(Assets.TITLE_BACK));
			_backreal = new DarkBackground(0);
			
			_backreal.visible = false;
			_hud = new GUI(_hero);
			_score = new Score();
			add(_background);
			add(_backreal);
			
			add(new Fog());
			add(new Master_V());
			
			add(_hero);	
			
			add(_hud);
			add(_score);
			
		}
		override public function begin():void
		{
			super.begin();
			SoundManager.currentMusic=SoundManager.musicVoid;
		}
		override public function update():void
		{
			if (Listener.currentField == false)
			{
				_background.visible = true;
				_backreal.visible = false;
			
			
			}
			else
			{
				_background.visible = true;
				_backreal.visible = true;
			
			}
			super.update();
		}
	}
}