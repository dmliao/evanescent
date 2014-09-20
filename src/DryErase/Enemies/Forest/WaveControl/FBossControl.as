package DryErase.Enemies.Forest.WaveControl
{
	import DryErase.Cutscenes.BossScene;
	import DryErase.Cutscenes.Cutscene;
	import DryErase.Cutscenes.FadeText;
	import DryErase.Cutscenes.SceneEntity;
	import DryErase.Cutscenes.Textbox;
	import DryErase.Enemies.Forest.Enemies.Boss.FMuon;
	import DryErase.Enemies.Forest.Enemies.Boss.FTau;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class FBossControl extends Cutscene
	{
		public var cutsceneTimer:Number =5;
		public var sceneNumber:Number = 0;
		
		//CUTSCENE IMAGES
		public var mtImage:SceneEntity = new SceneEntity(0,0,new Image(Assets.ENCOUNTERMUON));
		//PORTRAITS
		public var listenerNormal:Image = new Image(Assets.PORTRAIT_LISTENER_NORMAL);
		public var listenerShocked:Image = new Image(Assets.PORTRAIT_LISTENER_SHOCKED);
		public var muon:Image = new Image(Assets.PORTRAIT_MUON);
		public var tau:Image = new Image(Assets.PORTRAIT_TAU);
		
		public var currentEntity:SceneEntity;
		
		public var pauseTimer:Number = 2;
		public var greaterPauseSwitch:Boolean = false;
	
		public function FBossControl()
		{
			FP.world.add(mtImage);
			Listener.inCutscene = true;
			currentEntity = new FadeText("Dar");
			FP.world.add(new BossScene());
			
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
						currentEntity = new FadeText("You're no fun.");		
						FP.world.add(currentEntity);
						
					}break;
					
					case 1:
					{
						
						currentEntity = new Textbox(120,48,"Master was happy in this world.",muon,true);		
						FP.world.add(currentEntity);
					}break;
					case 2:
					{
						currentEntity = new Textbox(120,300,"Why'd you have to invade it?",tau,true);		
						FP.world.add(currentEntity);
					}break;
					case 3:
					{
						mtImage.fadeIn();
						
					}break;
					case 4:
					{
						currentEntity = new Textbox(120,48,"I am Muon. I take care of this forest...care for it so that this world may live.",muon,true);		
						FP.world.add(currentEntity);
					}break;
					case 5:
					{
						currentEntity = new Textbox(120,300,"And I am Tau. I work for my Master's happiness.",tau,true);		
						FP.world.add(currentEntity);
					}break;
					case 6:
					{
						currentEntity = new Textbox(120,48,"You are causing her distress.",muon,true);		
						FP.world.add(currentEntity);
					}break;
					case 7:
					{
						currentEntity = new Textbox(120,300,"Which is why we must entertain her.",tau,true);		
						FP.world.add(currentEntity);
					}break;
					case 8:
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
		}
		override public function endCutscene():void
		{
			FP.world.remove(this);
			Listener.inCutscene = false;
			FP.world.add(new FMuon());
			FP.world.add(new FTau());
		}
	}
}