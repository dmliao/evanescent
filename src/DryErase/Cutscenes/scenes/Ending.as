package DryErase.Cutscenes.scenes
{
	import DryErase.Cutscenes.Cutscene;
	import DryErase.Cutscenes.FadeText;
	import DryErase.Cutscenes.SceneEntity;
	import DryErase.Cutscenes.Textbox;
	
	import Worlds.classes.Credits;
	import Worlds.classes.Title.WorldMap;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class Ending extends Cutscene
	{
		//PORTRAITS
		public var listenerPortrait:Image = new Image(Assets.PORTRAIT_LISTENER_NORMAL);
		public var storytellerPortrait:Image = new Image(Assets.PORTRAIT_STORYTELLER);
		public var currentEntity:SceneEntity;
		
		public var sceneNumber:Number = 0;
		public var cutsceneTimer:Number = 0;
		public var pauseTimer:Number = 2;
		
		public var scene:SceneEntity = new SceneEntity(0,0,new Image(Assets.END1));
		public var scene2:SceneEntity = new SceneEntity(0,0,new Image(Assets.END2));
		public var scene3:SceneEntity = new SceneEntity(0,0,new Image(Assets.END3));
		public var activate:Boolean = false;
		private  var isMuted:Boolean = false;
		public function Ending()
		{
			currentEntity = new FadeText("Dar");
		}
		public function init():void
		{
			scene = new SceneEntity(0,0,new Image(Assets.END1));
			scene2 = new SceneEntity(0,0,new Image(Assets.END2));
			scene3 = new SceneEntity(0,0,new Image(Assets.END3));
			FP.world.add(scene);
			FP.world.add(scene2);
			FP.world.add(scene3);
			if (SoundManager.volumeMusic > 0)
			{
				isMuted = false;
			}
			else {
					isMuted = true;
			}
		}
		override public function update():void
		{
			
			if (activate == false)
			{
				activate = true;
				init();
			}
			super.update();
			cutsceneTimer += FP.elapsed;
			pauseTimer -= FP.elapsed;
			if (sceneNumber >= 13)
			{
				SoundManager.volumeMusic -= 0.0025;
				SoundManager.currentMusic.volume = SoundManager.volumeMusic;
			}
			if (pauseTimer < 0 && pauseTimer > -10)
			{
				switch (sceneNumber)
				{
					case 0:
					{
						
						currentEntity = new Textbox(32,320,"You were wrong there. I'm not going to destroy you. This story has been your life.",listenerPortrait);	
						FP.world.add(currentEntity);
						
					}break;
					case 1:
					{
						scene.fadeIn();
						
					}break;
					case 2:
					{
						currentEntity = new Textbox(32,320,"And now it's time to let go...live in a world where dreams do not have to end in tragedy.",listenerPortrait);	
						FP.world.add(currentEntity);
						
					}break;
					case 3:
					{
						scene.fadeOut(0.025);
						scene2.fadeIn(0.025);
						currentEntity = new Textbox(32,320,"A world where you can find peace.",listenerPortrait);	
						FP.world.add(currentEntity);
						
					}break;
					case 4:
					{
						
						scene2.fadeOut(0.014);
						
						
					}break;
					case 5:
					{
						
						
					}break;
					case 6:
					{
						
						
					}break;
					case 7:
					{
						
						currentEntity = new FadeText("She'd stopped moving, stopped talking, for a long time.");
						FP.world.add(currentEntity);
						
					}break;
					case 8:
					{
						
						currentEntity = new FadeText("The sun was setting - it had been a long afternoon. And I wouldn't forget it.");
						FP.world.add(currentEntity);
						
					}break;
					case 9:
					{
						
						currentEntity = new FadeText("She'd raised a hand, very deliberately threw her pen-knife into the ground.");
						FP.world.add(currentEntity);
						
					}break;
					case 10:
					{
						
						currentEntity = new FadeText("And then she took my hand, and told me that she wanted to go home.");
						FP.world.add(currentEntity);
						
					}break;
					case 11:
					{
						
						currentEntity = new FadeText("Can you see...the vast journeys the stories have told?");
						FP.world.add(currentEntity);
						
					}break;
					case 12:
					{
						
						currentEntity = new FadeText("Stay with me...take my hand so that I can see the world...");
						FP.world.add(currentEntity);
						
					}break;
					case 13:
					{
						
						scene3.fadeIn(0.02);
						SoundManager.volumeMusic -= 0.025;
					}break;
					case 14:
					{
					
					}break;
					case 15:
					{
						
						currentEntity = new FadeText("");
						FP.world.add(currentEntity);
						
					}break;
					case 16:
					{
						scene3.fadeOut(0.02);
					}break;
					case 17:
					{
					//	scene3.fadeOut(0.02);
					}break;
					case 18:
					{
						endCutscene();
					}break;
				}
				pauseTimer = -15;
			}
			else if (currentEntity.deleted == true && pauseTimer < -10)
			{
				pauseTimer = 1;
				sceneNumber += 1;
			}
			
			
			
		}
		override public function endCutscene():void
		{
			if (isMuted)
			{
				SoundManager.volumeMusic = 0;
			}
			else
			{
				SoundManager.volumeMusic = 0.5;
			}SoundManager.currentMusic.stop();
			super.endCutscene();
			FP.world = new Credits();
		}
		override public function skipped():void
		{
			
			if (isMuted)
			{
				SoundManager.volumeMusic = 0;
			}
			else
			{
				SoundManager.volumeMusic = 0.5;
			}
				SoundManager.currentMusic.stop();
			
			FP.world = new Credits();
			
		}
	}
}