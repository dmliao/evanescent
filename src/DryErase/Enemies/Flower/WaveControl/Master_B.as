package DryErase.Enemies.Flower.WaveControl
{
	import DryErase.Cutscenes.BossScene;
	import DryErase.Enemies.Flower.Enemies.BCreepR;
	import DryErase.Enemies.Flower.Enemies.BFlowerBHI;
	import DryErase.Enemies.Flower.Enemies.BFlowerBHI2;
	import DryErase.Enemies.Flower.Enemies.BFlowerBHR;
	import DryErase.Enemies.Flower.Enemies.BHummingBirdI;
	import DryErase.Enemies.Flower.Enemies.BHummingBirdR;
	import DryErase.Enemies.Flower.Enemies.BMinibossR;
	import DryErase.Enemies.Flower.WaveControl.BBossControl;
	
	import Worlds.classes.Flowerbed;
	import Worlds.classes.LevelComplete;
	
	import com.oaxoa.fx.Branch;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class Master_B extends Entity
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
		public var RActive:Array = new Array(true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true);
		
		public var OActive:Array = new Array(true, true, true, true, true);
		public static var minibossKilled:Boolean = false;
		public var resetted:Boolean = false;
		public var reset2:Boolean = false;
		public static var canCreateBoss:Boolean = false;
		public static var bossDead:Boolean = false;
		public static var reset3:Boolean = false;
		
		public static var canBurn:Boolean = false;
		//misc
		
		/*
		FP.world.add(new BFlowerBHI2(120));
		FP.world.add(new BFlowerBHI2(520));
		*/
		private var activate:Boolean = false;
		public var bossScene:BossScene = new BossScene();
		public function Master_B()
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
			
			minibossKilled = false;
			resetted = false;
			
			canCreateBoss = false;
			bossDead = false;
			reset3 = false;
			
			canBurn = false;
			
			Main.currentScore = 0;
			Main.currentLevel = "flower";
			
			fadeImage.alpha = 0;
			
			activate = false;
			
		}
		override public function update():void
		{
			//INCREASE ALARMS
			IAlarm += FP.elapsed;
			RAlarm += FP.elapsed;
			
			OAlarm += FP.elapsed;
			
			//ACTIONS
			
			if (IAlarm >= 3 && IActive[0] == true)
			{
				FP.world.add(new BRushSprayI());
				IActive[0] = false;
			}
			if (IAlarm >= 22 && IActive[1] == true)
			{
				FP.world.add(new BFlowerWaveI(true));
				IActive[1] = false;
			}
			if (IAlarm >= 31 && IActive[2] == true)
			{
				FP.world.add(new BFlowerWaveI(false));
				IActive[2] = false;
			}
			if (IAlarm >= 40 && IActive[3] == true)
			{
				FP.world.add(new BFlowerBHI());
				IActive[3] = false;
			}
			if (IAlarm >= 54 && IActive[4] == true)
			{
				FP.world.add(new BForWaveI00());
				IActive[4] = false;
			}
			if (IAlarm >= 62 && IActive[5] == true)
			{
				FP.world.add(new BHummingBirdI());
				IActive[5] = false;
			}
			if (IAlarm >= 67 && IActive[6] == true)
			{
				FP.world.add(new BJetSprayI());
				IActive[6] = false;
			}
			if (IAlarm >= 90 && IActive[7] == true)
			{
				FP.world.add(new BRushSprayI());
				IActive[7] = false;
			}
			
			if (RAlarm >= 20 && RActive[0] == true)
			{
				FP.world.add(new BThrushWaveR00(240,true));
				RActive[0] = false;
			}
			if (RAlarm >= 29 && RActive[1] == true)
			{
				FP.world.add(new BLadybirdWaveR());
				RActive[1] = false;
			}
			if (RAlarm >= 54 && RActive[2] == true)
			{
				FP.world.add(new BThrushWaveR00(320,false));
				RActive[2] = false;
			}
			if (RAlarm >= 62 && RActive[3] == true)
			{
				FP.world.add(new BThrushWaveR00(100,true));
				FP.world.add(new BThrushWaveR00(520,false));
				RActive[3] = false;
			}
			if (RAlarm >= 71 && RActive[4] == true)
			{
				FP.world.add(new BHummingBirdR());
				RActive[4] = false;
			}
			if (RAlarm >= 80 && RActive[5] == true)
			{
				FP.world.add(new BJetWaveR(340));
				RActive[5] = false;
			}
			if (RAlarm >= 84 && RActive[6] == true)
			{
				FP.world.add(new BThrushWaveR00(84,false));
				RActive[6] = false;
			}
			if (RAlarm >= 94 && RActive[7] == true)
			{
				FP.world.add(new BFlowerWaveR(true));
				RActive[7] = false;
			}
			if (RAlarm >= 102 && RActive[8] == true)
			{
				FP.world.add(new BFlowerWaveR(false));
				RActive[8] = false;
			}
			
			if (RAlarm >= 115 && RActive[20] == true)
			{
				FP.world.add(new BMinibossR());
				RActive[20] = false;
			}
			
			
			//AFTER MINIBOSS KILLED
			if (minibossKilled == true)
			{
				if (resetted == false)
				{
					IAlarm = 0;
					RAlarm = 0;
					resetted = true;
				}
				if (IAlarm > 3 && IActive[8] == true)
				{
					FP.world.add(new BHummingBirdI());
					FP.world.add(new BHummingBirdR());
					IActive[8] = false;
				}
				if (IAlarm > 9 && IActive[9] == true)
				{
					FP.world.add(new BFlowerBHI2(120));
					FP.world.add(new BFlowerBHI2(520));
					IActive[9] = false;
				}
				
				if (IAlarm > 19 && IActive[10] == true)
				{
					FP.world.add(new BFlowerWaveI(true));
					IActive[10] = false;
				}
				if (IAlarm > 26 && IActive[11] == true)
				{
					FP.world.add(new BFlowerWaveI(false));
					IActive[11] = false;
				}
				if (IAlarm > 34 && IActive[12] == true)
				{
					FP.world.add(new BLadybirdWaveI());
					IActive[12] = false;
				}
				if (IAlarm > 40 && IActive[13] == true)
				{
					FP.world.add(new BFlowerBHI());
					IActive[13] = false;
				}
				if (IAlarm > 54 && IActive[14] == true)
				{
					FP.world.add(new BJetSprayI());
					IActive[14] = false;
				}
				
				if (RAlarm > 16 && RActive[10] == true)
				{
					FP.world.add(new BJetSprayR());
					RActive[10] = false;
				}
				if (RAlarm > 30 && RActive[11] == true)
				{
					FP.world.add(new BCreepR(320));
					RActive[11] = false;
				}
				if (RAlarm > 32 && RActive[12] == true)
				{
					FP.world.add(new BCreepR(420));
					RActive[12] = false;
				}
				if (RAlarm > 34 && RActive[13] == true)
				{
					FP.world.add(new BCreepR(220));
					RActive[13] = false;
				}
				if (RAlarm > 39 && RActive[14] == true)
				{
					FP.world.add(new BLadybirdWaveR());
					RActive[14] = false;
				}
				if (RAlarm > 50 && RActive[15] == true)
				{
					FP.world.add(new BHummingBirdR());
					RActive[15] = false;
				}
				if (RAlarm > 58 && RActive[16] == true)
				{
					FP.world.add(new BFlowerBHR());
					RActive[16] = false;
				}
				if (RAlarm > 77 && RActive[17] == true)
				{
					canCreateBoss = true;
					RActive[17] = false;
				}
			}
			
			//BOSS TIME
			if (canBurn == true)
			{
				if (activate == false)
				{
					Utils.flash.start(0xFFFFFF,1,2);
					activate = true;
				}
			}
			if (canCreateBoss == true)
			{
				canCreateBoss = false;
				FP.world.add(new BBossControl());
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