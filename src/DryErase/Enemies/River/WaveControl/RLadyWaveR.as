package DryErase.Enemies.River.WaveControl
{
	import DryErase.Enemies.Generic.WaveControl.Wave;
	import DryErase.Enemies.River.Enemies.RLadybirdR;
	
	import net.flashpunk.FP;

	public class RLadyWaveR extends Wave
	{
		public function RLadyWaveR()
		{
			super(0,0,10,1);
		}
		override public function update():void
		{
			waveTimer += FP.elapsed;
			
			if (waveTimer >= delay)
			{
				if (counter < waveTotalCount)
				{
					FP.world.add(new RLadybirdR()); 
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
	}
}