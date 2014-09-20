package DryErase.Enemies.Forest.WaveControl
{
	import DryErase.Enemies.Forest.Enemies.FCreepR;
	import DryErase.Enemies.Generic.WaveControl.Wave;
	
	import net.flashpunk.FP;
	
	public class FCreepWaveR extends Wave
	{
		public function FCreepWaveR()
		{
			super(0,0,3,1);
		}
		override public function update():void
		{
			waveTimer += FP.elapsed;
			
			
			if (waveTimer >= delay)
			{
				if (counter < waveTotalCount)
				{
					if (counter == 0)
					{
						FP.world.add(new FCreepR(320));
					}
					else if (counter == 1)
					{
						FP.world.add(new FCreepR(180));
					}
					else
					{
						FP.world.add(new FCreepR(640-180));
					}
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
	}
}