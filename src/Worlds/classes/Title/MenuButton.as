package Worlds.classes.Title
{
	
	import net.flashpunk.graphics.Text;

	public class MenuButton extends Text
	{
		public var targetAlpha:Number;
		public var targetScale:Number;
		public var fadeSpeed:Number = 0.085;
		public var fadeSpeed2:Number = 0.005;
		public var yy:Number;
		public var previousY:Number;
		public var selected:Boolean = false;
		public function MenuButton(text:String, startAlpha:Number = 1)
		{
			super(text);
			targetAlpha = startAlpha;
			alpha = startAlpha;
			
			scale = 1;
			targetScale = 1;
			
			smooth = true;
			
			yy = y;
			previousY = y;
			
			font = "mainFont";
			size = 17;
			
			centerOO();
			
			color = 0x000000;
		}
		override public function update():void
		{
			if (alpha > targetAlpha + fadeSpeed)
			{
				alpha -= fadeSpeed;
			}
			else if (alpha < targetAlpha - fadeSpeed)
			{
				alpha += fadeSpeed;
			}
			else
			{
				alpha = targetAlpha;
			}
			if (scale > targetScale + fadeSpeed2)
			{
				scale -= fadeSpeed2;
			}
			else if (scale < targetScale - fadeSpeed2)
			{
				scale += fadeSpeed2;
			}
			else
			{
				scale = targetScale;
			}
			/*if (y > yy)
			{
				y -= 1;
			}
			else if (y < yy)
			{
				y += 1;
			}*/
			if (TitleMenu.superVisible == true)
			{
				if (selected == false)
				{
					//yy = previousY;
					scale = 1;
					targetAlpha = 0.3;
				}
				else
				{
					//yy = previousY;
					scale = 1.5;
					targetAlpha = 1;
				}
			}
			else
			{
				targetAlpha = 0;
			}
		}
	}
}