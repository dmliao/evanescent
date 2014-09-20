package DryErase.Enemies.River.WaveControl
{
	import DryErase.Enemies.Generic.WaveControl.Wave;
	import DryErase.Enemies.River.Enemies.RForEnemyR00;
	
	
	import net.flashpunk.FP;

	public class RForWave_R00 extends Wave
	{
		public function RForWave_R00()
		{
			super(0,0,13,2);
		}
		override public function update():void
		{
			waveTimer += FP.elapsed;
			
			if (waveTimer >= delay)
			{
				if (counter < waveTotalCount)
				{
					FP.world.add(new RForEnemyR00(96 + Math.random()*448, 1));
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
	}
}