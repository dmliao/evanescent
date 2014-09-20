package DryErase.Enemies.Generic.WaveControl
{
	import DryErase.Cutscenes.FadeText;
	import DryErase.Cutscenes.FinalScene;
	import DryErase.Cutscenes.SceneEntity;
	import DryErase.Cutscenes.Textbox;
	import DryErase.Cutscenes.Textbox2;
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Castle.WaveControl.CBowWaveI;
	import DryErase.Enemies.Castle.WaveControl.CBowWaveR;
	import DryErase.Enemies.Castle.WaveControl.CJetWaveImag;
	import DryErase.Enemies.Castle.WaveControl.CJetWaveReal;
	import DryErase.Enemies.Flower.Enemies.BFlowerBHI;
	import DryErase.Enemies.Flower.Enemies.BFlowerBHR;
	import DryErase.Enemies.Flower.Enemies.BHummingBirdR;
	import DryErase.Enemies.Flower.WaveControl.BFlowerWaveI;
	import DryErase.Enemies.Flower.WaveControl.BForWaveI00;
	import DryErase.Enemies.Flower.WaveControl.BJetSprayI;
	import DryErase.Enemies.Flower.WaveControl.BJetSprayR;
	import DryErase.Enemies.Flower.WaveControl.BJetWaveR;
	import DryErase.Enemies.Flower.WaveControl.BRushSprayI;
	import DryErase.Enemies.Flower.WaveControl.BThrushWaveR00;
	import DryErase.Enemies.Forest.Enemies.FMonkeyR;
	import DryErase.Enemies.Forest.Enemies.FSpiderI;
	import DryErase.Enemies.Forest.Enemies.FUTurnerI;
	import DryErase.Enemies.Forest.WaveControl.FCreepWaveI;
	import DryErase.Enemies.Forest.WaveControl.FForWaveR00;
	import DryErase.Enemies.Forest.WaveControl.FSwoopWaveI;
	import DryErase.Enemies.Forest.WaveControl.FThrushWaveR;
	import DryErase.Enemies.Forest.WaveControl.FUTurnerWaveI;
	import DryErase.Enemies.Forest.WaveControl.FUTurnerWaveR;
	import DryErase.Enemies.Forest.WaveControl.FWaverWaveR;
	import DryErase.Enemies.Generic.PauseEnemy;
	import DryErase.Enemies.Mountain.Enemies.BirdM;
	import DryErase.Enemies.Mountain.WaveControl.MArcWave_I01;
	import DryErase.Enemies.Mountain.WaveControl.MDragonR_Left;
	import DryErase.Enemies.Mountain.WaveControl.MDragonR_Right;
	import DryErase.Enemies.Mountain.WaveControl.MDragon_Left;
	import DryErase.Enemies.Mountain.WaveControl.MDragon_Right;
	import DryErase.Enemies.Mountain.WaveControl.MForPausEwave_I00;
	import DryErase.Enemies.Mountain.WaveControl.MForWave_I03;
	import DryErase.Enemies.Mountain.WaveControl.MForWave_R02;
	import DryErase.Enemies.Mountain.WaveControl.MSwoopWave_I04;
	import DryErase.Enemies.River.Enemies.RTriRotatorR;
	import DryErase.Enemies.River.Enemies.RTurtleI;
	import DryErase.Enemies.River.WaveControl.RArcWave_I;
	import DryErase.Enemies.River.WaveControl.RArcWave_R;
	import DryErase.Enemies.River.WaveControl.RCrawlWaveR;
	import DryErase.Enemies.River.WaveControl.RFlyingFish;
	import DryErase.Enemies.River.WaveControl.RForThreeWave_I00;
	import DryErase.Enemies.River.WaveControl.RLadyWaveR;
	import DryErase.Enemies.River.WaveControl.RLilypadWaveR;
	import DryErase.Enemies.River.WaveControl.RMoveInWaveI;
	import DryErase.Enemies.River.WaveControl.RSwoopWaveI;
	import DryErase.Enemies.River.WaveControl.RSwoopWaveR;
	import DryErase.Enemies.River.WaveControl.RUturnWaveR;
	import DryErase.Enemies.Void.Enemies.boss.VTree;
	import DryErase.Enemies.Void.WaveControl.VBossControl;
	import DryErase.Hero.Listener;
	
	import Worlds.classes.LevelComplete;
	import Worlds.classes.Title.WorldMap;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class Master_T extends Entity
	{
		//ALARMS
		public var IAlarm:Number = 0;
		public var OAlarm:Number = 0;
		public var RAlarm:Number = 0;
		
		private var bossTimer:Number = 0;
		private var fadeImage:Image = new Image(Assets.TITLE_BACK);
		private var fadeOut:Entity = new Entity(0,0,fadeImage);
		
		//Activation
		public var IActive:Array = new Array(true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true);
		public var RActive:Array = new Array(true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true);
		
		public var OActive:Array = new Array(true, true, true, true, true, true, true, true, true, true, true, true, true, true, true);
		public static var canCreateBoss:Boolean = false;
		public static var bossDead:Boolean = false;
		public static var reset3:Boolean = false;
		
		public var sceneNumber:Number = 0;
		public var currentEntity:SceneEntity;
		
		
		public var listenerNormal:Image = new Image(Assets.PORTRAIT_LISTENER_NORMAL);
		public var listenerShocked:Image = new Image(Assets.PORTRAIT_LISTENER_SHOCKED);
		public var storyteller:Image = new Image(Assets.PORTRAIT_STORYTELLER);
		
		
		public var count:Boolean = false;
		public function Master_T()
		{
			currentEntity = new FadeText("dar");
			
			init();
		}
		public function init():void
		{
			IAlarm = 0;
			RAlarm = 0;
			OAlarm = 0;
			
			Listener.canSwitchFields = false;
			
			if (Main.isArcade == true)
			{
				sceneNumber = 2;
			}
			else
			{
				sceneNumber = 0;
			}
			bossTimer = 0;
			
			IActive = new Array(true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true);
			RActive = new Array(true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true);
			
			OActive = new Array(true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true);
			
			canCreateBoss = false;
			bossDead = false;
			reset3 = false;
			
			Main.currentScore = 0;
			Main.currentLevel = "void";
			
			fadeImage.alpha = 0;
			
		}
		override public function update():void
		{
			//INCREASE ALARMS
			IAlarm += FP.elapsed;
			RAlarm += FP.elapsed;
			OAlarm += FP.elapsed;
			if (currentEntity.deleted == true && count == false)
			{
				sceneNumber += 1;
				IAlarm = 0;
				RAlarm = 0;
				OAlarm = 0;
				count = true;
			}
			if (sceneNumber == 0)
			{
				if (OAlarm >= 1 && OActive[0] == true)
				{
					Listener.canSwitchFields = false;
					
					currentEntity = new Textbox2(-54,320,"Hey! What's going on?! Where am I, and what did you do?",listenerShocked);
					FP.world.add(currentEntity);
					OActive[0] = false;
					count = false;
				}
			}
			if (sceneNumber == 1)
			{
				if (OAlarm >= 1 && OActive[1] == true)
				{
					currentEntity = new Textbox2(32,320,"I am the Storyteller, and you are the Listener. This is my world...the world you said you wanted to see. Is this not what you expected? You seem to be fine...",storyteller,true);
					FP.world.add(currentEntity);
					OActive[1] = false;
					count = false;
				}
			}
			if (sceneNumber == 2)
			{
				if (OAlarm >= 1 && OActive[4] == true)
				{
					currentEntity = new Textbox2(32,320,"...although you look a little lost, so I might as well show you around. First things first: Use the <Arrow Keys> to move. Unless you've changed it somehow when I wasn't looking.",storyteller, true);
					FP.world.add(currentEntity);
					count = false;
					OActive[4] = false;
				}
				
			}
			if (sceneNumber == 3)
			{
				if (OAlarm >= 1 && OActive[2] == true)
				{
					currentEntity = new Textbox2(32,320,"Ah, just disregard my last statement. It has nothing to do with anything. Anyways, use <" + Key.name(Input.keys("shoot")[0]) + "> to shoot. Try it out.",storyteller, true);
					FP.world.add(currentEntity);
					
					OActive[2] = false;
				}
				
				if (IAlarm > 3 && IActive[0] == true)
				{
					FP.world.add(new PauseEnemy(new Image(Assets.MX_WING_IMAG), new Image(Assets.MX_WING_IMAG), 1, 6, 50, new Bullet(), 2, 270, 200, 200, 100, 100, 5, 100));
					IActive[0] = false;
					count = false;
				}
				
			}
			if (sceneNumber == 4)
			{
				if (OAlarm >= 1 && OActive[3] == true)
				{
					currentEntity = new Textbox2(-54,320,"Shooting things? Isn't that a little violent for a world like yours?",listenerNormal);
					FP.world.add(currentEntity);
					OActive[3] = false;
					count = false;
				}
			}
			if (sceneNumber == 5)
			{
				if (OActive[5] == true)
				{
					currentEntity = new Textbox2(32,320,"I never said this world wasn't violent. And that is not the only weapon you have, either. Press <" + Key.name(Input.keys("special")[0]) + "> to use a more powerful special attack.",storyteller,true);
					FP.world.add(currentEntity);
					count = false;
					OActive[5] = false;
				}
			}
			if (sceneNumber == 6)
			{
				if (OActive[6] == true)
				{
					currentEntity = new Textbox2(32,320,"Don't waste the special attack, though, as it uses up some energy. Remaining energy is found on the bar on the upper right. Why don't you try it out?",storyteller,true);
					FP.world.add(currentEntity);
					OActive[6] = false;
					
				}
				if (IAlarm > 3 && IActive[1] == true)
				{
					FP.world.add(new PauseEnemy(new Image(Assets.MX_WING_IMAG), new Image(Assets.MX_WING_IMAG), 1, 6, 50, new Bullet(), 2, 270, 200, 200, 100, 100, 5, 100,320,-64));
					IActive[1] = false;
				}
				if (IAlarm > 4 && IActive[2] == true)
				{
					FP.world.add(new PauseEnemy(new Image(Assets.MX_WING_IMAG), new Image(Assets.MX_WING_IMAG), 1, 6, 50, new Bullet(), 2, 270, 200, 200, 100, 100, 5, 100,200,-64));
					
					FP.world.add(new PauseEnemy(new Image(Assets.MX_WING_IMAG), new Image(Assets.MX_WING_IMAG), 1, 6, 50, new Bullet(), 2, 270, 200, 200, 100, 100, 5, 100,640-200,-64));
					IActive[2] = false;
					count = false;
				}
				
			}
			if (sceneNumber == 7)
			{
				if (OActive[7] == true)
				{
					currentEntity = new Textbox2(32,320,"Oh, yeah. One last thing. My world is bigger than what I showed you so far...there's another realm atop it. I'll let you explore this second world now...this world of color.",storyteller,true);
					FP.world.add(currentEntity);
					OActive[7] = false;
					count = false;
				}
				
			}
			if (sceneNumber == 8)
			{
				if (OActive[8] == true)
				{
					currentEntity = new Textbox2(32,320,"After I'm done talking, press <"  + Key.name(Input.keys("start")[0]) + "> to switch worlds. Enemies in the world that you are not currently in can't touch you, but you can't hit them either.", storyteller, true);
					FP.world.add(currentEntity);
					count = false;
					OActive[8] = false;
				}
				
			}
			if (sceneNumber == 9)
			{
				Listener.canSwitchFields = true;
				if (RAlarm > 3 && RActive[0] == true)
				{
					FP.world.add(new PauseEnemy(new Image(Assets.MX_WING_REAL), new Image(Assets.MX_WING_IMAG), 1, 6, 50, new Bullet(), 2, 270, 200, 200, 100, 100, 5, 100,320,-64,true));
					RActive[0] = false;
					count = false;
				}
			}
			if (sceneNumber == 10)
			{
				if (OActive[10] == true && OAlarm > 4)
				{
					Listener.canSwitchFields = false;
					currentEntity = new Textbox2(-64,320,"Switching worlds? Shooting things? What kind of a world are you making here?", listenerShocked);
					FP.world.add(currentEntity);
					count = false;
					OActive[10] = false;
				}
				
			}
			if (sceneNumber == 11)
			{
				if (OActive[11] == true && OAlarm > 1)
				{
					currentEntity = new Textbox2(32,320,"A world that's been covered in evil. Five mirror shards need to be collected to restore balance to this world...and you are its hero.", storyteller, true);
					FP.world.add(currentEntity);
					count = false;
					OActive[11] = false;
				}
				
			}
			if (sceneNumber == 12)
			{
				if (OActive[12] == true && OAlarm > 1)
				{
					currentEntity = new Textbox2(32,320,"Welcome.", storyteller, true);
					FP.world.add(currentEntity);
					count = false;
					OActive[12] = false;
				}
				
			}
			if (sceneNumber == 13)
			{
				if (canCreateBoss == false)
				{
				FP.world.addGraphic(fadeImage,-9999999999);
				canCreateBoss = true;
				}
				fadeImage.alpha += 0.05;
				Main.introPassed = true;
				Main.saveGame();
				FP.world = new WorldMap();
			}
			
		}
	}
}