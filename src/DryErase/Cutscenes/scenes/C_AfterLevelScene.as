package DryErase.Cutscenes.scenes
{
	import DryErase.Cutscenes.Cutscene;
	import DryErase.Cutscenes.FadeText;
	import DryErase.Cutscenes.SceneEntity;
	import DryErase.Cutscenes.Textbox;
	
	import Worlds.classes.Title.WorldMap;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class C_AfterLevelScene extends Cutscene
	{
		//PORTRAITS
		public var listenerPortrait:Image = new Image(Assets.PORTRAIT_LISTENER_NORMAL);
		public var storytellerPortrait:Image = new Image(Assets.PORTRAIT_STORYTELLER);
		public var currentEntity:SceneEntity;
		
		public var sceneNumber:Number = 0;
		public var cutsceneTimer:Number = 0;
		public var pauseTimer:Number = 2;
		
		public var scene:SceneEntity = new SceneEntity(0,0,new Image(Assets.ENCOUNTERLUNG));
		public var muon:SceneEntity = new SceneEntity(0,0,new Image(Assets.ENCOUNTERLUNG));
		public var tau:SceneEntity = new SceneEntity(0,0,new Image(Assets.ENCOUNTERLUNG));
		public var lung:SceneEntity = new SceneEntity(0,0,new Image(Assets.ENCOUNTERLUNG));
		public var guey:SceneEntity = new SceneEntity(0,0,new Image(Assets.ENCOUNTERLUNG));
		public var hero:SceneEntity = new SceneEntity(0,0,new Image(Assets.ENCOUNTERLUNG));
		public var activate:Boolean = false;
		public function C_AfterLevelScene()
		{
			currentEntity = new FadeText("Dar");
			FP.world.add(scene);
			super();
		}
		public function init():void
		{
			scene = new SceneEntity(0,0,new Image(Assets.CLEARCASTLE));
			
			muon = new SceneEntity(0,0,new Image(Assets.MUONPLUSH));
			tau = new SceneEntity(0,0,new Image(Assets.TAUPLUSH));
			lung = new SceneEntity(0,0,new Image(Assets.LUNGPLUSH));
			guey = new SceneEntity(0,0,new Image(Assets.GUEYPLUSH));
			hero = new SceneEntity(0,0,new Image(Assets.HEROPLUSH));
			
			FP.world.add(scene);
			FP.world.add(muon);
			FP.world.add(tau);
			FP.world.add(lung);
			FP.world.add(guey);
			FP.world.add(hero);
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
						currentEntity = new Textbox(120,320,"I don't get you. Why are you still here? Are you afraid of the world?",storytellerPortrait,true);
						FP.world.add(currentEntity);
						
					}break;
					case 1:
					{
						currentEntity = new Textbox(32,320,"No. That's not why I'm here. I'm here to see your world...and it is a beautiful one.",listenerPortrait);
						FP.world.add(currentEntity);
						
					}break;
					case 2:
					{
						currentEntity = new Textbox(120,320,"It is? Doesn't that mean that the real world is not?",storytellerPortrait,true);
						FP.world.add(currentEntity);
						
					}break;
					case 3:
					{
						currentEntity = new Textbox(32,320,"That's not right either. The real world is fine. You show me your world, and I'll show you mine.",listenerPortrait);
						FP.world.add(currentEntity);
						
					}break;
					case 4:
					{
						currentEntity = new Textbox(120,320,"I don't like the world. It's so big, dark...and complicated. This is my home.",storytellerPortrait,true);
						FP.world.add(currentEntity);
						
					}break;
					case 5:
					{
						currentEntity = new Textbox(32,320,"The real world is a lot like this one...There's a lot of darkness in the world, but a lot of beauty too.",listenerPortrait);
						FP.world.add(currentEntity);
						
					}break;
					case 6:
					{
						currentEntity = new Textbox(120,320,"My friends say that you are wrong.",storytellerPortrait,true);
						FP.world.add(currentEntity);
						
					}break;
					case 7:
					{
						currentEntity = new Textbox(32,320,"Your...friends?",listenerPortrait);
						FP.world.add(currentEntity);
						
					}break;
					case 8:
					{
						currentEntity = new FadeText("Without a word, she had pulled out a few stuffed animals and given them to me.");
						FP.world.add(currentEntity);
						
					}break;
					case 9:
					{
						currentEntity = new FadeText("Her friends. They were all there.");
						FP.world.add(currentEntity);
						
					}break;
					case 10:
					{
						muon.fadeIn();
					}break;
					case 11:
					{
						currentEntity = new FadeText("Muon.");
						FP.world.add(currentEntity);
						
					}break;
					case 12:
					{
						muon.fadeOut();
						tau.fadeIn();
					}break;
					case 13:
					{
						currentEntity = new FadeText("Tau.");
						FP.world.add(currentEntity);
						
					}break;
					case 14:
					{
						tau.fadeOut();
						lung.fadeIn();
					}break;
					case 15:
					{
						currentEntity = new FadeText("Lung.");
						FP.world.add(currentEntity);
						
					}break;
					case 16:
					{
						lung.fadeOut();
						guey.fadeIn();
					}break;
					case 17:
					{
						currentEntity = new FadeText("Guey.");
						FP.world.add(currentEntity);
						
					}break;
					case 18:
					{
						guey.fadeOut();
						hero.fadeIn();
					}break;
					case 19:
					{
						currentEntity = new FadeText("And Hero.");
						FP.world.add(currentEntity);
						
					}break;
					case 20:
					{
						hero.fadeOut();
					}break;
					case 21:
					{
						currentEntity = new Textbox(120,320,"They say I shouldn't let you here. That this is my world alone. But you're the first real person that has listened to me.",storytellerPortrait,true);
						FP.world.add(currentEntity);
						
					}break;
					case 22:
					{
						scene.fadeIn();
						currentEntity = new Textbox(120,320,"Will you stand by me?",storytellerPortrait,true);
						FP.world.add(currentEntity);
						
					}break;
					case 24:
					{
						currentEntity = new FadeText("Come to me...Listener. The fifth shard is yours.");
						FP.world.add(currentEntity);
						
					}break;
					case 25:
					{
						currentEntity = new FadeText("And the rest shall fall to ash...");
						FP.world.add(currentEntity);
						
					}break;
					case 26:
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