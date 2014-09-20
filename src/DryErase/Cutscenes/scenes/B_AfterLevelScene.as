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
	
	public class B_AfterLevelScene extends Cutscene
	{
		//PORTRAITS
		public var listenerPortrait:Image = new Image(Assets.PORTRAIT_LISTENER_NORMAL);
		public var storytellerPortrait:Image = new Image(Assets.PORTRAIT_STORYTELLER);
		public var currentEntity:SceneEntity;
		
		public var sceneNumber:Number = 0;
		public var cutsceneTimer:Number = 0;
		public var pauseTimer:Number = 2;
		
		public var scene:SceneEntity = new SceneEntity(0,0,new Image(Assets.CLEARFLOWER));
		public var activate:Boolean = false;
		public function B_AfterLevelScene()
		{
			currentEntity = new FadeText("Dar");
			FP.world.add(scene);
			super();
		}
		public function init():void
		{
			scene = new SceneEntity(0,0,new Image(Assets.CLEARFLOWER));
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
						currentEntity = new Textbox(32,320,"There you are. I was getting worried.",listenerPortrait);
						FP.world.add(currentEntity);
						
					}break;
					case 1:
					{
						currentEntity = new Textbox(120,320,"Why?",storytellerPortrait, true);
						FP.world.add(currentEntity);
						
					}break;
					case 2:
					{
						currentEntity = new Textbox(32,320,"Because this whole place burned down. And the fire...was real. See? It burned me a little.",listenerPortrait);
						FP.world.add(currentEntity);
						
					}break;
					case 3:
					{
						currentEntity = new Textbox(120,320,"I'm sorry! I'm sorry...I was the one that set fire to this place.",storytellerPortrait, true);
						FP.world.add(currentEntity);
						
					}break;
					case 4:
					{
						currentEntity = new Textbox(32,320,"It's alright. But why did you destroy it?",listenerPortrait);
						FP.world.add(currentEntity);
						
					}break;
					case 5:
					{
						currentEntity = new Textbox(120,320,"It's for the sake of the story. And this land was useless to me, anyways.",storytellerPortrait, true);
						FP.world.add(currentEntity);
						
					}break;
					case 6:
					{
						scene.fadeIn();
					}break;
					case 7:
					{
						currentEntity = new Textbox(32,320,"...",listenerPortrait);
						FP.world.add(currentEntity);
						
					}break;
					case 8:
					{
						scene.fadeOut();
					}break;
					case 9:
					{
						currentEntity = new FadeText("He had fought valiently in the field of flowers, striving to protect all life.");
						FP.world.add(currentEntity);
					}break;
					case 10:
					{
						currentEntity = new FadeText("Sadly, he did not save the flowers from the villain's fire, and the field burned to dust.");
						FP.world.add(currentEntity);
					}break;
					case 11:
					{
						currentEntity = new FadeText("Though not all hope was lost...because sitting in the rubble, lay a shard of the mirror.");
						FP.world.add(currentEntity);
					}break;
					case 12:
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