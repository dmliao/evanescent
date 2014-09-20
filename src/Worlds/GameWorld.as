package Worlds 
{
	/**
	 * ...
	 * @author 
	 */
	import DryErase.Hero.Listener;
	
	import Worlds.classes.Title.TitleWorld;
	import Worlds.classes.Title.WorldMap;
	
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.BmpFont;
	import net.flashpunk.graphics.BmpText;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class GameWorld extends World
		
	{
		
		public static var worldBackground:Backdrop = null;
		
		public static var killStreak:Number;
		public static var highestStreak:Number;
		
		public static var timesDied:Number;
		
		
		public static var focusScreen:Image;
		public static var focusScreen2:Image;
		
		public var fadeIn:Image = new Image(Assets.TITLE_BACK);
		public var fadeEnt:Entity;
		
		public var killTimer:Number = 0;
		
		public var enterCount:Number = 0;
		public function GameWorld()
		{
			fadeEnt = new Entity(0,0,fadeIn);
		
			fadeEnt.layer = -99999999999;
			
			add(fadeEnt);
			
			
			GameWorld.focusScreen = new Image(Assets.FOCUS);
			GameWorld.focusScreen2 = new Image(Assets.FOCUS2);
			
			
			focusScreen.alpha = 0;
			focusScreen2.alpha = 0;
			init();
			
		//	Utils.flash.start(0xFFFFFF,1, 1);
			
		}
		override public function begin():void
		{
			focusScreen.alpha = 0;
			focusScreen2.alpha = 0;
		}
		public function init():void
		{
			killStreak = 0;
			highestStreak = 0;
			
			enterCount = 0;
			
			timesDied = 0;
		}
		override public function update():void
		{
			fadeIn.alpha -=0.01;
			if (Input.pressed("pause")) //Pause or unpause the game
			{
				Main.paused = !Main.paused;
		//		Main.focused = !Main.focused;
				
			}
			if (Input.mousePressed)
			{
				Main.paused = false;
				enterCount  0;
			}
			if (Main.focused == false)
			{
				focusScreen.alpha =0.8;
				focusScreen2.alpha = 0;
				enterCount  0;
			}
			else if (Main.paused == true && Main.focused == true)
			{
				focusScreen2.alpha =0.8;
				focusScreen.alpha = 0;
				
				if (Input.pressed("skipCutscene"))
				{
					enterCount += 1;
					if (enterCount == 1)
					{
						
					}
					if (enterCount == 2)
					{
						Main.paused = false;
						if (Main.currentLevel == "endless")
						{
							FP.world = new TitleWorld();
						}
						else
						{
							FP.world = new WorldMap();
						}
					}
				}
			}
			else
			{
				focusScreen.alpha =0;
				focusScreen2.alpha = 0;
				super.update();
				//pausedText.alpha = 0;
				enterCount  0;
			}
			
			if (killStreak > highestStreak)
			{
				highestStreak = killStreak;
			}
			if (Listener.killed == true)
			{
				killTimer+= FP.elapsed;
				if (killTimer > 2)
				{
					FP.world.add(new Listener());
					killTimer = 0;
					Listener.killed = false;
					timesDied += 1;
				}
			}
		}
		
		override public function render():void
		{
		
			super.render();
			focusScreen.render(FP.buffer, new Point(0, 0), FP.camera);
			focusScreen2.render(FP.buffer, new Point(0, 0), FP.camera);
			
		}
		override public function end():void
		{
			super.end();
			removeAll();
			worldBackground = null;
			
			focusScreen = null;
			focusScreen2 = null;
			
			fadeIn = null;
			fadeEnt = null;
		}
		
	}

}