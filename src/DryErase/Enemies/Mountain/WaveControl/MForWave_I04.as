package DryErase.Enemies.Mountain.WaveControl
{
	import DryErase.Enemies.Generic.ArcEnemy;
	import DryErase.Enemies.Generic.WaveControl.Wave;
	import DryErase.Enemies.Mountain.Enemies.ForwardThrushM;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	public class MForWave_I04 extends Wave
	{
		public function MForWave_I04()
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
						FP.world.add(new ForwardThrushM(120, false, 0.5)); 
						FP.world.add(new ForwardThrushM(520, false, 0.5)); 
						//even
					}
					else
					{
						FP.world.add(new ForwardThrushM(240, false, 0.5)); 
						FP.world.add(new ForwardThrushM(400, false, 0.5)); 
						//odd
					}
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
	}
}