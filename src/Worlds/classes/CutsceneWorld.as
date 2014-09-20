package Worlds.classes
{
	import DryErase.Cutscenes.Cutscene;
	import DryErase.Cutscenes.scenes.PrologueScene;
	
	import Worlds.classes.Title.TitleBackground;
	
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;

	public class CutsceneWorld extends World
	{
		public var obj:Entity;
		public var playMusic:Boolean;
		public function CutsceneWorld(sceneObject:Entity, sceneMusic:Boolean = true)
		{
			super();
			add(new Entity(0,0,new Image(Assets.TITLE_BACK)));
			obj = sceneObject;
			add(sceneObject);
			playMusic = sceneMusic;
		}
		override public function begin():void
		{
			super.begin();
			if (playMusic)
			{
			SoundManager.currentMusic = SoundManager.musicAwaken;
			}
		}
	}
}