package DryErase.Enemies.River.WaveControl
{
	import DryErase.Enemies.Generic.WaveControl.Wave;
	import DryErase.Enemies.River.Enemies.RLilipadI;
	
	import com.debug.Debug;
	
	import net.flashpunk.FP;

	public class RLilypadWaveI extends Wave
	{
		public function RLilypadWaveI()
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
					FP.world.add(new RLilipadI(120 + Math.random()*400));
					counter += 1;

					waveTimer = 0;
				}
				
			}
		}
	}
}