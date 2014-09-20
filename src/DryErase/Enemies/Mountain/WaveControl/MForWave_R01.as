package DryErase.Enemies.Mountain.WaveControl
{
	import DryErase.Enemies.Generic.ArcEnemy;
	import DryErase.Enemies.Generic.WaveControl.Wave;
	import DryErase.Enemies.Mountain.Enemies.ForwardThrush2MR;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	public class MForWave_R01 extends Wave
	{
		public function MForWave_R01()
		{
			super(x, y, 14, 2);
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
						FP.world.add(new ForwardThrush2MR(120, 0.5)); 
						FP.world.add(new ForwardThrush2MR(520, 0.5)); 
						//even
					}
					else
					{
						FP.world.add(new ForwardThrush2MR(240, 0.5)); 
						FP.world.add(new ForwardThrush2MR(400, 0.5)); 
						//odd
					}
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
	}
}