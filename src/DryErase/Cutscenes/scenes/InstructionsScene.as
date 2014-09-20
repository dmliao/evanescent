package DryErase.Cutscenes.scenes
{
	import DryErase.Cutscenes.Cutscene;
	import DryErase.Cutscenes.FadeText;
	import DryErase.Cutscenes.SceneEntity;
	
	import Worlds.classes.Title.WorldMap;
	
	import flash.geom.Point;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

	public class InstructionsScene extends Cutscene
	{
		public var sceneNumber:Number = 0;
		
		//PORTRAITS
		public var listenerPortrait:Image = new Image(Assets.PORTRAIT_LISTENER_NORMAL);
		public var storytellerPortrait:Image = new Image(Assets.PORTRAIT_LISTENER_SHOCKED);
		public var currentEntity:SceneEntity;
		
		public var pauseTimer:Number = 2;

		public var scene:SceneEntity;
		public var scene2:SceneEntity;
		
		public var activate:Boolean = false;
		
		public var leftButtonText:Text;
		public var rightButtonText:Text;
		public var upButtonText:Text;
		public var downButtonText:Text;
		public var shootButtonText:Text;
		public var specialButtonText:Text;
		public var shiftButtonText:Text;
		public var pauseButtonText:Text;
		public function InstructionsScene()
		{
			
			
			super();
			scene = new SceneEntity(0,0,new Image(Assets.INSTRUCTIONS));
			scene2 = new SceneEntity(0,0,new Image(Assets.WMAPSCENE));
			
			currentEntity = new FadeText("Dar");
			layer = -99999999999;
			
		}
		public function init():void
		{
			
				leftButtonText = new Text(Key.name(Input.keys("left")[0]),0,0);
				leftButtonText.color=0x000000;
				leftButtonText.size=12;
				leftButtonText.font = "mainFont";
				leftButtonText.centerOO();
				leftButtonText.alpha = 0.3;
				
				rightButtonText = new Text(Key.name(Input.keys("right")[0]),0,0);
				rightButtonText.color=0x000000;
				rightButtonText.size=12;
				rightButtonText.font = "mainFont";
				rightButtonText.centerOO();
				rightButtonText.alpha = 0.3;
				
				upButtonText = new Text(Key.name(Input.keys("up")[0]),0,0);
				upButtonText.color=0x000000;
				upButtonText.size=12;
				upButtonText.font = "mainFont";
				upButtonText.centerOO();
				upButtonText.alpha = 0.3;
				
				downButtonText = new Text(Key.name(Input.keys("down")[0]),0,0);
				downButtonText.color=0x000000;
				downButtonText.size=12;
				downButtonText.font = "mainFont";
				downButtonText.centerOO();
				downButtonText.alpha = 0.3;
				
				shootButtonText = new Text(Key.name(Input.keys("shoot")[0]),0,0);
				shootButtonText.color=0x000000;
				shootButtonText.size=12;
				shootButtonText.font = "mainFont";
				shootButtonText.centerOO();
				shootButtonText.alpha = 0.3;
				
				specialButtonText = new Text(Key.name(Input.keys("special")[0]),0,0);
				specialButtonText.color=0x000000;
				specialButtonText.size=12;
				specialButtonText.font = "mainFont";
				specialButtonText.centerOO();
				specialButtonText.alpha = 0.3;
				
				shiftButtonText = new Text(Key.name(Input.keys("start")[0]),0,0);
				shiftButtonText.color=0x000000;
				shiftButtonText.size=12;
				shiftButtonText.font = "mainFont";
				shiftButtonText.centerOO();
				shiftButtonText.alpha = 0.3;
				
				pauseButtonText = new Text("Pause: " + Key.name(Input.keys("pause")[0]),0,0);
				pauseButtonText.color=0x000000;
				pauseButtonText.size=12;
				pauseButtonText.font = "mainFont";
				pauseButtonText.centerOO();
				pauseButtonText.alpha = 0.3;
				
			
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
						currentEntity.deleteOut();
						scene.fadeIn();
						
					}break;
					case 1:
					{
						currentEntity = new FadeText("", true);
						FP.world.add(currentEntity);
					}break;
					case 2:
					{
						scene.deleteOut();
					}break;
					case 3:
					{
						currentEntity = new FadeText("Listen to me. Hear my words...hear me speak.");
						FP.world.add(currentEntity);
					}break;
					case 4:
					{
						currentEntity = new FadeText("This is my world.");
						FP.world.add(currentEntity);
						
					}break;
					case 5:
					{
						scene2.fadeIn(0.05);
					}break;
					case 6:
					{
						currentEntity = new FadeText("Once upon a time, there was a hero, and a world. And the world was ruled by evil...");
						FP.world.add(currentEntity);
					}break;
					case 7:
					{
						currentEntity = new FadeText("An evil that could only be sealed by 5 shards of a magic mirror.");
						FP.world.add(currentEntity);
					}break;
					case 8:
					{
						currentEntity = new FadeText("So the hero set off to this strange world, and resolved to obtain the shards...");
						FP.world.add(currentEntity);
					}break;
					case 9:
					{
						currentEntity = new FadeText("...and to vanquish this evil so the world could live.");
						FP.world.add(currentEntity);
					}break;
					case 10:
					{
						scene2.deleteOut();
						
					}break;
					case 11:
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
		override public function skipped():void
		{
			FP.world = new WorldMap();
		}
		override public function endCutscene():void
		{
			FP.world = new WorldMap();
		}
		override public function render():void
		{
			super.render();
			if (scene.deleted == false && scene.fadeInFlag == true)
			{
				leftButtonText.render(FP.buffer, new Point(416, 116), FP.camera);
				rightButtonText.render(FP.buffer, new Point(610, 116), FP.camera);
				upButtonText.render(FP.buffer, new Point(512, 32), FP.camera);
				downButtonText.render(FP.buffer, new Point(512, 192), FP.camera);
				shootButtonText.render(FP.buffer, new Point(70, 190), FP.camera);
				specialButtonText.render(FP.buffer, new Point(162, 190), FP.camera);
				shiftButtonText.render(FP.buffer, new Point(308, 184), FP.camera);
				pauseButtonText.render(FP.buffer, new Point(596, 28), FP.camera);
			}
		}
	}
}