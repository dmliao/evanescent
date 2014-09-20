package DryErase.Enemies.River.WaveControl
{
	import DryErase.Enemies.Generic.WaveControl.Wave;
	import DryErase.Enemies.River.Enemies.RLilypadR;
	
	import com.debug.Debug;
	
	import net.flashpunk.FP;
	
	public class RLilypadWaveR extends Wave
	{
		public function RLilypadWaveR()
		{
			super(0,0,12,3);
		}
		override public function update():void
		{
			waveTimer += FP.elapsed;
			
			if (waveTimer >= delay)
			{
				if (counter < waveTotalCount)
				{
					FP.world.add(new RLilypadR(120 + Math.random()*400));
					counter += 1;
					
					waveTimer = 0;
				}
				
			}
		}
	}
}