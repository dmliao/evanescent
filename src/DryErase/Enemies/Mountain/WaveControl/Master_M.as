package DryErase.Enemies.Mountain.WaveControl 
{
	import DryErase.Cutscenes.BossScene;
	import DryErase.Enemies.Mountain.Enemies.BirdM;
	import DryErase.Enemies.Mountain.Enemies.BossM;
	import DryErase.Enemies.Mountain.Enemies.DiagEnemy2M;
	import DryErase.Enemies.Mountain.Enemies.DiagEnemyM;
	import DryErase.Enemies.Mountain.Enemies.MinibossM;
	import DryErase.Enemies.Specific.Dragon;
	import DryErase.Hero.Coin;
	
	import Worlds.classes.Backgrounds.Mountain_Cave;
	import Worlds.classes.Backgrounds.Transition;
	import Worlds.classes.LevelComplete;
	import Worlds.classes.Mountain;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	/**
	 * ...
	 * @author 
	 */
	public class Master_M extends Entity
	{
		
		
		//ALARMS
		public var IAlarm:Number = 0;
		public var OAlarm:Number = 0;
		public var RAlarm:Number = 0;
		
		private var bossTimer:Number = 0;
		private var fadeImage:Image = new Image(Assets.TITLE_BACK);
		private var fadeOut:Entity = new Entity(0,0,fadeImage);
		
		//Activation
		public var IActive:Array = new Array(true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true);
		public var RActive:Array = new Array(true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true);
		
		public var OActive:Array = new Array(true, true, true, true, true);
		public static var minibossKilled:Boolean = false;
		public var resetted:Boolean = false;
		public static var canCreateBoss:Boolean = true;
		public static var bossDead:Boolean = false;
		public static var reset3:Boolean = false;
		//misc
		public var cave:Entity = new Entity(0, -1000, new Image(Assets.cave));
		
		public function Master_M() 
		{
			x = 0;
			y = 0;
			//visible = false;
			
			
			
			init();
		}
		
		public function init():void
		{
			IAlarm = 0;
			RAlarm = 0;
			OAlarm = 0;
			
			bossTimer = 0;
			
			IActive = new Array(true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true);
			RActive = new Array(true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true);
			
			OActive = new Array(true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true);
			
			minibossKilled = false;
			resetted = false;
			
			canCreateBoss = false;
			bossDead = false;
			reset3 = false;
			
			Main.currentScore = 0;
			Main.currentLevel = "mountain";
			
			fadeImage.alpha = 0;
		}
		override public function update():void
		{
			//INCREASE ALARMS
			IAlarm += FP.elapsed;
			RAlarm += FP.elapsed;
			
			//ACTUAL ACTIONS
			
			if (IAlarm >= 2 && IActive[0] == true)
			{
				FP.world.add(new MForPausEwave_I00());
				IActive[0] = false;
			}
			
			if (IAlarm >= 10 && IActive[1] == true)
			{
				FP.world.add(new MArcWave_I01());
				IActive[1] = false;
			}
			if (IAlarm >= 15 && IActive[2] == true)
			{
				FP.world.add(new MForWave_I02());
				IActive[2] = false;
			}
			if (IAlarm >= 24 && IActive[3] == true)
			{
				FP.world.add(new MArcWave_I01());
				IActive[3] = false;
			}
			if (IAlarm >= 38 && IActive[4] == true)
			{
				FP.world.add(new DiagEnemyM(true, false));
				IActive[4] = false;
			}
			if (IAlarm >= 43 && IActive[5] == true)
			{
				FP.world.add(new DiagEnemyM(false, false));
				IActive[5] = false;
			}
			if (IAlarm >= 48 && IActive[6] == true)
			{
				FP.world.add(new MForWave_I03());
				IActive[6] = false;
			}
			if (IAlarm >= 50 && IActive[7] == true)
			{
				FP.world.add(new BirdM());
				IActive[7] = false;
			}
			
			if (IAlarm >= 75 && IActive[18] == true)
			{
				FP.world.add(new MForPausEwave_I00());
				IActive[18] = false;
			}
			
			if (IAlarm >= 84 && IActive[8] == true)
			{
				FP.world.add(new MinibossM());
				IActive[8] = false;
			}
			
			
			
			if (RAlarm >= 1 && RActive[0] == true)
			{
				FP.world.add(new MForWave_R01());
				RActive[0] = false;
			}
			if (RAlarm >= 32 && RActive[1] == true)
			{
				FP.world.add(new MSwoopWave_I04(true,true));
				RActive[1] = false;
			}
			if (RAlarm >= 34 && RActive[2] == true)
			{
				FP.world.add(new MSwoopWave_I04(false,true));
				RActive[2] = false;
			}
			if (RAlarm >= 37 && RActive[3] == true)
			{
				FP.world.add(new MSwoopWave_I04(true,true));
				FP.world.add(new MSwoopWave_I04(false,true));
				RActive[3] = false;
			}
			if (RAlarm >= 43 && RActive[4] == true)
			{
				FP.world.add(new MForPauseWave_R00());
				RActive[4] = false;
			}
			if (RAlarm >= 47 && RActive[5] == true)
			{
				FP.world.add(new DiagEnemy2M(true, true));
				RActive[5] = false;
			}
			if (RAlarm >= 52 && RActive[6] == true)
			{
				FP.world.add(new DiagEnemy2M(false, true));
				RActive[6] = false;
			}
			if (RAlarm >= 60 && RActive[7] == true)
			{
				FP.world.add(new MSideWave_R04(true,true));
				RActive[7] = false;
			}
			if (RAlarm >= 64 && RActive[8] == true)
			{
				FP.world.add(new MSideWave_R04(false,true));
				RActive[8] = false;
			}
			if (RAlarm >= 70 && RActive[9] == true)
			{
				FP.world.add(new MSwoopWave_I04(true,true));
				RActive[9] = false;
			}
			if (RAlarm >= 72 && RActive[10] == true)
			{
				FP.world.add(new MSwoopWave_I04(false,true));
				RActive[10] = false;
			}
			if (RAlarm >= 76 && RActive[11] == true)
			{
				FP.world.add(new MSwoopWave_I04(true,true));
				FP.world.add(new MSwoopWave_I04(false,true));
				RActive[11] = false;
			}
			
			if (IAlarm >= 90 && RAlarm >= 90 && minibossKilled == true)
			{
				if (resetted == false)
				{
					FP.world.add(new MForPausEwave_I00());
					resetted = true;
					IAlarm = 0;
					RAlarm = 0;
					cave.layer = -99999;
					cave.y = -720;
					
				}
			}
			if (resetted == true)
			{
				if (IAlarm >= 10 && IActive[9] == true)
				{
				//	FP.world.add(new MRockWave());
					IActive[9] = false;
				}
				
				if (IAlarm > 34 && IActive[10] == true)
				{
					FP.world.add(new BirdM());
					FP.world.add(new MArcWave_I01());
					IActive[10] = false;
				}
				if (IAlarm >= 52 && IActive[11] == true)
				{
					FP.world.add(new DiagEnemyM(true, false));
					IActive[11] = false;
				}
				if (IAlarm >= 57 && IActive[12] == true)
				{
					FP.world.add(new DiagEnemyM(false, false));
					IActive[12] = false;
				}
				if (IAlarm >= 63 && IActive[13] == true)
				{
					FP.world.add(new MForPausEwave_I00());
					IActive[13] = false;
				}
				if (IAlarm >= 69 && IActive[14] == true)
				{
					FP.world.add(new MForPausEwave_I00());
					IActive[14] = false;
				}
				if (IAlarm > 75 && IActive[15] == true)
				{
					FP.world.add(new MDragon_Left(false));
					IActive[15] = false;
				}
				if (IAlarm > 82 && IActive[16] == true)
				{
					FP.world.add(new MDragon_Right(false));
					IActive[16] = false;
				}
				if (IAlarm > 89 && IActive[17] == true)
				{
					canCreateBoss = true;
					IActive[17] = false;
				}
				if (RAlarm >= 28 && RActive[12] == true)
				{
					FP.world.add(new MForWave_R02());
					
					RActive[12] = false;
				}
				if (RAlarm >= 47 && RActive[13] == true)
				{
					FP.world.add(new MSideWave_R04(true,true));
					FP.world.add(new MSideWave_R04(false,true));
					RActive[13] = false;
				}
				if (RAlarm >= 53 && RActive[14] == true)
				{
					FP.world.add(new MDragonR_Right(true));
					
					RActive[14] = false;
				}
				if (RAlarm >= 60 && RActive[16] == true)
				{
					FP.world.add(new MDragonR_Left(true));
					
					RActive[16] = false;
				}
				
			}
			
			
			//OBJECTS ALARMS
			if (resetted == true)
			{
				OAlarm += FP.elapsed;
				if (OAlarm > 5 && OActive[0] == true)
				{
					FP.world.add(cave);
					OActive[0] = false;
				}
				else if (OActive[0] == false)
				{
					cave.y += 2 * Main.frameRate * FP.elapsed;
				}
				if (OAlarm > 7 && OActive[1] == true)
				{
					FP.world.add(new Transition(0,-1000));
					FP.world.add(new Mountain_Cave(0,-2000));
					OActive[1] = false;
				}
				if (OAlarm > 12)
				{
					Mountain.overMountains = false;	
					
				}
			}
			
			
			if (canCreateBoss == true)
			{
				FP.world.add(new MBossControl());
				
				
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
			
		}
	}

}