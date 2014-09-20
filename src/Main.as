//THIS NEEDS TO BE COPYPASTA'D TO EVERY TIME SOMETHING HAS A += OR A -=
//  * Main.frameRate * FP.elapsed
// TOGGLE SHADOWS ON ENEMIES OFF AND ON
// SIZE OF SHIP

package  
{
	
	import DryErase.Cutscenes.scenes.B_AfterLevelScene;
	import DryErase.Cutscenes.scenes.BeforeScene;
	import DryErase.Effects.Tests;
	import DryErase.HUD.ControlsGUI;
	import flash.display.StageDisplayState;
	import net.flashpunk.graphics.Image;
	
	import Worlds.EndSplash;
	import Worlds.GameWorld;
	import Worlds.SplashScreen;
	import Worlds.classes.Credits;
	import Worlds.classes.CutsceneWorld;
	import Worlds.classes.Flowerbed;
	import Worlds.classes.Forest;
	import Worlds.classes.LevelComplete;
	import Worlds.classes.Mountain;
	import Worlds.classes.River;
	import Worlds.classes.Title.ControlsEditing;
	import Worlds.classes.Title.TitleMenu;
	import Worlds.classes.Title.TitleWorld;
	import Worlds.classes.Title.WorldMap;
	
	import com.debug.Debug;
//	import com.sociodox.theminer.*;
	
	import flash.display.BitmapData;
	import flash.events.*;
	import flash.geom.Rectangle;
	import flash.net.SharedObject;
	import flash.ui.ContextMenu;
	
	import net.flashpunk.Engine;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Canvas;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	[SWF(width = "640", height = "480")]
	public class Main extends Engine
	{
		public static var minimumScore:Number = -1;
		
		public static var focused:Boolean = false;
		
		public var background:Canvas;
		
		public static var mountainScore:Number;
		public static var flowerScore:Number;
		public static var forestScore:Number;
		public static var riverScore:Number;
		public static var castleScore:Number;
		public static var emptyScore:Number;
		
		public static var storyCleared:Boolean = false;
		
		public static var endlessScore:Number;
		
		public static var currentScore:Number;
		
		public static var introPassed:Boolean;
		
		/**
		 * currentLevel
		 * "Mountain"
		 * "River"
		 * "Flowerbed"
		 * "Forest"
		 * "Castle"
		 * "Void"
		 */
		public static var currentLevel:String;
		
		public static var mountainCompleted:Number;
		public static var riverCompleted:Number;
		public static var flowerCompleted:Number;
		public static var forestCompleted:Number;
		public static var castleCompleted:Number;
		public static var voidCompleted:Number;
		public static var levelsCompleted:Number;
		
		public static var castleOpen:Boolean; //is the castle unlocked?
		public static var emptyOpen:Boolean; //is the empty world unlocked?
		
		public static var paused:Boolean = false;
		public static var inCutscene:Boolean = false;
		
		public static var isArcade:Boolean = false;
		
		public static var saveData:SharedObject = SharedObject.getLocal("evanescentsave");
		
		public static const FADEFIELD:Number = 0.4;
		
		public var smallTimer:Number = 1;
		public var flag:Boolean = false;
		
		public static var layerFilter:Array = new Array();
		
		
		//var _mochiads_game_id:String = "8a1cc360c88f5e73";
		
		public static var frameRate:Number = 55;
		
		public function Main() 
		{
			Assets.init();
			super(640, 480, 60, false);
			
			FP.screen.scale = 1;
			FP.screen.smoothing = true;
			currentScore = 0;
			focused = true;
			
			Input.define("up", Key.UP);
			Input.define("left", Key.LEFT);
			Input.define("right", Key.RIGHT);
			Input.define("down", Key.DOWN);
			
			Input.define("shoot", Key.A);
			Input.define("special", Key.S);
			Input.define("start", Key.SPACE);
			
			Input.define("confirm", Key.A, Key.SPACE);
			
			Input.define("skipCutscene", Key.ENTER);
			
			Input.define("pause", Key.P);
			Input.define("setFullscreen", Key.F1);
			Input.define("unusable", Key.BACKSPACE, Key.F1, Key.DELETE, Key.NUMPAD_ADD, Key.NUMPAD_DECIMAL, Key.NUMPAD_DIVIDE, Key.NUMPAD_ENTER, Key.NUMPAD_MULTIPLY, Key.NUMPAD_SUBTRACT, Key.CAPS_LOCK, Key.LEFT_SQUARE_BRACKET, Key.RIGHT_SQUARE_BRACKET);
			Input.define("mapped", Input.keys("up")[0], Input.keys("left")[0], Input.keys("right")[0], Input.keys("down")[0], Input.keys("shoot")[0], Input.keys("special")[0], Input.keys("start")[0], Input.keys("skipCutscene")[0], Input.keys("pause")[0]);
			
			loadPreferences();
			loadGame();
			
			
			if (levelsCompleted >= 4)
			{
				castleOpen = true;
			}
			if (levelsCompleted >= 5)
			{
				emptyOpen = true;
			}
			if (levelsCompleted >= 6)
			{
				storyCleared = true;
			}
			
			GameWorld.focusScreen = new Image(Assets.FOCUS);
			GameWorld.focusScreen2 = new Image(Assets.FOCUS2);
			FP.screen.color = 0xFFFFFF;
			
		}
		
		override public function init():void 
		{
			FP.stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseClick,false,0,true);
			super.init();
			
			paused = false;
			
			{
				FP.world = new SplashScreen();
			}
			
		}
		
		private function mouseClick(e:Event):void
		{
			FP.stage.removeEventListener(MouseEvent.MOUSE_DOWN, mouseClick);
			FP.stage.addEventListener(Event.ACTIVATE, focusGained,false,0,true);
			FP.stage.addEventListener(Event.DEACTIVATE, focusLose,false,0,true);
			focusGained();
		}

		private function focusGained(e:Event = null):void
		{
			focused = true;
			if (inCutscene == false)
			{
				paused = false;
			}
		}
	
		override public function update():void
		{
			FP.screen.smoothing = true;
			var xScale:Number = stage.stageWidth / 640;
			var yScale:Number = stage.stageHeight / 480;
			if (Input.pressed("setFullscreen"))
			{
				if (FP.stage.displayState != StageDisplayState.NORMAL)
				{
					FP.stage.displayState = StageDisplayState.NORMAL;
				}
				else {
					FP.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
				}
			}
			if (xScale < yScale)
				{
					FP.screen.scale = xScale;
					FP.screen.y = (stage.stageHeight - 480 * FP.screen.scale) / 2;
					FP.screen.x = 0;
				}
				else
				{
					FP.screen.scale = yScale;
					FP.screen.x = (stage.stageWidth - 640 * yScale) / 2;
					FP.screen.y = 0;
				}
			if (paused == false)
			{
				frameRate = 55;
			}
		
			super.update();
			if (flag == true)
			{

				smallTimer -= FP.elapsed;
				if (smallTimer < 0)
				{
					paused = true;
					flag = false;
					GameWorld.focusScreen.alpha = 0.8;
				}
			}
			Utils.quake.update();
			Utils.flash.update();
			
			if (FP.world is Mountain)
			{
				currentLevel = "mountain";
			}
			else if (FP.world is River)
			{
				currentLevel = "river";
			}
			else if (FP.world is Flowerbed)
			{
				currentLevel = "flower";
			}
			else if (FP.world is Forest)
			{
				currentLevel = "forest";
			}
			
		}
		
		override public function render():void
		{
			super.render();
			
			Utils.flash.render();
		}
		
		private function focusLose(e:Event = null):void
		{
			
			focused = false;
			flag = true;
			smallTimer = 0.035;
		}	
		
		public static function saveGame():void
		{
			saveData.data.intro = introPassed;
			
			saveData.data.river = riverScore;
			saveData.data.mountain = mountainScore;
			saveData.data.flower = flowerScore;
			saveData.data.forest = forestScore;
			
			saveData.data.riverC = riverCompleted;
			saveData.data.mountainC = mountainCompleted;
			saveData.data.flowerC = flowerCompleted;
			saveData.data.forestC = forestCompleted;
			
			saveData.data.castle = castleScore;
			saveData.data.empty = emptyScore;
			
			saveData.data.castleC = castleCompleted;
			saveData.data.voidC = voidCompleted;
			
			saveData.data.endless = endlessScore;
			
			saveData.data.cleared = storyCleared;
			
			saveData.data.levels = levelsCompleted;
		}
		
		public static function deleteGame():void
		{
			saveData.data.intro = false;
			
			saveData.data.river = 0;
			saveData.data.mountain = 0;
			saveData.data.flower = 0;
			saveData.data.forest = 0;
			
			saveData.data.castle = 0;
			saveData.data.empty = 0;
			
			saveData.data.riverC = 0;
			saveData.data.mountainC = 0;
			saveData.data.flowerC = 0;
			saveData.data.forestC = 0;
			
			saveData.data.castleC = 0;
			saveData.data.voidC = 0;
			
			saveData.data.endless = 0;
			
			saveData.data.levels = 0;
			saveData.data.cleared = false;
			loadGame();
		}
		public static function softDelete():void
		{
			saveData.data.intro = false;
			
		
			saveData.data.riverC = 0;
			saveData.data.mountainC = 0;
			saveData.data.flowerC = 0;
			saveData.data.forestC = 0;
			
			saveData.data.castleC = 0;
			saveData.data.voidC = 0;
			
			saveData.data.levels = 0;
			loadGame();
		}
		
		public static function loadGame():void
		{
			
			introPassed = saveData.data.intro;
			if (!saveData.data.intro)
			{
				introPassed = false;
			}	
			storyCleared = saveData.data.cleared;
			if (!saveData.data.cleared)
			{
				storyCleared = false;
			}	
			mountainScore = saveData.data.mountain;
			if (!saveData.data.mountain)
			{
				mountainScore = 0;
			}
			
			flowerScore = saveData.data.flower;
			if (!saveData.data.flower)
			{
				flowerScore = 0;
			}
			forestScore = saveData.data.forest;
			if (!saveData.data.forest)
			{
				forestScore = 0;
			}
			riverScore = saveData.data.river;
			if (!saveData.data.river)
			{
				riverScore = 0;
			}
			castleScore = saveData.data.castle;
			if (!saveData.data.castle)
			{
				castleScore = 0;
			}
			emptyScore = saveData.data.empty;
			if (!saveData.data.empty)
			{
				emptyScore = 0;
			}
			
			mountainCompleted = saveData.data.mountainC;
			if (!saveData.data.mountainC)
			{
				mountainCompleted = 0;
			}
			
			flowerCompleted = saveData.data.flowerC;
			if (!saveData.data.flowerC)
			{
				flowerCompleted = 0;
			}
			forestCompleted = saveData.data.forestC;
			if (!saveData.data.forestC)
			{
				forestCompleted = 0;
			}
			riverCompleted = saveData.data.riverC;
			if (!saveData.data.riverC)
			{
				riverCompleted = 0;
			}
			castleCompleted = saveData.data.castleC;
			if (!saveData.data.castleC)
			{
				castleCompleted = 0;
			}
			voidCompleted = saveData.data.voidC;
			if (!saveData.data.voidC)
			{
				voidCompleted = 0;
			}
			endlessScore = saveData.data.endless;
			if (!saveData.data.endless)
			{
				endlessScore = 0;
			}
			levelsCompleted = 
				forestCompleted + flowerCompleted + mountainCompleted + 
				riverCompleted + castleCompleted + voidCompleted;
			
			if (levelsCompleted >= 4)
			{
				castleOpen = true;
			}
			else
			{
				castleOpen = false;
			}
			if (levelsCompleted >= 5)
			{
				emptyOpen = true;
			}
			else
			{
				emptyOpen = false;
			}
			
		}
		
		public static function savePreferences():void
		{
			saveData.data.musicVolume = SoundManager.volumeMusic;
			saveData.data.soundVolume = SoundManager.volumeSound;
			
			//CONTROLS
			saveData.data.upKey = Input.keys("up")[0];
			saveData.data.downKey = Input.keys("down")[0];
			saveData.data.rightKey = Input.keys("right")[0];
			saveData.data.leftKey = Input.keys("left")[0];
			saveData.data.shootKey = Input.keys("shoot")[0];
			saveData.data.specialKey = Input.keys("special")[0];
			saveData.data.startKey = Input.keys("start")[0];
			saveData.data.skipKey = Input.keys("skipCutscene")[0];
			saveData.data.pauseKey = Input.keys("pause")[0];
		}
		
		public static function loadPreferences():void
		{
			Input.define("up", Key.UP);
			Input.define("left", Key.LEFT);
			Input.define("right", Key.RIGHT);
			Input.define("down", Key.DOWN);
			
			Input.define("shoot", Key.A);
			Input.define("special", Key.S);
			Input.define("start", Key.SPACE);
			
			Input.define("confirm", Key.A, Key.SPACE);
			
			Input.define("skipCutscene", Key.ENTER);
			
			Input.define("pause", Key.P);
			
			Input.define("unusable", Key.BACKSPACE, Key.DELETE, Key.NUMPAD_ADD, 
				Key.NUMPAD_DECIMAL, Key.NUMPAD_DIVIDE, Key.NUMPAD_ENTER, 
				Key.NUMPAD_MULTIPLY, Key.NUMPAD_SUBTRACT, Key.CAPS_LOCK, 
				Key.LEFT_SQUARE_BRACKET, Key.RIGHT_SQUARE_BRACKET);
			Input.define("mapped", Input.keys("up")[0], Input.keys("left")[0], 
				Input.keys("right")[0], Input.keys("down")[0], 
				Input.keys("shoot")[0], Input.keys("special")[0], 
				Input.keys("start")[0], Input.keys("skipCutscene")[0], 
				Input.keys("pause")[0]);
			
			
			SoundManager.volumeMusic=saveData.data.musicVolume;
			if (saveData.data.musicVolume!=0)
			{
				SoundManager.volumeMusic = 0.5;
			}	
			SoundManager.volumeSound=saveData.data.soundVolume;
			if (saveData.data.soundVolume!=0)
			{
				SoundManager.volumeSound = 0.5;
			}	
			
			if (saveData.data.upKey)
			{
				Input.define("up",saveData.data.upKey);
			}
			if (saveData.data.downKey)
			{
				Input.define("down",saveData.data.downKey);
			}
			if (saveData.data.leftKey)
			{
				Input.define("left",saveData.data.leftKey);
			}
			if (saveData.data.rightKey)
			{
				Input.define("right",saveData.data.rightKey);
			}
			if (saveData.data.shootKey)
			{
				Input.define("shoot",saveData.data.shootKey);
			}
			if (saveData.data.specialKey)
			{
				Input.define("special",saveData.data.specialKey);
			}
			if (saveData.data.startKey)
			{
				Input.define("start",saveData.data.startKey);
			}
			if (saveData.data.pauseKey)
			{
				Input.define("pause",saveData.data.pauseKey);
			}
			if (saveData.data.skipKey)
			{
				Input.define("skipCutscene",saveData.data.skipKey);
			}
			Input.define("confirm", 
				Input.keys("shoot")[0], Input.keys("start")[0]);
			
			Input.define("mapped", 
				Input.keys("up")[0], Input.keys("left")[0], 
				Input.keys("right")[0], Input.keys("down")[0], 
				Input.keys("shoot")[0], Input.keys("special")[0], 
				Input.keys("start")[0], Input.keys("skipCutscene")[0], 
				Input.keys("pause")[0]);
		}
		public function checkDomain (allowed:*):Boolean
		{
			var url:String = FP.stage.loaderInfo.url;
			var startCheck:int = url.indexOf('://' ) + 3;
			
			if (url.substr(0, startCheck) == 'file://') return true;
			
			var domainLen:int = url.indexOf('/', startCheck) - startCheck;
			var host:String = url.substr(startCheck, domainLen);
			
			if (allowed is String) allowed = [allowed];
			for each (var d:String in allowed)
			{
				if (host.substr(-d.length, d.length) == d) return true;
			}
			
			return false;
		}

	}
}
 