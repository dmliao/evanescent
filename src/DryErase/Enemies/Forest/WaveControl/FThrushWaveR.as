package DryErase.Enemies.Forest.WaveControl 
{
	import DryErase.Enemies.Forest.Enemies.FForEnemyR;
	import DryErase.Enemies.Generic.ArcEnemy;
	import DryErase.Enemies.Generic.WaveControl.Wave;
	import DryErase.Enemies.Mountain.Enemies.ForwardThrush2M;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author 
	 */
	public class FThrushWaveR extends Wave
	{
		
		public function FThrushWaveR() 
		{
			super(0,0,20,1);
		}
		
		override public function update():void
		{
			waveTimer += FP.elapsed;
			
			if (waveTimer >= delay)
			{
				if (counter < waveTotalCount)
				{
					FP.world.add(new FForEnemyR(120 + (Math.random()*400))); 
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
		
	}
	
}