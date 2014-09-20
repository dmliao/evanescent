package DryErase.Enemies.Forest.WaveControl
{
	import DryErase.Enemies.Forest.Enemies.FWaverR;
	import DryErase.Enemies.Generic.WaveControl.Wave;
	
	import net.flashpunk.FP;
	
	
	public class FWaverWaveR extends Wave
	{
		public var x2:Number;
		public var rightr:Boolean
		public function FWaverWaveR(xx:Number, turn:Boolean)
		{
			super(0,0,7,1.2);
			x2 = xx;
			rightr = turn;
		}
		override public function update():void
		{
			waveTimer += FP.elapsed;
			
			if (waveTimer >= delay)
			{
				if (counter < waveTotalCount)
				{
					
					FP.world.add(new FWaverR(x2,rightr));
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
	}
}