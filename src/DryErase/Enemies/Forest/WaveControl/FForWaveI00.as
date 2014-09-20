package DryErase.Enemies.Forest.WaveControl
{
	import DryErase.Enemies.Forest.Enemies.FForPauseI;
	import DryErase.Enemies.Generic.WaveControl.Wave;
	import DryErase.Enemies.Mountain.Enemies.ForPauseM;
	
	import net.flashpunk.FP;
	
	public class FForWaveI00 extends Wave
	{
		public function FForWaveI00()
		{
			super(0,0,6,7);
		}
		override public function update():void
		{
			waveTimer += FP.elapsed;
			
			if (waveTimer >= delay)
			{
				if (counter < waveTotalCount)
				{
					FP.world.add(new FForPauseI(120 + (Math.random()*400)));
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
	}
}