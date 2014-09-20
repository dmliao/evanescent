package DryErase.Cutscenes.scenes
{
	import DryErase.Cutscenes.Cutscene;
	import DryErase.Cutscenes.FadeText;
	import DryErase.Cutscenes.FullTextBox;
	import DryErase.Cutscenes.SceneEntity;
	import DryErase.Cutscenes.Textbox;
	
	import Worlds.classes.CutsceneWorld;
	import Worlds.classes.Title.TitleWorld;
	import Worlds.classes.Title.WorldMap;
	
	import com.debug.Debug;
	
	import flash.display.BitmapData;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	
	public class BeforeScene extends Cutscene
	{
		public var sceneNumber:Number = 0;
		
		//PORTRAITS
		public var shockedPortrait:Image;
		public var currentEntity:SceneEntity;
		
		public var scene:SceneEntity;
		public var scene2:SceneEntity;
		
		public var activate:Boolean = false;
		
		public var pauseTimer:Number = 0.4;
		
		
		public function BeforeScene()
		{
			super();
			x=0;
			y=0;
	
			shockedPortrait = new Image(Assets.PROLOGUE);
			
			shockedPortrait.alpha = 0;
			
			scene2 = new SceneEntity(0,0,new Image(Assets.PROLOGUE2));
			currentEntity = new FullTextBox(32,48,"This is a story of a girl I once knew, a girl whose name escapes me now."+ String.fromCharCode(10) + String.fromCharCode(10) + "She was writing a story, and drawing a world. She created a universe, in a place where nobody could ever see. She beckoned me over, and asked me if I wanted to listen to that story she'd made. I had time and curiosity to spare, and I made her a promise. A promise to listen to her story and become a part of her world."+ String.fromCharCode(10) + String.fromCharCode(10) + "She was the Storyteller. I became the Listener. And I plunged into a world of dreams...",new Image(new BitmapData(1,1,true,0x000000)),false);
			
		}
		public function init():void
		{
			FP.world.addGraphic(shockedPortrait,-99999,0,0);
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
			
			if (shockedPortrait.alpha < 0.2)
			{
				shockedPortrait.alpha += 0.005;
			}
			if (pauseTimer < 0 && pauseTimer > -10)
			{
				switch (sceneNumber)
				{
					case 0:
					{
						
						FP.world.add(currentEntity);
						
					}break;
					
					case 1:
					{
						FP.world = new TitleWorld();
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
			FP.world = new TitleWorld();
		}
	}
}