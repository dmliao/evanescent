package lib
{
	import net.flashpunk.FP;
	
	public class Quake
	{
		protected var intensity:Number=0;
		
		public function start(intensity:Number = 25):void
		{
			stop();
			this.intensity = intensity;
		}
		
		public function stop():void
		{
			
			intensity = 0;
		}
		
		public function update():void
		{
			if(intensity > 0)
			{
				intensity--;
				if(intensity <= 0)
				{
					stop();
				}
				else
				{
					FP.screen.x += Math.random() * intensity * 2 - intensity;
					FP.screen.y += Math.random() * intensity * 2 - intensity;
				}
			}
		}
	}
}