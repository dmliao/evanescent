package DryErase.Cutscenes.scenes
{
	import DryErase.Cutscenes.Cutscene;
	import DryErase.Cutscenes.FadeText;
	import DryErase.Cutscenes.SceneEntity;
	import DryErase.Cutscenes.Textbox;
	import DryErase.Hero.Listener;
	
	import Worlds.classes.Title.WorldMap;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class M_AfterLevelScene extends Cutscene
	{
		//PORTRAITS
		public var listenerPortrait:Image = new Image(Assets.PORTRAIT_LISTENER_NORMAL);
		public var storytellerPortrait:Image = new Image(Assets.PORTRAIT_STORYTELLER);
		public var currentEntity:SceneEntity;
		
		public var sceneNumber:Number = 0;
		public var cutsceneTimer:Number = 0;
		public var pauseTimer:Number = 2;
		
		public var scene:SceneEntity;
		
		public var activate:Boolean = false;
		public function M_AfterLevelScene()
		{
			currentEntity = new FadeText("Dar");
			scene = new SceneEntity(0,0,new Image(Assets.CLEARMOUNTAIN));
			super();
			
		}
		public function init():void
		{
			scene = new SceneEntity(0,0,new Image(Assets.CLEARMOUNTAIN));
			FP.world.add(scene);
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
			
			if (pauseTimer < 0 && pauseTimer > -10)
			{
				switch (sceneNumber)
				{
					case 0:
					{
						currentEntity = new FadeText("You do not learn, do you? There is nothing more to say.");		
						FP.world.add(currentEntity);
						
					}break;
					case 1:
					{
						currentEntity = new Textbox(32,320,"Hey...do you really want me to leave? I don't want to bother you.",listenerPortrait);
						FP.world.add(currentEntity);
					}break;
					case 2:
					{
						currentEntity = new Textbox(120,320,"No, stay. Please. I'm not done yet. Lung was wrong...I don't want you to leave. Come with me.",storytellerPortrait,true);
						FP.world.add(currentEntity);
					}break;
					case 3:
					{
						scene.fadeIn();
					}break;
					case 4:
					{
						currentEntity = new Textbox(32,320,"This...is...",listenerPortrait);
						FP.world.add(currentEntity);
					}break;
					case 5:
					{
						currentEntity = new Textbox(120,320,"It's my sky. My mountains...it's where my dreams rest.",storytellerPortrait,true);
						FP.world.add(currentEntity);
					}break;
					case 6:
					{
						currentEntity = new Textbox(32,320,"Why is that?",listenerPortrait);
						FP.world.add(currentEntity);
					}break;
					case 7:
					{
						currentEntity = new Textbox(120,320,"It's because I don't dream. Well, at least, I haven't for a long time. Do you?",storytellerPortrait,true);
						FP.world.add(currentEntity);
					}break;
					case 8:
					{
						currentEntity = new Textbox(32,320,"Well, yeah. A person has to dream, right?",listenerPortrait);
						FP.world.add(currentEntity);
					}break;
					case 9:
					{
						currentEntity = new Textbox(120,320,"No. Dreams are such fleeting thoughts. Besides...you say you have them...",storytellerPortrait,true);
						FP.world.add(currentEntity);
					}break;
					case 10:
					{
						currentEntity = new Textbox(120,320,"...but you have never truly acted on them. Isn't that the same as not dreaming at all?",storytellerPortrait,true);
						FP.world.add(currentEntity);
					}break;
					case 11:
					{
						scene.fadeOut();
						currentEntity = new Textbox(32,320,"...",listenerPortrait);
						FP.world.add(currentEntity);
					}break;
					case 12:
					{
						currentEntity = new FadeText("His journey through the mountains led him to the clouds, where a fierce dragon awaited the hero.");		
						FP.world.add(currentEntity);
						
					}break;
					case 13:
					{
						currentEntity = new FadeText("After a harsh battle, the hero claimed a shard of the mirror from the dragon's possessions...");		
						FP.world.add(currentEntity);
						
					}break;
					case 14:
					{
						currentEntity = new FadeText("...and the evil in the sky almost seemed to shrink back in fear.");		
						FP.world.add(currentEntity);
						
					}break;
					case 15:
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
			super.endCutscene();
			FP.world = new WorldMap();
		}
		override public function skipped():void
		{
			FP.world = new WorldMap();
		}
	}
}