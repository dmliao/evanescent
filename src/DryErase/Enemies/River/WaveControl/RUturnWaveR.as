package DryErase.Enemies.River.WaveControl
{
	import DryErase.Enemies.Generic.WaveControl.Wave;
	import DryErase.Enemies.River.Enemies.RUTurnerR;
	import DryErase.Enemies.River.Enemies.RUturnerI;
	
	import net.flashpunk.FP;
	
	public class RUturnWaveR extends Wave
	{
		public function RUturnWaveR()
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
					FP.world.add(new RUTurnerR());
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
	}
}