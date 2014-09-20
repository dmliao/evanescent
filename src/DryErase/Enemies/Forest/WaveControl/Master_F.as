package DryErase.Enemies.Forest.WaveControl
{
	import DryErase.Enemies.Forest.Enemies.Boss.FMuon;
	import DryErase.Enemies.Forest.Enemies.Boss.FTau;
	import DryErase.Enemies.Forest.Enemies.FCirclerI;
	import DryErase.Enemies.Forest.Enemies.FMonkeyI;
	import DryErase.Enemies.Forest.Enemies.FMonkeyR;
	import DryErase.Enemies.Forest.Enemies.FSpiderI;
	import DryErase.Enemies.Forest.Enemies.FSpiderR;
	import DryErase.Enemies.Forest.Enemies.FStickI;
	import DryErase.Enemies.Forest.Enemies.FUTurnerI;
	import DryErase.Enemies.Forest.Enemies.FWaverI;
	import DryErase.Enemies.Generic.WaveControl.Wave;
	import DryErase.Enemies.Mountain.Enemies.ForPauseM;
	import DryErase.Enemies.River.WaveControl.RMoveInWaveI;
	import DryErase.Enemies.River.WaveControl.RUturnWaveI;
	
	import Worlds.classes.Backgrounds.Forest_Night;
	import Worlds.classes.Forest;
	import Worlds.classes.LevelComplete;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class Master_F extends Entity
	{
		//ALARMS
		public var IAlarm:Number = 100;
		public var OAlarm:Number = 0;
		public var RAlarm:Number = 100;
		
		private var bossTimer:Number = 0;
		private var fadeImage:Image = new Image(Assets.TITLE_BACK);
		private var fadeOut:Entity = new Entity(0,0,fadeImage);
		
		
		//Activation
		public var IActive:Array = new Array(true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true);
		public var RActive:Array = new Array(true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true);
		
		public var OActive:Array = new Array(true, true, true, true, true);
		public static var spidersKilled:Number = 0;
		public static var spiderReset:Boolean = false;
		public var resetted:Boolean = false;
		public static var canCreateBoss:Boolean = false;
		public static var bossDead:Boolean = false;
		public static var reset3:Boolean = false;
		public function Master_F()
		{
			init();
		}
		public function init():void
		{
			IAlarm = 0;
			RAlarm = 0;
			OAlarm = 0;
			
			bossTimer = 0;
			
			IActive = new Array(true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true);
			RActive = new Array(true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true);
			
			OActive = new Array(true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true);
			
			spidersKilled = 0;
			spiderReset = false;
			resetted = false;
			
			canCreateBoss = false;
			bossDead = false;
			reset3 = false;
			
			Main.currentScore = 0;
			Main.currentLevel = "forest";
			
			fadeImage.alpha = 0;
		}
		override public function update():void
		{
			//INCREASE ALARMS
			IAlarm += FP.elapsed;
			RAlarm += FP.elapsed;
			
			OAlarm += FP.elapsed;
			if (IAlarm >= 3 && IActive[0] == true)
			{
				FP.world.add(new FForWaveI00());
				IActive[0] = false;
			}
			if (IAlarm >= 15 && IActive[1] == true)
			{
				FP.world.add(new FCreepWaveI());
				IActive[1] = false;
			}
			if (IAlarm >= 22 && IActive[2] == true)
			{
				FP.world.add(new FSwoopWaveI(true));
				IActive[2] = false;
			}
			if (IAlarm >= 27 && IActive[3] == true)
			{
				FP.world.add(new FSwoopWaveI(false));
				IActive[3] = false;
			}
			if (IAlarm >= 32 && IActive[4] == true)
			{
				FP.world.add(new FCirclerI());
				IActive[4] = false;
			}
			if (IAlarm >= 39 && IActive[5] == true)
			{
				FP.world.add(new RMoveInWaveI());
				IActive[5] = false;
			}
			if (IAlarm >= 45 && IActive[6] == true)
			{
				FP.world.add(new FWaverWaveI(240,true));
				IActive[6] = false;
			}
			if (IAlarm >= 52 && IActive[7] == true)
			{
				FP.world.add(new FWaverWaveI(400,false));
				IActive[7] = false;
			}
			if (IAlarm >= 58 && IActive[8] == true)
			{
				FP.world.add(new FUTurnerWaveI());
				IActive[8] = false;
			}
			if (IAlarm >= 65 && IActive[9] == true)
			{
				FP.world.add(new FSpiderI());
				IActive[9] = false;
			}
			
			if (RAlarm > 3 && RActive[0] == true)
			{
				FP.world.add(new FMonkeyR(true));
				RActive[0] = false;
			}
			if (RAlarm > 13 && RActive[1] == true)
			{
				FP.world.add(new FMonkeyR(false));
				RActive[1] = false;
			}
			if (RAlarm > 21 && RActive[2] == true)
			{
				FP.world.add(new FCreepWaveR());
				RActive[2] = false;
			}
			if (RAlarm > 27 && RActive[3] == true)
			{
				FP.world.add(new FUTurnerWaveR());
				RActive[3] = false;
			}
			if (RAlarm > 34 && RActive[4] == true)
			{
				FP.world.add(new FThrushWaveR());
				RActive[4] = false;
			}
			if (spidersKilled == 1)
			{
				if (spiderReset == false)
				{
					IAlarm = 0;
					RAlarm = 0;
					OAlarm = 0;
					spiderReset = true;
				}
				if (IAlarm > 4 && IActive[10] == true)
				{
					FP.world.add(new FThrushWaveI());
					IActive[10] = false;
				}
				if (IAlarm > 25 && IActive[11] == true)
				{
					FP.world.add(new FStickI(false));
					IActive[11] = false;
				}
				if (IAlarm > 33 && IActive[12] == true)
				{
					FP.world.add(new FStickI(false));
					IActive[12] = false;
				}
				if (IAlarm > 40 && IActive[13] == true)
				{
					FP.world.add(new FCirclerI());
					IActive[13] = false;
				}
				if (IAlarm > 48 && IActive[14] == true)
				{
					FP.world.add(new RMoveInWaveI());
					IActive[14] = false;
				}
				if (IAlarm > 54 && IActive[15] == true)
				{
					FP.world.add(new FCreepWaveI());
					IActive[15] = false;
				}
				if (RAlarm > 5 && RActive[5] == true)
				{
					FP.world.add(new FForWaveR00());
					RActive[5] = false;
				}
				if (RAlarm > 30 && RActive[6] == true)
				{
					FP.world.add(new FUTurnerWaveR());
					RActive[6] = false;
				}
				if (RAlarm > 40 && RActive[7] == true)
				{
					FP.world.add(new FWaverWaveR(200,true));
					RActive[7] = false;
				}
				if (RAlarm > 48 && RActive[8] == true)
				{
					FP.world.add(new FWaverWaveR(400,false));
					RActive[8] = false;
				}
				if (RAlarm > 56 && RActive[9] == true)
				{
					FP.world.add(new FSpiderR());
					RActive[9] = false;
				}
			}
			
			if (spidersKilled == 2)
			{
				if (spiderReset == false)
				{
					IAlarm = 0;
					RAlarm = 0;
					OAlarm = 0;
				
					spiderReset = true;
					FP.world.add(new Forest_Night());
				}
				if (IAlarm > 3 && IActive[16] == true)
				{
					FP.world.add(new FStickI(true));
					IActive[16] = false;
				}
				if (IAlarm > 9 && IActive[17] == true)
				{
					FP.world.add(new FStickI(false));
					IActive[17] = false;
				}
				if (IAlarm > 16 && IActive[18] == true)
				{
					FP.world.add(new FThrushWaveI());
					IActive[18] = false;
				}
				if (IAlarm > 24 && IActive[19] == true)
				{
					FP.world.add(new FSwoopWaveI(false));
					IActive[19] = false;
				}
				if (IAlarm > 32 && IActive[20] == true)
				{
					FP.world.add(new FSwoopWaveI(true));
					IActive[20] = false;
				}
				if (IAlarm > 38 && IActive[21] == true)
				{
					FP.world.add(new FSpiderI());
					IActive[21] = false;
				}
				if (RAlarm > 2 && RActive[10] == true)
				{
					FP.world.add(new FForWaveR00());
					RActive[10] = false;
				}
				if (RAlarm > 7 && RActive[11] == true)
				{
					FP.world.add(new FSwoopWaveR(false));
					RActive[11] = false;
				}
				if (RAlarm > 11 && RActive[12] == true)
				{
					FP.world.add(new FSwoopWaveR(true));
					RActive[12] = false;
				}
				if (RAlarm > 16 && RActive[13] == true)
				{
					FP.world.add(new FSwoopWaveR(true));
					FP.world.add(new FSwoopWaveR(false));
					RActive[13] = false;
				}
				if (RAlarm > 22 && RActive[14] == true)
				{
					FP.world.add(new FWaverWaveR(240,true));
					RActive[14] = false;
				}
				if (RAlarm > 28 && RActive[15] == true)
				{
					FP.world.add(new FWaverWaveR(400,false));
					RActive[15] = false;
				}
			}
			
			if (spidersKilled == 3)
			{
				if (spiderReset == false)
				{
					IAlarm = 0;
					RAlarm = 0;
					OAlarm = 0;
					spiderReset = true;
				}
				if (IAlarm > 3 && IActive[22] == true)
				{
					FP.world.add(new FCreepWaveI());
					IActive[22] = false;
				}
				if (IAlarm > 8 && IActive[23] == true)
				{
					FP.world.add(new FMonkeyI(false));
					IActive[23] = false;
				}
				if (IAlarm > 14 && IActive[24] == true)
				{
					FP.world.add(new FMonkeyI(true));
					IActive[24] = false;
				}
				if (RAlarm > 5 && RActive[16] == true)
				{
					FP.world.add(new FThrushWaveR());
					RActive[16] = false;
				}
				if (RAlarm > 12 && RActive[17] == true)
				{
					FP.world.add(new ForPauseM(120 + (Math.random()*400),-72));
					RActive[17] = false;
				}
				if (RAlarm > 18 && RActive[18] == true)
				{
					FP.world.add(new FSpiderR());
					RActive[18] = false;
				}
				
			}
			
			if (spidersKilled == 4)
			{
				if (spiderReset == false)
				{
					IAlarm = 0;
					RAlarm = 0;
					OAlarm = 0;
					spiderReset = true;
					canCreateBoss = true;
				}
				
			}
			
			if (canCreateBoss == true)
			{
				FP.world.add(new FBossControl());
				Forest_Night.sunrise = true;
				
				canCreateBoss = false;
			}
			
			
			
			if (bossDead)
			{
				if (reset3 == false)
				{
					SoundManager.currentMusic = SoundManager.musicVictory;
					FP.world.add(fadeOut);
					reset3 = true;
				}
				bossTimer += FP.elapsed;
				fadeOut.layer = -9999999999;
				fadeImage.alpha = bossTimer / 5;
				if (bossTimer > 7)
				{
					FP.world = new LevelComplete();
				}
			}
			
			if (bossDead)
			{
				if (reset3 == false)
				{
					FP.world.add(fadeOut);
					reset3 = true;
					
					SoundManager.currentMusic = SoundManager.musicVictory;
					
				}
				bossTimer += FP.elapsed;
				fadeOut.layer = -9999999999;
				fadeImage.alpha = bossTimer / 5;
				if (bossTimer > 7)
				{
					
					FP.world = new LevelComplete();
				}
			}
		}
		
	}
}