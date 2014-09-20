package DryErase.Enemies.Flower.WaveControl
{
	import DryErase.Enemies.Flower.Enemies.BJetR;
	import DryErase.Enemies.Generic.WaveControl.Wave;
	
	import net.flashpunk.FP;

	public class BJetWaveR extends Wave
	{
		public var xxx:Number;
		public function BJetWaveR(xx:Number)
		{
			super(0,0,6,1);
			xxx=xx;
		}
		override public function update():void
		{
			waveTimer += FP.elapsed;
			
			if (waveTimer >= delay)
			{
				if (counter < waveTotalCount)
				{
					FP.world.add(new BJetR(xxx));
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
	}
}