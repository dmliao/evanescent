package DryErase.Enemies.Mountain.WaveControl
{
	import DryErase.Enemies.Generic.WaveControl.Wave;
	import DryErase.Enemies.Mountain.Enemies.RockM;
	import net.flashpunk.FP;

	public class MRockWave extends Wave
	{
		public function MRockWave() 
		{
			super(0,0,4,2);
		}
		
		override public function update():void
		{
			waveTimer += FP.elapsed;
			
			if (waveTimer >= delay)
			{
				if (counter < waveTotalCount)
				{
					FP.world.add(new RockM(120 + (Math.random()*400),Math.random() * 2, 15)); 
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
	}
}