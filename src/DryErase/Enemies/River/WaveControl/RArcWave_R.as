package DryErase.Enemies.River.WaveControl 
{
	import DryErase.Enemies.Generic.ArcEnemy;
	import DryErase.Enemies.Generic.WaveControl.Wave;
	import DryErase.Enemies.Mountain.Enemies.ArcThrushM;
	import DryErase.Enemies.River.Enemies.RArcEnemyI;
	import DryErase.Enemies.River.Enemies.RArcEnemyR;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	/**
	 * ...
	 * @author 
	 */
	public class RArcWave_R extends Wave
	{
		
		public function RArcWave_R() 
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
					FP.world.add(new RArcEnemyR(true, -64, 96, 0));
					FP.world.add(new RArcEnemyR(false, 640 + 64, 96, 180));
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
		
	}
	
}