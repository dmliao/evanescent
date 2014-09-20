package DryErase.Enemies.Flower.WaveControl
{
	import DryErase.Enemies.Flower.Enemies.BThrushR00;
	import DryErase.Enemies.Generic.WaveControl.Wave;
	
	import net.flashpunk.FP;

	public class BThrushWaveR00 extends Wave
	{
		public var x2:Number;
		public var rightr:Boolean
		public function BThrushWaveR00(xx:Number, turn:Boolean)
		{
			super(0,0,7,1);
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
					
					FP.world.add(new BThrushR00(x2,rightr));
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
	}
}