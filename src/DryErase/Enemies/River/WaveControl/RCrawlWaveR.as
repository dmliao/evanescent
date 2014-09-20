package DryErase.Enemies.River.WaveControl
{
	import DryErase.Enemies.Generic.WaveControl.Wave;
	import net.flashpunk.FP;
	import DryErase.Enemies.River.Enemies.RCrawlerR;
	
	public class RCrawlWaveR extends Wave
	{
		public function RCrawlWaveR()
		{
			super(0,0,8,2.5);
		}
		
		override public function update():void
		{
			waveTimer += FP.elapsed;
			
			if (waveTimer >= delay)
			{
				if (counter < waveTotalCount)
				{
					FP.world.add(new RCrawlerR(200+Math.random()*240));
					counter += 1;
					
					waveTimer = 0;
				}
				
			}
		}
	}
}