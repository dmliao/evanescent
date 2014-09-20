package DryErase.Enemies.Void.WaveControl
{
	import DryErase.Cutscenes.FadeText;
	import DryErase.Cutscenes.FinalScene;
	import DryErase.Cutscenes.SceneEntity;
	import DryErase.Cutscenes.Textbox;
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
	
	import Worlds.classes.LevelComplete;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class Master_V extends Entity
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
		public function Master_V()
		{
			currentEntity = new FadeText("dar");
			
			init();
		}
		public function init():void
		{
			IAlarm = 0;
			RAlarm = 0;
			OAlarm = 0;
			
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
				if (OAlarm >= 2 && OActive[0] == true)
				{
					currentEntity = new Textbox(32,320,"Hey, where are you? I'm sorry for hurting you...",listenerNormal);
					FP.world.add(currentEntity);
					OActive[0] = false;
					count = false;
				}
			}
			if (sceneNumber == 1)
			{
				if (OAlarm >= 1 && OActive[1] == true)
				{
					currentEntity = new Textbox(32,320,"What's going on...?",listenerShocked);
					FP.world.add(currentEntity);
					OActive[1] = false;
					count = false;
				}
			}
			if (sceneNumber == 2)
			{
				if (OActive[4] == true)
				{
					currentEntity = new Textbox(130,320,"Why are you the only person that can see me? That can hear me?",storyteller, true);
					count = false;
					OActive[4] = false;
				}
				
				
				if (IAlarm > 3 && IActive[0] == true)
				{
					FP.world.add(new FUTurnerWaveI());
					IActive[0] = false;
				}
				if (IAlarm > 7 && IActive[1] == true)
				{
					FP.world.add(new FSwoopWaveI(false));
					IActive[1] = false;
				}
				if (IAlarm > 14 && IActive[2] == true)
				{
					FP.world.add(new FSwoopWaveI(true));
					IActive[2] = false;
				}
				if (IAlarm > 21 && IActive[3] == true)
				{
					FP.world.add(new FCreepWaveI());
					IActive[3] = false;
				}
				if (IAlarm > 30 && IActive[4] == true)
				{
					FP.world.add(new FSpiderI());
					IActive[4] = false;
				}
				if (IAlarm > 67 && IActive[5] == true)
				{
					FP.world.add(new FSwoopWaveI(false));
					IActive[5] = false;
				}
				if (IAlarm > 74 && IActive[6] == true)
				{
					FP.world.add(new FSwoopWaveI(true));
					IActive[6] = false;
				}
				if (RAlarm > 4 && RActive[0] == true)
				{
					FP.world.add(new FWaverWaveR(240,true));
					RActive[0] = false;
				}
				if (RAlarm > 9 && RActive[1] == true)
				{
					FP.world.add(new FWaverWaveR(400,false));
					RActive[1] = false;
				}
				if (RAlarm > 16 && RActive[2] == true)
				{
					FP.world.add(new FMonkeyR(true));
					RActive[2] = false;
				}
				if (RAlarm > 28 && RActive[3] == true)
				{
					FP.world.add(new FMonkeyR(false));
					RActive[3] = false;
				}
				if (RAlarm > 39 && RActive[4] == true)
				{
					FP.world.add(new FThrushWaveR());
					RActive[4] = false;
				}
				if (RAlarm > 55 && RActive[5] == true)
				{
					FP.world.add(new FUTurnerWaveR());
					RActive[5] = false;
				}
				if (RAlarm > 55 && RActive[6] == true)
				{
					FP.world.add(new FForWaveR00());
					RActive[6] = false;
				}
				if (OActive[9] == true && OAlarm > 81)
				{
					if (Main.isArcade == false)
					{
						FP.world.add(currentEntity);
					}
					else
					{
						currentEntity.deleted = true;
					}
					count = false;
					OActive[9] = false;
				}
			}
			
			if (sceneNumber == 3)
			{
			if (Main.isArcade == true)
			{
				sceneNumber = 5;
			}
			else{
				if (OAlarm >= 2 && OActive[2] == true)
				{
					currentEntity = new Textbox(32,320,"I'm not. Everyone can see you...and listen to your story. But you haven't shown anyone.",listenerNormal);
					FP.world.add(currentEntity);
					OActive[2] = false;
					count = false;
				}
			}
			}
			if (sceneNumber == 4)
			{
				if (OAlarm >= 2 && OActive[3] == true)
				{
					currentEntity = new Textbox(32,320,"You haven't shown anyone you exist.",listenerNormal);
					FP.world.add(currentEntity);
					OActive[3] = false;
					count = false;
				}
			}
			if (sceneNumber == 5)
			{
				if (OActive[5] == true)
				{
				currentEntity = new FadeText("Where does the imagination end, and reality begin?");
				count = false;
				OActive[5] = false;
				}
				if (IAlarm > 3 && IActive[11] == true)
				{
					FP.world.add(new MArcWave_I01());
					IActive[11] = false;
				}
				if (IAlarm > 7 && IActive[12] == true)
				{
					FP.world.add(new MForWave_I03());
					IActive[12] = false;
				}
				if (IAlarm > 20 && IActive[7] == true)
				{
					FP.world.add(new MForPausEwave_I00());
					IActive[7] = false;
				}
				if (IAlarm > 27 && IActive[8] == true)
				{
					FP.world.add(new BirdM());
					IActive[8] = false;
				}
				if (IAlarm > 34 && IActive[9] == true)
				{
					FP.world.add(new MDragon_Left(false));
					IActive[9] = false;
				}
				if (IAlarm > 45 && IActive[10] == true)
				{
					FP.world.add(new MDragon_Right(false));
					IActive[10] = false;
				}
				if (RAlarm > 4 && RActive[7] == true)
				{
					FP.world.add(new MDragonR_Left(true));
					RActive[7] = false;
				}
				if (RAlarm > 15 && RActive[8] == true)
				{
					FP.world.add(new MDragonR_Right());
					RActive[8] = false;
				}
				if (RAlarm > 22 && RActive[9] == true)
				{
					FP.world.add(new MForWave_R02());
					RActive[9] = false;
				}
				if (RAlarm > 28 && RActive[10] == true)
				{
					FP.world.add(new MSwoopWave_I04(true,true));
					RActive[10] = false;
				}
				if (RAlarm > 35 && RActive[11] == true)
				{
					FP.world.add(new MSwoopWave_I04(false,true));
					RActive[11] = false;
				}
				if (OActive[10] == true && OAlarm > 51)
				{
					if (Main.isArcade == false)
					{
						FP.world.add(currentEntity);
					}
					else
					{
						currentEntity.deleted = true;
					}
					count = false;
					OActive[10] = false;
				}
			}
			if (sceneNumber == 6)
			{
				if (OActive[6] == true)
				{
				currentEntity = new FadeText("My life is my story. It's all there ever was.");
				count = false;
				OActive[6] = false;
				}
				if (IAlarm > 3 && IActive[13] == true)
				{
					FP.world.add(new BFlowerBHI());
					IActive[13] = false;
				}
				if (IAlarm > 12 && IActive[14] == true)
				{
					FP.world.add(new BJetSprayI());
					IActive[14] = false;
				}
				if (IAlarm > 20 && IActive[15] == true)
				{
					FP.world.add(new BFlowerWaveI(true));
					IActive[15] = false;
				}
				if (IAlarm > 27 && IActive[16] == true)
				{
					FP.world.add(new BFlowerWaveI(false));
					IActive[16] = false;
				}
				if (IAlarm > 36 && IActive[17] == true)
				{
					FP.world.add(new BRushSprayI());
					IActive[17] = false;
				}
				if (IAlarm > 44 && IActive[18] == true)
				{
					FP.world.add(new BForWaveI00());
					IActive[18] = false;
				}
				if (RAlarm > 9 && RActive[12] == true)
				{
					FP.world.add(new BThrushWaveR00(200,true));
					RActive[12] = false;
				}
				if (RAlarm > 13 && RActive[13] == true)
				{
					FP.world.add(new BThrushWaveR00(440,false));
					RActive[13] = false;
				}
				if (RAlarm > 17 && RActive[14] == true)
				{
					FP.world.add(new BThrushWaveR00(320,true));
					FP.world.add(new BThrushWaveR00(320,false));
					RActive[14] = false;
				}
				if (RAlarm > 20 && RActive[15] == true)
				{
					FP.world.add(new BHummingBirdR());
					RActive[15] = false;
				}
				if (RAlarm > 27 && RActive[16] == true)
				{
					FP.world.add(new BJetWaveR(320));
					RActive[16] = false;
				}
				if (RAlarm > 34 && RActive[17] == true)
				{
					FP.world.add(new BJetSprayR());
					RActive[17] = false;
				}
				
				if (OActive[11] == true && OAlarm > 55)
				{
					if (Main.isArcade == false)
					{
						FP.world.add(currentEntity);
					}
					else
					{
						currentEntity.deleted = true;
					}
					count = false;
					OActive[11] = false;
				}
			}
			if (sceneNumber == 7)
			{
				if (OActive[7] == true)
				{
				currentEntity = new FadeText("It can only end with tragedy...like all dreams.");
				count = false;
				OActive[7]=false;
				}
				if (IAlarm > 3 && IActive[19] == true)
				{
					FP.world.add(new RForThreeWave_I00());
					IActive[19] = false;
				}
				if (IAlarm > 15 && IActive[20] == true)
				{
					FP.world.add(new RFlyingFish());
					IActive[20] = false;
				}
				if (IAlarm > 19 && IActive[21] == true)
				{
					FP.world.add(new RMoveInWaveI());
					IActive[21] = false;
				}
				if (IAlarm > 25 && IActive[22] == true)
				{
					FP.world.add(new RArcWave_I());
					IActive[22] = false;
				}
				if (IAlarm > 32 && IActive[23])
				{
					FP.world.add(new RSwoopWaveI(true));
					IActive[23] = false;
				}
				if (IAlarm > 38 && IActive[24])
				{
					FP.world.add(new RSwoopWaveI(false));
					IActive[24] = false;
				}	
				if (IAlarm > 43 && IActive[25])
				{
					FP.world.add(new RTurtleI(true,false));
					IActive[25] = false;
				}	
				if (IAlarm > 48 && IActive[26])
				{
					FP.world.add(new RTurtleI(false,false));
					IActive[26] = false;
				}	
				if (RAlarm > 4 && RActive[19] == true)
				{
					FP.world.add(new RArcWave_R());
					RActive[19] = false;
				}
				if (RAlarm > 10 && RActive[20] == true)
				{
					FP.world.add(new RLadyWaveR());
					RActive[20] = false;
				}
				if (RAlarm > 17 && RActive[21] == true)
				{
					FP.world.add(new RCrawlWaveR());
					RActive[21] = false;
				}
				if (RAlarm > 20 && RActive[22] == true)
				{
					FP.world.add(new RUturnWaveR());
					RActive[22] = false;
				}
				if (RAlarm > 26 && RActive[23] == true)
				{
					FP.world.add(new RTriRotatorR(320,2,0));
					RActive[23] = false;
				}
				
				if (RAlarm > 36 && RActive[25] == true)
				{
					FP.world.add(new RSwoopWaveR(true));
					RActive[25] = false;
				}
				if (RAlarm > 42 && RActive[26] == true)
				{
					FP.world.add(new RSwoopWaveR(false));
					RActive[26] = false;
				}
				if (RAlarm > 48 && RActive[27] == true)
				{
					FP.world.add(new RSwoopWaveR(false));
					FP.world.add(new RSwoopWaveR(true));
					RActive[27] = false;
				}
				if (OActive[12] == true && OAlarm > 58)
				{
					if (Main.isArcade == false)
					{
						FP.world.add(currentEntity);
					}
					else
					{
						currentEntity.deleted = true;
					}
					count = false;
					OActive[12] = false;
				}
			}
			if (sceneNumber == 8)
			{
				if (OActive[8] == true)
				{
				currentEntity = new FadeText("Evanescent dreams.");
				count = false;
				OActive[8] = false;
				}
				if (RActive[28] == true && RAlarm > 3)
				{
					FP.world.add(new CBowWaveR());
					RActive[28] = false;
				}
				if (IActive[28] == true && IAlarm > 3)
				{
					FP.world.add(new CJetWaveImag());
					IActive[28] = false;
				}
				if (RActive[29] == true && RAlarm > 33)
				{
					FP.world.add(new CJetWaveReal());
					RActive[29] = false;
				}
				if (IActive[29] == true && IAlarm > 33)
				{
					FP.world.add(new CBowWaveI());
					IActive[29] = false;
				}
				if (OActive[14] == true && OAlarm > 66)
				{
					if (Main.isArcade == false)
					{
						FP.world.add(currentEntity);
					}
					else
					{
						currentEntity.deleted = true;
					}
					count = false;
					OActive[14] = false;
				}
				
			}
			if (sceneNumber == 9)
			{
				if (OActive[20] == true && OAlarm > 3)
				{
					currentEntity = new FadeText("Dar");
					count = false;
					OActive[20] = false;
					canCreateBoss = true;
				}
			}
			if (canCreateBoss == true)
			{
				canCreateBoss = false;
				FP.world.add(new VBossControl());
			}
			if (bossDead)
			{
				if (reset3 == false)
				{
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