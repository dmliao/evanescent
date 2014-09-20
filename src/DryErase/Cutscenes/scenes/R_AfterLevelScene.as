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
	
	public class R_AfterLevelScene extends Cutscene
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
		public function R_AfterLevelScene()
		{
			currentEntity = new FadeText("Dar");
			scene = new SceneEntity(0,0,new Image(Assets.ENCOUNTERLUNG));
			super();
		}
		public function init():void
		{
			scene = new SceneEntity(0,0,new Image(Assets.CLEARRIVER));
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
						currentEntity = new FadeText("If you are the friend you claim to be, take care of her. If not, then you deserve to die.");		
						FP.world.add(currentEntity);
						
					}break;
					case 1:
					{
						currentEntity = new Textbox(120,320,"Don't listen to them.",storytellerPortrait, true);
						FP.world.add(currentEntity);
					}break;
					case 2:
					{
						currentEntity = new Textbox(32,320,"Are they just part of the story? Are they the evils that you told me about?",listenerPortrait);
						FP.world.add(currentEntity);
					}break;
					case 3:
					{
						currentEntity = new Textbox(120, 320, "Yes...you've been listening. Thank you.", storytellerPortrait, true);
						FP.world.add(currentEntity);
					}break;
					case 4:
					{
						currentEntity = new Textbox(32,320,"Ah...", listenerPortrait);
						FP.world.add(currentEntity);
					}break;
					case 5:
					{
						currentEntity = new Textbox(120, 320, "This world is so beautiful, yet fragile.", storytellerPortrait, true);
						FP.world.add(currentEntity);
					}break;
					case 6:
					{
						currentEntity = new Textbox(32,320,"Beautiful. This is the River of Time, yes? It holds a lot of memories...I hope you're fond of them. But how is this fragile?", listenerPortrait);
						FP.world.add(currentEntity);
					}break;
					case 7:
					{
						currentEntity = new Textbox(120, 320, "It is fragile, and delicate...because I could burn the drawings...destroy the memories. And then it would die.", storytellerPortrait, true);
						FP.world.add(currentEntity);
					}break;
					case 8:
					{
						scene.fadeIn();
					}break;
					case 9:
					{
						currentEntity = new Textbox(32,320,"You wouldn't really do that, would you?", listenerPortrait);
						FP.world.add(currentEntity);
					}break;
					case 10:
					{
						currentEntity = new Textbox(120, 320,"Would you fight for this world if I were to try and destroy it?",storytellerPortrait, true);
						FP.world.add(currentEntity);
					}break;
					case 11:
					{
						currentEntity = new Textbox(32,320,"...I guess so. This is your world. It deserves to live.", listenerPortrait);
						FP.world.add(currentEntity);
					}break;
					case 12:
					{
						currentEntity = new Textbox(120, 320,"You are a strange person. You'd save my world. Is that noble, or foolish?", storytellerPortrait, true);
						FP.world.add(currentEntity);
					}break;
					case 13:
					{
						scene.fadeOut();
						currentEntity = new Textbox(32,320,"...", listenerPortrait);
						FP.world.add(currentEntity);
					}break;
					case 14:
					{
						currentEntity = new FadeText("The hero had known that one of the shards of the mirror lie at the bottom of the river.");		
						FP.world.add(currentEntity);
						
					}break;
					case 15:
					{
						currentEntity = new FadeText("The villain, not wanting him to collect the whole mirror, froze the river over.");		
						FP.world.add(currentEntity);
						
					}break;
					case 16:
					{
						currentEntity = new FadeText("But the river didn't stay frozen. And the shard was collected by the hero nonetheless.");		
						FP.world.add(currentEntity);
						
					}break;
					case 17:
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