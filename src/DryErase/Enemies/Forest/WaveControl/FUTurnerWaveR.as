package DryErase.Enemies.Forest.WaveControl
{
	import DryErase.Enemies.Forest.Enemies.FUTurnerR;
	import DryErase.Enemies.Generic.WaveControl.Wave;
	import DryErase.Enemies.River.Enemies.RUturnerI;
	
	import net.flashpunk.FP;
	
	public class FUTurnerWaveR extends Wave
	{
		public function FUTurnerWaveR()
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
					FP.world.add(new FUTurnerR());
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
	}
}