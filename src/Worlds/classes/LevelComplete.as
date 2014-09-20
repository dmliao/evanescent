package Worlds.classes
{
	import DryErase.Cutscenes.ArcadeLevelTally;
	import DryErase.Cutscenes.LevelCompleteTally;
	
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;

	public class LevelComplete extends World
	{
		public function LevelComplete()
		{
			add(new Entity(0,0,new Image(Assets.TITLE_BACK)));
			if (Main.isArcade)
			{
				add(new ArcadeLevelTally());
			}
			else
			{
				add(new LevelCompleteTally());
			}
		}
	}
}