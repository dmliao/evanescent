package lib
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Canvas;
	import net.flashpunk.utils.Draw;
	
	public class Flash
	{	
		protected var alpha:Number = 0;
		protected var alphaSubtract:Number = 0;
		
		protected var colour:uint = 0xFFFFFF;
		
		protected var buffer:Canvas = new Canvas(FP.width, FP.height);
		
		public function start(colour:uint = 0xFFFFFF, duration:Number = 0.5, alpha:Number = 1):void
		{
			stop();
			this.colour = colour;
			this.alpha = alpha;
			
			alphaSubtract = 1/duration * alpha;
		}
		
		public function stop():void
		{
			alpha = 0;
		}
		
		public function update():void
		{
			if(alpha > 0)
			{
				alpha -= alphaSubtract * FP.elapsed;
			}
		}
		
		public function render():void
		{
			if(alpha > 0) 
			{
				buffer.fill(new Rectangle(0, 0, buffer.width, buffer.height), colour, alpha);
				buffer.render(FP.buffer, new Point, new Point);
			}
		}
	}
}