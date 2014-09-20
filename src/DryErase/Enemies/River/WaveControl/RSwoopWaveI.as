package DryErase.Enemies.River.WaveControl
{
	import DryErase.Enemies.Generic.WaveControl.Wave;
	import DryErase.Enemies.River.Enemies.RSwoopShooterI;
	
	import net.flashpunk.FP;
	
	public class RSwoopWaveI extends Wave
	{
		public var turnRight:Boolean;
		public function RSwoopWaveI(right:Boolean)
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
					FP.world.add(new RSwoopShooterI(turnRight));
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
	}
}