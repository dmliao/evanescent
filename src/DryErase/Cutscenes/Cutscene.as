package DryErase.Cutscenes
{
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

	public class Cutscene extends Entity
	{
		public var skip:Boolean;
		public var skipText:Text = new Text("",0,0);
		public var flag:Boolean = false;
		public var enterCount:Number = 0;
		public function Cutscene()
		{
			layer = -999999999;
		}
		override public function update():void
		{
			if (flag == false)
			{
				flag = true;
				skipText = new Text("Press " + Key.name(Input.keys("skipCutscene")[0]) + " twice to skip cutscene.");
				skipText.color = 0x000000;
				skipText.font = "mainFont";
			//	skipText.align = "center";
				skipText.size = 10;
				skipText.alpha = 0.5;
			}
			if (Input.pressed("skipCutscene"))
			{
				enterCount += 1;
				if (enterCount == 1)
				{
					skipText.text = "Press " + Key.name(Input.keys("skipCutscene")[0]) + " once more to skip cutscene.";
				}
				if (enterCount == 2)
				{
					skip = true;
				}
			}
			super.update();
			if (skip == true)
			{
				skipped();
			}
		}
		public function skipped():void
		{
			//DO SOMETHING!
			Main.saveGame();
			FP.world.remove(this);
		}
		public function endCutscene():void
		{
			Main.saveGame();
			FP.world.remove(this);
		}
		override public function render():void
		{
			skipText.render(FP.buffer, new Point(4,4),FP.camera);
		}
	}
	
}