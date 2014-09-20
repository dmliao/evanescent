package DryErase.Enemies.River.WaveControl
{
	import DryErase.Enemies.Generic.WaveControl.Wave;
	import DryErase.Enemies.River.Enemies.RSwoopShooterR;
	
	import net.flashpunk.FP;

	public class RSwoopWaveR extends Wave
	{
		public var turnRight:Boolean;
		public function RSwoopWaveR(right:Boolean)
		{
			super(0,0,5,1);
			turnRight = right;
		}
		override public function update():void
		{
			waveTimer += FP.elapsed;
			
			if (waveTimer >= delay)
			{
				if (counter < waveTotalCount)
				{
					FP.world.add(new RSwoopShooterR(turnRight));
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
	}
}