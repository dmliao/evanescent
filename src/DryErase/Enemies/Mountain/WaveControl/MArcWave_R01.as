package DryErase.Enemies.Mountain.WaveControl 
{
	import DryErase.Enemies.Generic.ArcEnemy;
	import DryErase.Enemies.Generic.WaveControl.Wave;
	import DryErase.Enemies.Mountain.Enemies.ArcThrush2M;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author 
	 */
	public class MArcWave_R01 extends Wave
	{
		
		public function MArcWave_R01() 
		{
			super( -64, 96, 4, 0.5);
		}
		
		override public function update():void
		{
			waveTimer += FP.elapsed;
			
			if (waveTimer >= delay)
			{
				if (counter < waveTotalCount)
				{
					FP.world.add(new ArcThrush2M(true, -64, 96, 0));
					FP.world.add(new ArcThrush2M(false, 640 + 64, 96, 180));
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
		
	}
	
}