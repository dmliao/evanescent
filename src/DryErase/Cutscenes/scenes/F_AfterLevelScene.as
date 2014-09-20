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
	
	public class F_AfterLevelScene extends Cutscene
	{
		//PORTRAITS
		public var listenerPortrait:Image = new Image(Assets.PORTRAIT_LISTENER_NORMAL);
		public var storytellerPortrait:Image = new Image(Assets.PORTRAIT_STORYTELLER);
		public var currentEntity:SceneEntity;
		
		public var sceneNumber:Number = 0;
		public var cutsceneTimer:Number = 0;
		public var pauseTimer:Number = 2;
		
		public var scene:SceneEntity = new SceneEntity(0,0,new Image(Assets.CLEARFOREST));
		public var activate:Boolean = false;
		public function F_AfterLevelScene()
		{
			currentEntity = new FadeText("Dar");
			FP.world.add(scene);
			super();
		}
		public function init():void
		{
			scene = new SceneEntity(0,0,new Image(Assets.CLEARFOREST));
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
						currentEntity = new Textbox(120,320,"Thank you...for coming here and listening to...no, being a part of, this story. You're the first one.",storytellerPortrait,true);
						FP.world.add(currentEntity);
					}break;
					case 1:
					{
						currentEntity = new Textbox(32,320,"This is your pride and joy. I'm glad that I could help. Although Tau and Muon's words were a little unnerving.",listenerPortrait);
						FP.world.add(currentEntity);
					}break;
					case 2:
					{
						currentEntity = new Textbox(120,320,"They wanted to cheer me up. I'd been lonely before, and they just wanted to help. Nobody liked my world.",storytellerPortrait,true);
						FP.world.add(currentEntity);
					}break;
					case 3:
					{
						currentEntity = new Textbox(32,320,"I like it. It's beautiful, but sort of sad.",listenerPortrait);
						FP.world.add(currentEntity);
					}break;
					case 4:
					{
						currentEntity = new Textbox(120,320,"Sad? Why is that?",storytellerPortrait,true);
						FP.world.add(currentEntity);
					}break;
					case 5:
					{
						currentEntity = new Textbox(32,320,"It's your world...and you're the only one in it. And you said you were lonely. That by itself is sad.",listenerPortrait);
						FP.world.add(currentEntity);
					}break;
					case 6:
					{
						currentEntity = new Textbox(120,320,"Don't worry. It's not sad. I'm alone because the world hates me.",storytellerPortrait,true);
						FP.world.add(currentEntity);
					}break;
					case 7:
					{
						currentEntity = new Textbox(32,320,"How do you know the world hates you? What makes you say that?",listenerPortrait);
						FP.world.add(currentEntity);
					}break;
					case 8:
					{
						currentEntity = new Textbox(120,320,"It is simple. I hate the world. So the world must hate me.",storytellerPortrait,true);
						FP.world.add(currentEntity);
					}break;
					case 9:
					{
						scene.fadeIn();
					}break;
					case 10:
					{
						currentEntity = new Textbox(120,320,"Sorry...maybe you should leave now. You look uncomfortable.",storytellerPortrait,true);
						FP.world.add(currentEntity);
					}break;
					case 11:
					{
						currentEntity = new Textbox(32,320,"No. I was like you, once. That's why I need to stay, have you show me what you never had a chance to say.",listenerPortrait);
						FP.world.add(currentEntity);
					}break;
					case 12:
					{
						scene.fadeOut();
						currentEntity = new Textbox(120,320,"Show you the things I never had a chance to say? If so...you won't like what you see.",storytellerPortrait,true);
						FP.world.add(currentEntity);
					}break;
					case 13:
					{
						currentEntity = new Textbox(32,320,"...",listenerPortrait);
						FP.world.add(currentEntity);
					}break;
					case 14:
					{
						currentEntity = new FadeText("The trek through the forest had lasted a whole day and night, and the hero didn't find any mirror shards.");
						FP.world.add(currentEntity);
					}break;
					case 15:
					{
						currentEntity = new FadeText("But the Rabbit and the Wolf crossed his path at the break of dawn, and he found with them a shard of the mirror.");
						FP.world.add(currentEntity);
					}break;
					case 16:
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