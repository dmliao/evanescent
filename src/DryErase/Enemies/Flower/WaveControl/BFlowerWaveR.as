package DryErase.Enemies.Flower.WaveControl
{
	import DryErase.Enemies.Flower.Enemies.BFlowerR;
	import DryErase.Enemies.Generic.WaveControl.Wave;
	
	import net.flashpunk.FP;

	public class BFlowerWaveR extends Wave
	{
		public var turnRight:Boolean;
		public function BFlowerWaveR(right:Boolean)
		{
			turnRight = right;
			super(0,0, 7, 1.5);
		}
		override public function update():void
		{
			waveTimer += FP.elapsed;
			
			if (waveTimer >= delay)
			{
				if (counter < waveTotalCount)
				{
					
					FP.world.add(new BFlowerR(turnRight));
					
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
	}
}