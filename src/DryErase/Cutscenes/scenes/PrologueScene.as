package DryErase.Cutscenes.scenes
{
	import DryErase.Cutscenes.Cutscene;
	import DryErase.Cutscenes.FadeText;
	import DryErase.Cutscenes.SceneEntity;
	import DryErase.Cutscenes.Textbox;
	
	import Worlds.classes.CutsceneWorld;
	import Worlds.classes.Title.WorldMap;
	
	import com.debug.Debug;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;

	public class PrologueScene extends Cutscene
	{
		public var sceneNumber:Number = 0;
		
		//PORTRAITS
		public var listenerPortrait:Image = new Image(Assets.PORTRAIT_LISTENER_NORMAL);
		public var shockedPortrait:Image = new Image(Assets.PORTRAIT_LISTENER_SHOCKED);
		public var storytellerPortrait:Image = new Image(Assets.PORTRAIT_STORYTELLER);
		public var currentEntity:SceneEntity;
		
		public var scene:SceneEntity;
		public var scene2:SceneEntity;
		
		public var activate:Boolean = false;
		
		public var pauseTimer:Number = 2;
		public function PrologueScene()
		{
			super();
			scene = new SceneEntity(0,0,new Image(Assets.PROLOGUE));
			scene2 = new SceneEntity(0,0,new Image(Assets.PROLOGUE2));
			currentEntity = new FadeText("This is not my story...it is the story of a little girl I once knew.");
			SoundManager.currentMusic = SoundManager.musicAwaken;

		}
		public function init():void
		{
			FP.world.add(scene);
			FP.world.add(scene2);
		}
		override public function update():void	
		{
			if (activate == false)
			{
				activate = true;
				init();
			}
			super.update();
			pauseTimer -= FP.elapsed;
			
			if (pauseTimer < 0 && pauseTimer > -10)
			{
				switch (sceneNumber)
				{
					case 0:
					{
						currentEntity = new FadeText("This is not my story...it is the story of a little girl I once knew.");		
						FP.world.add(currentEntity);
	
					}break;
					
					
					case 1:
					{
						currentEntity = new FadeText("I had been walking home from work, my briefcase in my hand...I almost didn't see her, sitting under the tree.");		
						FP.world.add(currentEntity);
						
					}break;
					
					case 2:
					{
						currentEntity = new FadeText("She was drawing...and for some reason, she spoke to me. Or at least, I thought I heard her speak.");		
						FP.world.add(currentEntity);
						
					}break;
					case 3:
					{
						scene.fadeIn(0.05);
						
					}break;
					case 4:
					{
						currentEntity = new FadeText("'Hi Mister.'");		
						FP.world.add(currentEntity);
						
					}break;
					case 5:
					{
						currentEntity = new Textbox(32, 320, "Hello. What are you doing here? It's getting rather late.", listenerPortrait);	
						FP.world.add(currentEntity);
						
					}break;
					case 6:
					{
						currentEntity = new Textbox(120, 320, "You can see me?", storytellerPortrait, true);	
						FP.world.add(currentEntity);
						
					}break;
					case 7:
					{
						currentEntity = new Textbox(32, 320, "Ah...yes. Of course I can. What is your name?", listenerPortrait);	
						FP.world.add(currentEntity);
						
					}break;
					case 8:
					{
						currentEntity = new Textbox(120, 320, "That doesn't matter. I'm writing a story...that's all that matters to me.", storytellerPortrait, true);	
						FP.world.add(currentEntity);
						
					}break;
					case 9:
					{
						currentEntity = new Textbox(32, 320, "Do you want to tell me this story, then? I have time.", listenerPortrait);	
						FP.world.add(currentEntity);
						
					}break;
					case 10:
					{
						currentEntity = new Textbox(120, 320, "Are you sure you want to listen to it?", storytellerPortrait,true);	
						FP.world.add(currentEntity);
						
					}break;
					case 11:
					{
						currentEntity = new Textbox(32, 320, "Sure. I'm certain it's not bad.", listenerPortrait);	
						FP.world.add(currentEntity);
						
					}break;
					case 12:
					{
						currentEntity = new Textbox(120, 320, "No...it's just...I'm afraid you won't like it. Can you promise...to just listen, and not judge me?", storytellerPortrait, true);	
						FP.world.add(currentEntity);
						
					}break;
					case 13:
					{
						currentEntity = new Textbox(32, 320, "Of course.", listenerPortrait);	
						FP.world.add(currentEntity);
						
					}break;
					case 14:
					{
						scene.fadeOut(0.05);
						currentEntity = new Textbox(120, 320, "I am the Storyteller. And you are the Listener. And this is my story.", storytellerPortrait,true);	
						FP.world.add(currentEntity);
						
					}break;
					
					case 16:
					{
						scene2.fadeIn(0.05);
					}break;
					
					case 17:
					{
						scene2.fadeIn(0.05);
						currentEntity = new Textbox(32, 320, "H-hey! What's going on?", shockedPortrait);	
						FP.world.add(currentEntity);
						
					}break;
					case 18:
					{
						currentEntity = new Textbox(120, 320, "What's going on? This is my story.", storytellerPortrait,true);	
						FP.world.add(currentEntity);
						
					}break;
					case 19:
					{
						currentEntity = new Textbox(32, 320, "How is this real? And why am I here?!", shockedPortrait);	
						FP.world.add(currentEntity);
						
					}break;
					case 20:
					{
						scene2.fadeOut(0.05);
						currentEntity = new Textbox(120, 320, "This is a story...which is real to me. And now it is real to you. Besides...every story needs a hero.", storytellerPortrait,true);	
						FP.world.add(currentEntity);
						
					}break;
					case 21:
					{
						
						currentEntity = new Textbox(120, 320, "You are the hero.", storytellerPortrait,true);	
						FP.world.add(currentEntity);
						
					}break;
					case 22:
					{
						
						currentEntity = new FadeText("Everything after that had been but a blur.");		
						FP.world.add(currentEntity);
						
					}break;
					case 23:
					{
						currentEntity = new FadeText("No...it was like a dream.");		
						FP.world.add(currentEntity);
						
					}break;
					case 24:
					{
						currentEntity = new FadeText("Evanescent Dreams.");		
						FP.world.add(currentEntity);
						
					}break;
					case 25:
					{
						Main.introPassed = true;
						Main.saveGame();
						FP.world = new CutsceneWorld(new InstructionsScene());
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
		override public function skipped():void
		{
			Main.introPassed = true;
			Main.saveGame();
			FP.world = new CutsceneWorld(new InstructionsScene());
		}
	}
}