package DryErase.Enemies.Flower.WaveControl
{
	import DryErase.Enemies.Generic.WaveControl.Wave;
	import DryErase.Enemies.Flower.Enemies.BForEnemyI00;
	import net.flashpunk.FP;
	public class BForWaveI00 extends Wave
	{
		public function BForWaveI00()
		{
			super(0,0,6,1);
		}
		override public function update():void
		{
			waveTimer += FP.elapsed;
			
			if (waveTimer >= delay)
			{
				if (counter < waveTotalCount)
				{
					FP.world.add(new BForEnemyI00(true));
					FP.world.add(new BForEnemyI00(false));
					
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
	}
}