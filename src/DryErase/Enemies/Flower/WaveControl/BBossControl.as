package DryErase.Enemies.Flower.WaveControl
{
	import DryErase.Cutscenes.BossScene;
	import DryErase.Cutscenes.Cutscene;
	import DryErase.Cutscenes.FadeText;
	import DryErase.Cutscenes.SceneEntity;
	import DryErase.Cutscenes.Textbox;
	import DryErase.Enemies.Flower.Enemies.boss.BBoss_Imag;
	import DryErase.Enemies.Flower.Enemies.boss.BBoss_Real;
	import DryErase.Enemies.Flower.WaveControl.Master_B;
	import DryErase.Enemies.Forest.Enemies.Boss.FMuon;
	import DryErase.Enemies.Forest.Enemies.Boss.FTau;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class BBossControl extends Cutscene
	{
		public var cutsceneTimer:Number =5;
		public var sceneNumber:Number = 0;
		
		//CUTSCENE IMAGES
		public var mtImage:SceneEntity = new SceneEntity(0,0,new Image(Assets.ENCOUNTERHU));
		//PORTRAITS
		public var listenerNormal:Image = new Image(Assets.PORTRAIT_LISTENER_NORMAL);
		public var listenerShocked:Image = new Image(Assets.PORTRAIT_LISTENER_SHOCKED);
		public var storyteller:Image = new Image(Assets.PORTRAIT_STORYTELLER);
		
		public var currentEntity:SceneEntity;
		
		public var pauseTimer:Number = 2;
		public var greaterPauseSwitch:Boolean = false;
		
		public function BBossControl()
		{
			FP.world.add(new BossScene());
			FP.world.add(mtImage);
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
						currentEntity = new FadeText("No...this isn't right. This shouldn't exist.");		
						FP.world.add(currentEntity);
						
					}break;
					
					case 1:
					{
						
						currentEntity = new Textbox(32,320,"What? What's going on?!", listenerShocked);		
						FP.world.add(currentEntity);
					}break;
					case 2:
					{
						currentEntity = new Textbox(120,320,"I can't...I can't look at this anymore.",storyteller,true);		
						FP.world.add(currentEntity);
					}break;
					case 3:
					{
						Master_B.canBurn = true;
						
					}break;
					case 4:
					{
						currentEntity = new Textbox(32,320,"What in the world?! Hello?! Are you alright?",listenerShocked);		
						FP.world.add(currentEntity);
					}break;
					case 5:
					{
						mtImage.fadeIn();
					}break;
					case 6:
					{
						currentEntity = new Textbox(32,320,"Where are you...?",listenerShocked);		
						FP.world.add(currentEntity);
					}break;
					case 7:
					{
						mtImage.deleteOut();
						endCutscene();
						Listener.inCutscene = false;
						cutsceneTimer = 500;
						
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
			Master_B.canBurn = true;
		}
		override public function endCutscene():void
		{
			FP.world.remove(this);
			Listener.inCutscene = false;
			FP.world.add(new BBoss_Imag());
			FP.world.add(new BBoss_Real());
			
		}
	}
}