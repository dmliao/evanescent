package Worlds.classes.Backgrounds
{
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class Forest_Night extends Entity
	{
		public var g:Image =new Image(Assets.FOREST_NIGHT);
		public var glare:Image = new Image(Assets.glare);
		public static var sunrise:Boolean;
		public function Forest_Night()
		{
			
			super(0,0,g);
			g.alpha = 0;
			g.blend = "multiply";
			layer = 5;
			sunrise = false;
			
			glare.blend = "add";
			glare.alpha = 0;
		}
		override public function update():void
		{
			super.update();
			if (sunrise == false)
			{
			if (g.alpha < 0.6)
			{
				g.alpha += 0.0003;
			}
			else
			{
				g.alpha = 0.6;
			}
			}
			else
			{
				g.alpha -= 0.001;
				if (glare.alpha < 0.3)
				{
					glare.alpha += 0.001;
				}
				
			}
		}
		override public function render():void
		{
			super.render(); 
			glare.render(FP.buffer, new Point(0,0), FP.camera);
		}
	}
}