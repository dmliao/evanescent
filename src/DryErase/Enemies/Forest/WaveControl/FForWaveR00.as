package DryErase.Enemies.Forest.WaveControl
{
	import DryErase.Enemies.Generic.WaveControl.Wave;
	import DryErase.Enemies.Mountain.Enemies.ForPauseM;
	
	import net.flashpunk.FP;

	public class FForWaveR00 extends Wave
	{
		public function FForWaveR00()
		{
			super(0,0,6,5);
		}
		override public function update():void
		{
			waveTimer += FP.elapsed;
			
			if (waveTimer >= delay)
			{
				if (counter < waveTotalCount)
				{
					FP.world.add(new ForPauseM(120 + (Math.random()*400),-72));
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
	}
}