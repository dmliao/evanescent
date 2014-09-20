package DryErase.Enemies.Forest.WaveControl
{
	import DryErase.Enemies.Forest.Enemies.FSwooperR;
	import DryErase.Enemies.Generic.WaveControl.Wave;
	
	import net.flashpunk.FP;
	
	public class FSwoopWaveR extends Wave
	{
		public var swoopRight:Boolean;
		public function FSwoopWaveR(right:Boolean)
		{
			super(0,0,7,1);
			swoopRight=right;
		}
		
		override public function update():void
		{
			waveTimer += FP.elapsed;
			
			if (waveTimer >= delay)
			{
				if (counter < waveTotalCount)
				{
					FP.world.add(new FSwooperR(swoopRight));
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
	}
}