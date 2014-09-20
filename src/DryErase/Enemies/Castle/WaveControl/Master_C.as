package DryErase.Enemies.Castle.WaveControl
{
	import DryErase.Cutscenes.BossScene;
	import DryErase.Cutscenes.FadeText;
	import DryErase.Cutscenes.SceneEntity;
	import DryErase.Cutscenes.Textbox;
	import DryErase.Enemies.Boss;
	import DryErase.Enemies.Castle.Boss.CHero;
	import DryErase.Enemies.Castle.Boss.CHero_Hand;
	import DryErase.Enemies.Castle.Boss.CHero_ShieldForm;
	import DryErase.Enemies.Castle.Enemies.CBow_Imag;
	import DryErase.Enemies.Castle.Enemies.CBow_Real;
	
	import Worlds.classes.LevelComplete;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;

	public class Master_C extends Entity
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
		public static var canCreateBoss2:Boolean = false;
		public static var bossDead:Boolean = false;
		public static var reset3:Boolean = false;
		//misc
		public var sceneNumber:Number = 0;
		public var currentEntity:SceneEntity;
		public var count:Boolean = false;
		public var bossScene:BossScene = new BossScene();
		
		public var listenerNormal:Image = new Image(Assets.PORTRAIT_LISTENER_NORMAL);
		public var listenerShocked:Image = new Image(Assets.PORTRAIT_LISTENER_SHOCKED);
		public var storyteller:Image = new Image(Assets.PORTRAIT_STORYTELLER);
		public function Master_C()
		{
			currentEntity = new FadeText("dar");
			if (Main.isArcade == true)
			{
				sceneNumber = 3;
			}
			else
			{
				sceneNumber = 0;
			}
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
			canCreateBoss2 = false;
			bossDead = false;
			reset3 = false;
			
			Main.currentScore = 0;
			Main.currentLevel = "castle";
			
			fadeImage.alpha = 0;
			
		}
		override public function update():void
		{
			//INCREASE ALARMS
			IAlarm += FP.elapsed;
			RAlarm += FP.elapsed;
			
			OAlarm += FP.elapsed;
			
			//ACTIONS
			if (currentEntity.deleted == true && count == false)
			{
				sceneNumber += 1;
				IAlarm = -3;
				RAlarm = -3;
				OAlarm = 0;
				count = true;
			}
			if (sceneNumber == 0)
			{
				if (OAlarm >= 2 && OActive[0] == true)
				{
					currentEntity = new Textbox(120,320,"I don't know why I want you to be here. I've never wanted to tell anyone anything before.",storyteller,true);
					FP.world.add(currentEntity);
					OActive[0] = false;
					count = false;
				}
			}
			if (sceneNumber == 1)
			{
				if (OAlarm >= 2 && OActive[1] == true)
				{
					currentEntity = new Textbox(32,320,"Everyone has their stories...and everyone needs to tell it to someone, eventually...I think.",listenerNormal);
					FP.world.add(currentEntity);
					OActive[1] = false;
					count = false;
				}
			}
			if (sceneNumber == 2)
			{
				if (OAlarm >= 2 && OActive[2] == true)
				{
					currentEntity = new Textbox(32,320,"I'm glad it was me.",listenerNormal);
					FP.world.add(currentEntity);
					OActive[2] = false;
					count = false;
				}
			}
			if (sceneNumber == 3)
			{
				if (OActive[6] == true)
				{
					currentEntity = new FadeText("...");
					OActive[6] = false;
					count = false;
				}
				if (IActive[0] == true && IAlarm >= 0)
				{
					FP.world.add(new CJetWaveImag());
					IActive[0] = false;
				}
				if (IActive[1] == true && IAlarm >= 30)
				{
					FP.world.add(new CBow_Imag(80));
					FP.world.add(new CBow_Imag(560));
					IActive[1] = false;
				}
				if (IActive[2] == true && IAlarm >= 32)
				{
					FP.world.add(new CBow_Imag(80));
					FP.world.add(new CBow_Imag(560));
					IActive[2] = false;
				}
				if (IActive[3] == true && IAlarm >= 34)
				{
					FP.world.add(new CBow_Imag(80));
					FP.world.add(new CBow_Imag(560));
					IActive[3] = false;
				}
				if (IActive[4] == true && IAlarm >= 36)
				{
					FP.world.add(new CBow_Imag(80));
					FP.world.add(new CBow_Imag(560));
					IActive[4] = false;
				}
				if (IActive[5] == true && IAlarm >= 38)
				{
					FP.world.add(new CBow_Imag(80));
					FP.world.add(new CBow_Imag(560));
					IActive[5] = false;
				}
				if (IActive[6] == true && IAlarm >= 40)
				{
					FP.world.add(new CBowWaveI());
					IActive[6] = false;
				}
				if (RActive[0] == true && RAlarm >= 0)
				{
					FP.world.add(new CBowWaveR());
					RActive[0] = false;
				}
				if (RActive[1] == true && RAlarm >= 30)
				{
					FP.world.add(new CBow_Real(80));
					FP.world.add(new CBow_Real(560));
					RActive[1] = false;
				}
				if (RActive[2] == true && RAlarm >= 31)
				{
					FP.world.add(new CBow_Real(80));
					FP.world.add(new CBow_Real(560));
					RActive[2] = false;
				}
				if (RActive[3] == true && RAlarm >= 33)
				{
					FP.world.add(new CBow_Real(80));
					FP.world.add(new CBow_Real(560));
					RActive[3] = false;
				}
				if (RActive[4] == true && RAlarm >= 35)
				{
					FP.world.add(new CBow_Real(80));
					FP.world.add(new CBow_Real(560));
					RActive[4] = false;
				}
				if (RActive[5] == true && RAlarm >= 37)
				{
					FP.world.add(new CBow_Real(80));
					FP.world.add(new CBow_Real(560));
					RActive[5] = false;
				}
				if (RActive[6] == true && RAlarm >= 40)
				{
					FP.world.add(new CJetWaveReal());
					RActive[6] = false;
				}
				if (OActive[7] == true && OAlarm >= 70)
				{
					FP.world.add(currentEntity);
					OActive[7] = false;
				}
			}
			if (sceneNumber == 4)
			{
				if (OActive[5] == true)
				{
				canCreateBoss = true;
				OActive[5] = false;
				}
			}
			//BOSS TIME
			if (canCreateBoss == true)
			{
				FP.world.add(new CBossControl());
				
				canCreateBoss = false;
			}
			if (canCreateBoss2 == true)
			{
				//FP.world.add(new CBossControl());
				FP.world.add(new CBossControl2());
				canCreateBoss2 = false;
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