package Worlds.classes
{
	import DryErase.Cutscenes.LevelCompleteTally;
	import DryErase.Enemies.Endless.WaveControl.Master_E;
	import DryErase.Enemies.Generic.WaveControl.Master_T;
	import DryErase.HUD.GUI;
	import DryErase.HUD.LivesHUD;
	import DryErase.HUD.Score;
	import DryErase.Hero.Listener;
	
	import Worlds.GameWorld;
	import Worlds.classes.Backgrounds.Fog;
	import Worlds.classes.Title.DarkBackground;
	import Worlds.classes.Title.WorldMap;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class Tutorial extends GameWorld
	{
		private var _background:Entity;
		private var _backreal:DarkBackground;
		private var _hero:Listener;
		public static var _glare:Entity;
		public var glareImage:Image;
		private var _hud:GUI;
		private var _score:Score;
		
		private var hpAlarm:Number = 0;
		
		private var skipText:Text = new Text("Press " + Key.name(Input.keys("skipCutscene")[0]) + " twice to skip tutorial",320,240);
		private var skippedNumber:Number = 0;
		
		public static var lives:Number = 3;
		private var buffer:Number = 0;
		private var masterT:Master_T = new Master_T();
		public function Tutorial()
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
			
			add(masterT); 
			add(new Fog());
			
			skipText.align="center";
			skipText.font="mainFont";
			skipText.size=20;
			skipText.color = 0x000000;
			skipText.centerOO();
			addGraphic(skipText,-999999999,0,0);
			
			add(_hero);	
			lives = 3;
			add(_hud);
			add(_score);
			add(new LivesHUD());
			add(_glare);
			
			
		}
		override public function init():void
		{
			super.init();
			masterT.init();
			
		}
		override public function update():void
		{
			Listener.hitPoints = 7;
			skipText.alpha -= 0.005;
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
			
			if (Input.pressed("skipCutscene"))
			{
				skippedNumber += 1;
			}
			if (skippedNumber >=2)
			{
				Main.introPassed = true;
				Main.saveGame();
				FP.world = new WorldMap();
			}
			
		}
	}
}