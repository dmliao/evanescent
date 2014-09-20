package DryErase.Enemies.Mountain.WaveControl 
{
	import DryErase.Enemies.Generic.ArcEnemy;
	import DryErase.Enemies.Generic.WaveControl.Wave;
	import DryErase.Enemies.Mountain.Enemies.ForwardThrush2M;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author 
	 */
	public class MForWave_I02 extends Wave
	{
		
		public function MForWave_I02() 
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
					FP.world.add(new ForwardThrush2M(120 + (Math.random()*400), 0.5)); 
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
		
	}
	
}