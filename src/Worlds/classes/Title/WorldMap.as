package Worlds.classes.Title
{
	import DryErase.Cutscenes.FadeText;
	import DryErase.Cutscenes.FadeTextLong;
	import DryErase.Hero.Listener;
	import DryErase.Hero.Title.MiniListener;
	import net.flashpunk.graphics.Text;
	
	import Worlds.classes.Castle;
	import Worlds.classes.Flowerbed;
	import Worlds.classes.Forest;
	import Worlds.classes.Mountain;
	import Worlds.classes.River;
	import Worlds.classes.Title.Worldmap.B_CollideLevel;
	import Worlds.classes.Title.Worldmap.C_CollideLevel;
	import Worlds.classes.Title.Worldmap.F_CollideLevel;
	import Worlds.classes.Title.Worldmap.M_CollideLevel;
	import Worlds.classes.Title.Worldmap.R_CollideLevel;
	import Worlds.classes.Title.Worldmap.V_CollideLevel;
	import Worlds.classes.Void;
	
	import com.debug.Debug;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

	public class WorldMap extends World
	{
	
		
		public var transPoem:FadeText;
		
		public var background:Entity;
		public var backImage:Image;
		
		public var m:M_CollideLevel = new M_CollideLevel();
		public var r:R_CollideLevel = new R_CollideLevel();
		public var b:B_CollideLevel = new B_CollideLevel();
		public var f:F_CollideLevel = new F_CollideLevel();
		public var c:C_CollideLevel = new C_CollideLevel();
		public var v:V_CollideLevel = new V_CollideLevel();
		
		public var goBack:FadeText;
		public var chooseLevel:FadeTextLong;
		public var goBackBool:Boolean = false;
		public var created:Boolean = false;
		public function WorldMap()
		{
			if (Main.levelsCompleted >= 4)
			{
				Main.castleOpen = true;
			}
			if (Main.levelsCompleted >= 5)
			{
				Main.emptyOpen = true;
			}
			super();
			backImage = new Image(Assets.WORLDMAP);
			background = new Entity(0,0,backImage);
			add(new WorldBackground);
			
			add(new MiniListener());
			add(new Entity(0,0,transImage));
			add(m);
			add(r);
			add(b);
			add(f);
			add(c);
			
			
			
			Listener.currentField = false;
		}
		
		public static var transImage:Image = new Image(Assets.TITLE_BACK);
		
		public var spd:Number = 0;
		public var transFactor:Number = 2;
		override public function begin():void
		{
			super.begin();
			SoundManager.currentMusic = SoundManager.musicAwaken;
			if (Main.levelsCompleted >= 5 || Main.isArcade == true)
			{
				add(v);
			}
			chooseLevel = new FadeTextLong("Use " + Key.name(Input.keys("up")[0]) + ", " + Key.name(Input.keys("down")[0]) + ", " + Key.name(Input.keys("left")[0]) + ", and " + Key.name(Input.keys("right")[0]) + "," + " to navigate the map.", false, 320, 490, true);
			goBack = new FadeText("Press " + Key.name(Input.keys("special")[0]) + " to return to the title screen", false, 320, 520, true);
		}
		override public function update():void
		{
			super.update();
			
			if (Input.check("special") && transImage.alpha <= 0)
			{
				goBackBool = true;
			}
			if (goBackBool == true)
			{
				transitionTo(TitleWorld,"");
			}
			else if (r.go == true)
			{
				transitionTo(River, "If only there was /nA way to flow back and see /nA lifetime of bliss");
			}
			else if (m.go == true)
			{
				transitionTo(Mountain, "To take to the sky /nOne needs a pure, steadfast heart /nAnd desires to dream");
			}
			else if (f.go == true)
			{
				transitionTo(Forest, "Finding solitude, /nAnd the mirth of the world. /nWhere one lives in peace.");
			}
			else if (b.go == true)
			{
				transitionTo(Flowerbed, "Emotions run high /nIn lands of great memory. /nA world stands waiting.");
			}
			else if (c.go == true)
			{
				transitionTo(Castle, "Magnificent lands /nLive only with great belief /nWalls rise high in awe.");
			}
			else if (v.go == true)
			{
				transitionTo(Void, "A final frontier /nInk erased by steady hands... /nNightmares come to life.");
			}
			else
			{
				transitionFrom();
			}
		}
		public function transitionFrom():void
		{
			if (spd >=2)
			{
				if (created == false)
				{
					chooseLevel = new FadeTextLong("Use " + Key.name(Input.keys("up")[0]) + ", " + Key.name(Input.keys("down")[0]) + ", " + Key.name(Input.keys("left")[0]) + ", and " + Key.name(Input.keys("right")[0]) + "," + " to navigate the map.", false, 320, 490, true);
					goBack = new FadeText("Press " + Key.name(Input.keys("special")[0]) + " to return to the title screen", false, 320, 520, true);
					FP.world.add(goBack);
					FP.world.add(chooseLevel);
					created = true;
				}
				spd = 2;
				return;
			}
			spd += FP.elapsed;
			transImage.alpha = transFactor - spd;
			
		}
		public function transitionTo(worldTo:Class, poem:String):void
		{
			goBack.fadeOut();
			chooseLevel.fadeOut();
			spd -= FP.elapsed;
			transImage.alpha = transFactor - spd;
			if (spd <= 0 && spd > -500)
			{
				spd = -600;
				transPoem = new FadeText(poem);
				transPoem.settxt(poem);
				add(transPoem);
				if (transPoem.txt.text == "")
				{
					transPoem.deleted = true;
				}
			}
			if (spd < -500)
			{
			if (transPoem.deleted == true)
				{
					FP.world = new worldTo;
				}
			}
		}
	}
}