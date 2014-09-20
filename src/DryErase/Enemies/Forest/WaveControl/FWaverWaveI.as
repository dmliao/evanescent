package DryErase.Enemies.Forest.WaveControl
{
	import DryErase.Enemies.Forest.Enemies.FWaverI;
	import DryErase.Enemies.Generic.WaveControl.Wave;
	
	import net.flashpunk.FP;

	
	public class FWaverWaveI extends Wave
	{
		public var x2:Number;
		public var rightr:Boolean
		public function FWaverWaveI(xx:Number, turn:Boolean)
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
					
					FP.world.add(new FWaverI(x2,rightr));
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
	}
}