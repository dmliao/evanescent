package DryErase.Enemies.Flower.WaveControl
{
	import DryErase.Enemies.Generic.WaveControl.Wave;
	import DryErase.Enemies.Flower.Enemies.BLadybirdR;
	import DryErase.Enemies.River.Enemies.RForEnemyI01;
	
	import net.flashpunk.FP;
	
	public class BLadybirdWaveR extends Wave
	{
		public function BLadybirdWaveR()
		{
			super(0,0,6,2);
		}
		override public function update():void
		{
			waveTimer += FP.elapsed;
			
			if (waveTimer >= delay)
			{
				if (counter < waveTotalCount)
				{
					if (counter % 2 == 1)
					{
						FP.world.add(new BLadybirdR(400, 2));
						FP.world.add(new BLadybirdR(460, 2));
						FP.world.add(new BLadybirdR(340, 2));
						//even
					}
					else
					{
						FP.world.add(new BLadybirdR(240, 2));
						FP.world.add(new BLadybirdR(300, 2));
						FP.world.add(new BLadybirdR(180, 2));
						//odd
					}
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
	}
}