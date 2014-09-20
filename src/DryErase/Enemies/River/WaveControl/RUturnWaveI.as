package DryErase.Enemies.River.WaveControl
{
	import DryErase.Enemies.Generic.WaveControl.Wave;
	import DryErase.Enemies.River.Enemies.RUturnerI;
	
	import net.flashpunk.FP;

	public class RUturnWaveI extends Wave
	{
		public function RUturnWaveI()
		{
			super(0,0,5,1);
		}
		override public function update():void
		{
			waveTimer += FP.elapsed;
			
			if (waveTimer >= delay)
			{
				if (counter < waveTotalCount)
				{
					FP.world.add(new RUturnerI());
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
	}
}