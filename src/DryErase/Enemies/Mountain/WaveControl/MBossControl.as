package DryErase.Enemies.Mountain.WaveControl
{
	import DryErase.Cutscenes.BossScene;
	import DryErase.Cutscenes.Cutscene;
	import DryErase.Cutscenes.FadeText;
	import DryErase.Cutscenes.SceneEntity;
	import DryErase.Cutscenes.Textbox;
	import DryErase.Enemies.Boss;
	import DryErase.Enemies.Mountain.Enemies.BossM;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;

	public class MBossControl extends Cutscene
	{
		
		public var cutsceneTimer:Number =5;
		public var sceneNumber:Number = 0;
		
		
		//CUTSCENE IMAGES
		public var lungImage:SceneEntity = new SceneEntity(0,0,new Image(Assets.ENCOUNTERLUNG));
		public var lungShadow:Spritemap = new Spritemap(Assets.lungReal, 556, 750);
		public var lung:Entity = new Entity(320,640,lungShadow);
		
		//PORTRAITS
		public var listenerShocked:Image = new Image(Assets.PORTRAIT_LISTENER_SHOCKED);
		public var currentEntity:SceneEntity;
		
		public var pauseTimer:Number = 2;
		public var shadowMove:Boolean = false;
		
		public var greaterPauseSwitch:Boolean = false;
		public function MBossControl()
		{
			x = 45;
			y = 88;
			//PLAY BOSS MUSIC
			//START BOSS CUTSCENE
			
			FP.world.add(lungImage);
			FP.world.add(lung);
			lung.layer = -1000;
			lungShadow.angle = 90;
			lungShadow.alpha = 0.3;
			Listener.inCutscene = true;
			lungShadow.add("still",[0,1,2,3],5,true);
			lungShadow.play("still");
			lungShadow.color = 0x000000;
			lungShadow.centerOO();
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
			if (shadowMove)
			{
				lung.y -= 6;
			}
			cutsceneTimer += FP.elapsed;
			pauseTimer -= FP.elapsed;
			
			if (pauseTimer < 0 && pauseTimer > -10)
			{
				switch (sceneNumber)
				{
					case 0:
					{
						currentEntity = new FadeText("How dare you trespass on this sacred ground?!");		
						FP.world.add(currentEntity);
						
					}break;
					
					case 1:
					{
						
						currentEntity = new Textbox(32,300,"Who are you?",listenerShocked);		
						FP.world.add(currentEntity);
					}break;
					case 2:
					{
						currentEntity = new FadeText("A friend of the Storyteller. You are an unwelcome presence. You corrupt her pure mind.");		
						FP.world.add(currentEntity);
					}break;
					case 3:
					{
						currentEntity = new Textbox(32,300,"All I offered was to listen to her...", listenerShocked);
						FP.world.add(currentEntity);

					}break;
					case 4:
					{
						currentEntity = new FadeText("But that is not what you truly seek. You are not welcome here.");		
						FP.world.add(currentEntity);
					}break;
					case 5:
					{
						
						cutsceneTimer=-0.5;
					}break;
					case 6:
					{
						currentEntity = new FadeText("My name is Lung...I keep the Storyteller's dreams with me. And I will show you why you should never stay.");		
						FP.world.add(currentEntity);
					}break;
					case 7:
					{
						lungImage.fadeIn();
					}break;
					case 8:
					{
						currentEntity = new FadeText("Prepare yourself!");		
						FP.world.add(currentEntity);
					}break;
					case 9:
					{
						lungImage.deleteOut();
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
			
			if (cutsceneTimer > 0 && cutsceneTimer < 1)
			{
				shadowMove = true;
			}
		}
		override public function skipped():void
		{
			FP.world.remove(currentEntity);
			currentEntity.deleteOut();
			endCutscene();
			FP.world.remove(this);
			Listener.inCutscene = false;
			lungImage.deleteOut();
			cutsceneTimer = 500;
			Utils.flash.start();
		}
		override public function endCutscene():void
		{
			FP.world.remove(this);
			FP.world.add(new BossM());
			
			BossM.introFlag = true;
		}
	}
}