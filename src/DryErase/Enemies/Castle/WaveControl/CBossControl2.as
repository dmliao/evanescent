package DryErase.Enemies.Castle.WaveControl
{
	import DryErase.Cutscenes.BossScene;
	import DryErase.Cutscenes.Cutscene;
	import DryErase.Cutscenes.FadeText;
	import DryErase.Cutscenes.SceneEntity;
	import DryErase.Cutscenes.Textbox;
	import DryErase.Enemies.Boss;
	import DryErase.Enemies.Castle.Boss.CHero;
	import DryErase.Enemies.Castle.Boss.CHero_Horseback;
	import DryErase.Enemies.Flower.Enemies.boss.BBoss_Imag;
	import DryErase.Enemies.Flower.Enemies.boss.BBoss_Real;
	import DryErase.Enemies.Flower.WaveControl.Master_B;
	import DryErase.Enemies.Forest.Enemies.Boss.FMuon;
	import DryErase.Enemies.Forest.Enemies.Boss.FTau;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class CBossControl2 extends Cutscene
	{
		public var cutsceneTimer:Number =5;
		public var sceneNumber:Number = 0;
		
		//CUTSCENE IMAGES
		public var mtImage:SceneEntity = new SceneEntity(0,0,new Image(Assets.ENCOUNTERHERO));
		//PORTRAITS
		public var listenerNormal:Image = new Image(Assets.PORTRAIT_LISTENER_NORMAL);
		public var listenerShocked:Image = new Image(Assets.PORTRAIT_LISTENER_SHOCKED);
		public var storyteller:Image = new Image(Assets.PORTRAIT_STORYTELLER);
		
		public var currentEntity:SceneEntity;
		
		public var pauseTimer:Number = 2;
		public var greaterPauseSwitch:Boolean = false;
		
		public function CBossControl2()
		{
			FP.world.add(new BossScene());
			Listener.inCutscene = true;
			currentEntity = new FadeText("Dar");
		}
		override public function update():void
		{
			if (Main.isArcade == true)
			{
				skipped();
			}
			super.update();
			
			cutsceneTimer += FP.elapsed;
			pauseTimer -= FP.elapsed;
			
			if (pauseTimer < 0 && pauseTimer > -10)
			{
				switch (sceneNumber)
				{
					case 0:
					{
						Utils.quake.start();
						currentEntity = new FadeText("The good guy always wins! Why am I not winning?!");		
						FP.world.add(currentEntity);
						
					}break;
					case 1:
					{
						
						currentEntity = new Textbox(32,300,"I don't know.", listenerNormal);
						FP.world.add(currentEntity);
						
					}break;
					case 2:
					{
						
						currentEntity = new FadeText("I'm a hero! I refuse to believe anything else!");
						FP.world.add(currentEntity);
						
					}break;
					
					case 3:
					{
						endCutscene();
					}break;
				}
				pauseTimer = -15;
			}
			else if (currentEntity.deleted == true && pauseTimer < -10)
			{
				if (greaterPauseSwitch == false)
				{
					pauseTimer = 1;
					sceneNumber += 1;
				}
				else
				{
					pauseTimer = 5;
					sceneNumber += 1;
					greaterPauseSwitch = true;
				}
			}
			
		}
		override public function endCutscene():void
		{
			FP.world.remove(this);
			Listener.inCutscene = false;
			CHero.introFlag = true;
			FP.world.add(new CHero_Horseback());
		}
		override public function skipped():void
		{
			mtImage.deleteOut();
			FP.world.remove(currentEntity);
			currentEntity.deleteOut();
			endCutscene();
			FP.world.remove(this);
			Listener.inCutscene = false;
			cutsceneTimer = 500;
			Utils.flash.start();
		}
	}
}