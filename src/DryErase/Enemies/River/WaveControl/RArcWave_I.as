package DryErase.Enemies.River.WaveControl 
{
	import DryErase.Enemies.Generic.ArcEnemy;
	import DryErase.Enemies.Generic.WaveControl.Wave;
	import DryErase.Enemies.Mountain.Enemies.ArcThrushM;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import DryErase.Enemies.River.Enemies.RArcEnemyI;
	/**
	 * ...
	 * @author 
	 */
	public class RArcWave_I extends Wave
	{
		
		public function RArcWave_I() 
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
					FP.world.add(new RArcEnemyI(true, -64, 96, 0));
					FP.world.add(new RArcEnemyI(false, 640 + 64, 96, 180));
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
		
	}
	
}