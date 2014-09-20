package Worlds.classes
{
	import DryErase.Cutscenes.LevelCompleteTally;
	import DryErase.Enemies.Endless.WaveControl.Master_E;
	import DryErase.HUD.GUI;
	import DryErase.HUD.LivesHUD;
	import DryErase.HUD.Score;
	import DryErase.Hero.Listener;
	
	import Worlds.GameWorld;
	import Worlds.classes.Backgrounds.Fog;
	import Worlds.classes.Title.DarkBackground;

	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class Endless extends GameWorld
	{
		private var _background:Entity;
		private var _backreal:DarkBackground;
		private var _hero:Listener;
		public static var _glare:Entity;
		public var glareImage:Image;
		private var _hud:GUI;
		private var _score:Score;
		
		private var hpAlarm:Number = 0;
		
		public static var lives:Number = 3;
		private var buffer:Number = 0;
		public function Endless()
		{
			super();
			_hero = new Listener();
			_background = new Entity(0,0,new Image(Assets.TITLE_BACK));
			_backreal = new DarkBackground(0);
			_backreal.visible = false;
			_hud = new GUI(_hero);
			_score = new Score();
			add(_background);
			add(_backreal);
			glareImage = new Image(Assets.glare);
			glareImage.blend = "add";
			glareImage.alpha = 0.1;
			_glare = new Entity(0,0,glareImage);
			_glare.layer = -9999999;
			
			add(new Fog());
			add(new Master_E());
			
			add(_hero);	
			lives = 3;
			add(_hud);
			add(_score);
			add(new LivesHUD());
			add(_glare);
			
			
		}
		override public function begin():void
		{
			super.begin();
			SoundManager.currentMusic=SoundManager.musicDreams;
		}
		override public function update():void
		{
			hpAlarm += FP.elapsed;
			if (lives <= 0)
			{
				Master_E.bossDead = true;
			}
			if (Listener.killed == true)
			{
				if (buffer <= 0)
				lives -= 1;
				buffer = 4;
			}
			buffer -= FP.elapsed;
			if (hpAlarm > 60)
			{
				hpAlarm = 0;
				Listener.hitPoints += 1;
			}
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