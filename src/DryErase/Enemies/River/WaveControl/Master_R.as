package DryErase.Enemies.River.WaveControl
{
	import DryErase.Cutscenes.BossScene;
	import DryErase.Enemies.River.Enemies.Boss.RBoss;
	import DryErase.Enemies.River.Enemies.Boss.RShip;
	import DryErase.Enemies.River.Enemies.RLilypadR;
	import DryErase.Enemies.River.Enemies.RTriRotatorI;
	import DryErase.Enemies.River.Enemies.RTriRotatorR;
	import DryErase.Enemies.River.Enemies.RTurtleI;
	import DryErase.Enemies.River.Enemies.RUturnerI;
	import DryErase.Enemies.River.WaveControl.RArcWave_I;
	
	import Worlds.classes.Backgrounds.Transition;
	import Worlds.classes.LevelComplete;
	import Worlds.classes.River;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class Master_R extends Entity
	{
		//ALARMS
		public var IAlarm:Number = 00;
		public var OAlarm:Number = 00;
		public var RAlarm:Number = 00;
		
		private var bossTimer:Number = 0;
		private var fadeImage:Image = new Image(Assets.TITLE_BACK);
		private var fadeOut:Entity = new Entity(0,0,fadeImage);
		
		//Activation
		public var IActive:Array = new Array(true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true);
		public var RActive:Array = new Array(true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true);
		
		public var OActive:Array = new Array(true, true, true, true, true);
		public static var minibossKilled:Boolean = false;
		public var resetted:Boolean = false;
		public static var canCreateBoss:Boolean = true;
		public static var bossDead:Boolean = false;
		public static var reset3:Boolean = false;
		//misc
		
		public var bossScene:BossScene = new BossScene();
		
	
		
		public function Master_R()
		{
			init();
		}
		public function init():void
		{
			IAlarm = 0;
			RAlarm = 0;
			OAlarm = 0;
			
			bossTimer = 0;
			
			IActive = new Array(true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true);
			RActive = new Array(true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true);
			
			OActive = new Array(true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true);
			
			minibossKilled = false;
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
			
			//ACTIONS
			if (IAlarm >= 2 && IActive[0] == true)
			{
				FP.world.add(new RForThreeWave_I00());
				IActive[0] = false;
			}
			if (IAlarm >= 8 && IActive[1] == true)
			{
				FP.world.add(new RMoveInWaveI());
				IActive[1] = false;
			}
			if (IAlarm >= 15 && IActive[2] == true)
			{
				FP.world.add(new RMoveInWaveI());
				IActive[2] = false;
			}
			if (IAlarm >= 22 && IActive[3] == true)
			{
				FP.world.add(new RSideWave_I00(true));
				IActive[3] = false;
			}
			if (IAlarm >= 26 && IActive[4] == true)
			{
				FP.world.add(new RSideWave_I00(false));
				IActive[4] = false;
			}
			if (IAlarm > 32 && IActive[5] == true)
			{
				FP.world.add(new RSideWave_I00(false));
				FP.world.add(new RSideWave_I00(true));
				IActive[5] = false;
			}
			if (IAlarm >  38 && IActive[6] == true)
			{
				FP.world.add(new RUturnWaveI());
				IActive[6] = false;
			}
			if (IAlarm > 40 && IActive[7] == true)
			{
				FP.world.add(new RLilypadWaveI());
				IActive[7] = false;
			}
			if (IAlarm > 50 && IActive[8] == true)
			{
				FP.world.add(new RTriRotatorI(40, 1, 3));
				IActive[8] = false;
			}
			if (IAlarm > 72 && IActive[9] == true)
			{
				FP.world.add(new RFlyingFish());
				IActive[9] = false;
			}
			if (IAlarm >= 90 && IActive[10] == true)
			{
				FP.world.add(new RSideWave_I00(true));
				IActive[10] = false;
			}
			if (IAlarm >= 95 && IActive[11] == true)
			{
				FP.world.add(new RSideWave_I00(false));
				IActive[11] = false;
			}
			if (IAlarm >= 100 && IActive[12] == true)
			{
				FP.world.add(new RArcWave_I())
				IActive[12] = false;
			}
			if (IAlarm > 108 && IActive[13] == true)
			{
				FP.world.add(new RTriRotatorI(40, 1, 3));
				IActive[13] = false;
			}
			if (IAlarm >= 118 && IActive[15] == true)
			{
				FP.world.add(new RArcWave_I())
				IActive[15] = false;
			}
			
			if (IAlarm >= 122 && IActive[16] == true)
			{
				FP.world.add(new RTurtleI(true))
				IActive[16] = false;
			}
			if (IAlarm >= 125 && IActive[17] == true)
			{
				FP.world.add(new RTurtleI(false))
				IActive[17] = false;
			}
			if (IAlarm >= 128 && IActive[18] == true)
			{
				FP.world.add(new RForThreeWave_I00())
				IActive[18] = false;
			}
			
			if (IAlarm >= 148 && IActive[19] == true)
			{
				FP.world.add(new RUturnWaveI());
				IActive[19] = false;
			}
			if (IAlarm >= 174 && IActive[20] == true)
			{
				FP.world.add(new RSwoopWaveI(true));
				IActive[20] = false;
			}
			if (IAlarm >= 180 && IActive[21] == true)
			{
				FP.world.add(new RSwoopWaveI(false));
				IActive[21] = false;
			}
			if (IAlarm >= 186 && IActive[22] == true)
			{
				FP.world.add(new RSwoopWaveI(true));
				FP.world.add(new RSwoopWaveI(false));
				IActive[22] = false;
			}
			if (IAlarm > 200 && IActive[23] == true)
			{
				FP.world.add(new RTriRotatorI(40, 1, 3));
				IActive[23] = false;
			}
			if (IAlarm > 230 && IActive[24] == true)
			{
				FP.world.add(new RLilypadWaveI());
				IActive[24] = false;
			}
			if (IAlarm > 260 && IActive[25] == true)
			{
				FP.world.add(new RUturnerI());
				IActive[25] = false;
			}
			
			if (OAlarm > 160 && OActive[0] == true)
			{
				FP.world.add(new Transition(0,-1000));
				OActive[0] = false;
			}
			if (OAlarm > 167.7 && OActive[1] == true)
			{
				River.icedOver = true;
				Utils.flash.start(0xFFFFFF, 2, 0.7);
				OActive[1] = false;
			}
			
			if (RAlarm > 3 && RActive[1] == true)
			{
				FP.world.add(new RArcWave_R());
				RActive[1] = false;
			}
			if (RAlarm > 7 && RActive[2] == true)
			{
				FP.world.add(new RSwoopWaveR(true));
				RActive[2] = false;
			}
			if (RAlarm > 10 && RActive[3] == true)
			{
				FP.world.add(new RSwoopWaveR(false));
				RActive[3] = false;
			}
			if (RAlarm > 15 && RActive[4] == true)
			{
				FP.world.add(new RLadyWaveR());
				RActive[4] = false;
			}
			if (RAlarm > 18 && RActive[5] == true)
			{
				FP.world.add(new RArcWave_R);
				RActive[5] = false;
			}
			if (RAlarm > 25 && RActive[6] == true)
			{
				FP.world.add(new RCrawlWaveR);
				RActive[6] = false;
			}
			if (RAlarm > 40 && RActive[7] == true)
			{
				FP.world.add(new RTriRotatorR(600,1,3));
				RActive[7] = false;
			}
			if (RAlarm > 60 && RActive[8] == true)
			{
				FP.world.add(new RUturnWaveR());
				RActive[8] = false;
			}
			if (RAlarm > 130 && RActive[0] == true)
			{
				FP.world.add(new RForWave_R00());
				RActive[0] = false;
			}
			if (RAlarm > 175 && RActive[10] == true)
			{
				FP.world.add(new RLilypadWaveR());
				RActive[10] = false;
			}
			if (RAlarm > 188 && RActive[11] == true)
			{
				FP.world.add(new RSwoopWaveR(true));
				RActive[11] = false;
			}
			if (RAlarm > 193 && RActive[12] == true)
			{
				FP.world.add(new RSwoopWaveR(false));
				RActive[12] = false;
			}
			if (RAlarm > 198 && RActive[13] == true)
			{
				FP.world.add(new RShip());
				RActive[13] = false;
			}
			
			if (canCreateBoss == true)
			{
				
				FP.world.add(new RBossControl());
				
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