package DryErase.Enemies.River.WaveControl
{
	import DryErase.Enemies.Generic.WaveControl.Wave;
	import DryErase.Enemies.River.Enemies.RForEnemyI01;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class RForThreeWave_I00 extends Wave
	{
		public function RForThreeWave_I00()
		{
			super(0, 0, 10, 2.25);
		}
		
		override public function update():void
		{
			waveTimer += FP.elapsed;
			
			if (waveTimer >= delay)
			{
				if (counter < waveTotalCount)
				{
					if (counter % 2 == 0)
					{
						FP.world.add(new RForEnemyI01(400, 2));
						FP.world.add(new RForEnemyI01(460, 2));
						FP.world.add(new RForEnemyI01(340, 2));
						//even
					}
					else
					{
						FP.world.add(new RForEnemyI01(240, 2));
						FP.world.add(new RForEnemyI01(300, 2));
						FP.world.add(new RForEnemyI01(180, 2));
						//odd
					}
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
	}
}