package DryErase.Enemies.River.WaveControl
{
	import DryErase.Cutscenes.BossScene;
	import DryErase.Cutscenes.Cutscene;
	import DryErase.Cutscenes.FadeText;
	import DryErase.Cutscenes.SceneEntity;
	import DryErase.Cutscenes.Textbox;
	import DryErase.Enemies.Boss;
	import DryErase.Enemies.River.Enemies.Boss.RBoss;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class RBossControl extends Cutscene
	{
		public var cutsceneTimer:Number =5;
		public var sceneNumber:Number = 0;
		
		//CUTSCENE IMAGES
		public var gueyImage:SceneEntity = new SceneEntity(0,0,new Image(Assets.ENCOUNTERGUEY));
		//PORTRAITS
		public var listenerNormal:Image = new Image(Assets.PORTRAIT_LISTENER_NORMAL);
		public var listenerShocked:Image = new Image(Assets.PORTRAIT_LISTENER_SHOCKED);
		public var gueyPortrait:Image = new Image(Assets.PORTRAIT_GUEY);
		public var currentEntity:SceneEntity;
		
		public var pauseTimer:Number = 2;
		public var greaterPauseSwitch:Boolean = false;
		public function RBossControl()
		{
			//PLAY BOSS MUSIC
			//START BOSS CUTSCENE
			FP.world.add(gueyImage);
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
						currentEntity = new FadeText("Why have you stayed? Can you not listen to the girl's heart?");		
						FP.world.add(currentEntity);
						
					}break;
					
					case 1:
					{
						
						currentEntity = new Textbox(32,300,"What do you mean?",listenerNormal);		
						FP.world.add(currentEntity);
					}break;
					case 2:
					{
						currentEntity = new FadeText("She begs you to stay. Yet secretly, she wants you to leave. No, moreso, she wants you to die.");		
						FP.world.add(currentEntity);
					}break;
					case 3:
					{
						currentEntity = new Textbox(32,300,"...", listenerNormal);
						FP.world.add(currentEntity);
						
					}break;
					case 4:
					{
						currentEntity = new FadeText("I have been loyal to her for years. I know her better than you do. You will only serve to destroy her future.");		
						FP.world.add(currentEntity);
					}break;
					case 5:
					{
						gueyImage.fadeIn();
						
					}break;
					case 6:
					{
						currentEntity = new Textbox(0,320,"I am Guey...protector of the River of Time. If you wish to continue, I will have to defeat you.",gueyPortrait);		
						FP.world.add(currentEntity);
					}break;
					case 7:
					{
						gueyImage.deleteOut();
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
			FP.world.remove(currentEntity);
			currentEntity.deleteOut();
			endCutscene();
			FP.world.remove(this);
			Listener.inCutscene = false;
			cutsceneTimer = 500;
			Utils.flash.start();
			gueyImage.deleteOut();
		}
		override public function endCutscene():void
		{
			FP.world.remove(this);
			FP.world.add(new RBoss());
			
		}
	}
}