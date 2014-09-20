package DryErase.Enemies.Forest.WaveControl
{
	import DryErase.Enemies.Forest.Enemies.FUTurnerI;
	import DryErase.Enemies.Generic.WaveControl.Wave;
	import DryErase.Enemies.River.Enemies.RUturnerI;
	
	import net.flashpunk.FP;
	
	public class FUTurnerWaveI extends Wave
	{
		public function FUTurnerWaveI()
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
					FP.world.add(new FUTurnerI());
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
	}
}