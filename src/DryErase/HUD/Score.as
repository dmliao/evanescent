package DryErase.HUD 
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	
	import Main;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import DryErase.Hero.Listener;
	import net.flashpunk.graphics.Text;
	/**
	 * ...
	 * @author 
	 */
	public class Score extends Entity
	{
		
		private var scoreText:Text;
		private var title:Text;
		
		private var hudImagination:Image;
		private var hudReality:Image;
		
		private var scoreString:String;
		private var zeroNum:Number;
		
		public function Score() 
		{
			scoreString = String(Main.currentScore);
			
			zeroNum = 8 - scoreString.length;
			
			hudImagination = new Image(Assets.SCORE_IMAGINATION);
			hudImagination.alpha = 1;
			hudImagination.centerOO();
			
			hudReality = new Image(Assets.SCORE_REALITY);
			hudReality.alpha = 0;
			hudReality.centerOO();
			
			scoreText = new Text("000000000");
			scoreText.font = "mainFont";
			title = new Text("SCORE");
			title.font = "mainFont";
			
			title.alpha = 0.5;
			title.size = 12;
			title.smooth = true;
			title.color = 0x000000;
			
			layer = -99999999;
			scoreText.alpha = 0.75;
			scoreText.smooth = true;
			scoreText.scale = 1;
			scoreText.size = 20;
			scoreText.color = 0x000000;
			//graphic = scoreText;
			x = 320 - scoreText.width / 2;
			y = 12;
		}
		
		override public function update():void
		{
			Transition();
			scoreString = String(Main.currentScore);
			zeroNum = 8 - scoreString.length;
			switch (zeroNum) 
			{
				case 0:
				{
					scoreText.text = (scoreString);
				}break;
				case 1:
				{
					scoreText.text = ("0" + scoreString);
				}break;
				case 2:
				{
					scoreText.text = ("00" + scoreString);
				}break;
				case 3:
				{
					scoreText.text = ("000" + scoreString);
				}break;
				case 4:
				{
					scoreText.text = ("0000" + scoreString);
				}break;
				case 5:
				{
					scoreText.text = ("00000" + scoreString);
				}break;
				case 6:
				{
					scoreText.text = ("000000" + scoreString);
				}break;
				case 7:
				{
					scoreText.text = ("0000000" + scoreString);
				}break;
				case 8:
				{
					scoreText.text = ("00000000");
				}break;
			}
			
		}
		
		public function Transition():void
		{
			if (Listener.isTransitioning == false)
			{
				//return;
			}
			else
			if (Listener.currentField == false)
			{
				if (hudImagination.alpha > 0)
				{
					hudImagination.alpha -= 0.05 * Main.frameRate * FP.elapsed;
				}
				if (hudReality.alpha < 1)
				{
					hudReality.alpha += 0.05 * Main.frameRate * FP.elapsed;
				}
			}
			else
			{
				if (hudImagination.alpha < 1)
				{
					hudImagination.alpha += 0.05 * Main.frameRate * FP.elapsed;
				}
				if (hudReality.alpha > 0)
				{
					hudReality.alpha -= 0.05 * Main.frameRate * FP.elapsed;
				}
			}
		}
		
		override public function render():void
		{
			scoreText.render(FP.buffer,new Point(320 - scoreText.width / 2 + 4, 10), FP.camera);
			super.render();
			title.render(FP.buffer, new Point(320 - title.width / 2 * title.scale + 4, 0), FP.camera);
			
			hudImagination.render(FP.buffer, new Point(318, 24), FP.camera);
			hudReality.render(FP.buffer, new Point(318, 24), FP.camera);
		}
		
	}

}