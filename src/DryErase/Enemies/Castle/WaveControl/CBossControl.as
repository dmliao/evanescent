package DryErase.Enemies.Castle.WaveControl
{
	import DryErase.Cutscenes.BossScene;
	import DryErase.Cutscenes.Cutscene;
	import DryErase.Cutscenes.FadeText;
	import DryErase.Cutscenes.SceneEntity;
	import DryErase.Cutscenes.Textbox;
	import DryErase.Enemies.Castle.Boss.CHero;
	import DryErase.Enemies.Flower.Enemies.boss.BBoss_Imag;
	import DryErase.Enemies.Flower.Enemies.boss.BBoss_Real;
	import DryErase.Enemies.Flower.WaveControl.Master_B;
	import DryErase.Enemies.Forest.Enemies.Boss.FMuon;
	import DryErase.Enemies.Forest.Enemies.Boss.FTau;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class CBossControl extends Cutscene
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
		
		public function CBossControl()
		{
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
						FP.world.add(new CHero());
						currentEntity = new FadeText("You are still here, human?");		
						FP.world.add(currentEntity);
						
					}break;
					case 1:
					{
						
						currentEntity = new Textbox(32,300,"Of course I am. I need to stay. She asked me to.", listenerNormal);
						FP.world.add(currentEntity);
						
					}break;
					case 2:
					{
						Utils.quake.start();
						currentEntity = new FadeText("You fool! I thought that you would have lost heart by now. It would have been better for everyone.");
						FP.world.add(currentEntity);
						
					}break;
					case 3:
					{
						
						currentEntity = new Textbox(32,300,"Why?", listenerNormal);
						FP.world.add(currentEntity);
						
					}break;
					
					case 4:
					{
						currentEntity = new FadeText("You are poisoning her mind. I don't know why she chose you to be the hero.");
						FP.world.add(currentEntity);
					}break;
					case 5:
					{
						currentEntity = new Textbox(32,300,"Because she wanted me to be...who are you, anyways?", listenerShocked);
						FP.world.add(currentEntity);
					}break;
					case 6:
					{
						Utils.quake.start();
						mtImage.fadeIn();
					}break;
					case 7:
					{
						currentEntity = new FadeText("I am Hero! I should have been her savior...I should have been able to finish this story for her!");
						FP.world.add(currentEntity);
					}break;
					case 8:
					{
						currentEntity = new FadeText("But you had to go and change it all.");
						FP.world.add(currentEntity);
					}break;
					case 9:
					{
						mtImage.fadeOut();
					}break;
					case 10:
					{
						currentEntity = new FadeText("A child should never have to change for the sake of the world. The world will only take advantage of her.");
						FP.world.add(currentEntity);
					}break;
					case 11:
					{
						currentEntity = new Textbox(32,300,"Is that true?", listenerShocked);
						FP.world.add(currentEntity);
					}break;
					case 12:
					{
						currentEntity = new FadeText("It is undeniable! You are here, spreading the world's poisons!");
						FP.world.add(currentEntity);
					}break;
					case 13:
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
		}
		override public function skipped():void
		{
			if (Main.isArcade == true)
			{
				FP.world.add(new CHero());
			}
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