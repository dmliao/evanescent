package DryErase.Enemies.River.WaveControl
{
	import DryErase.Enemies.Generic.WaveControl.Wave;
	import DryErase.Enemies.River.Enemies.FlyingFish;
	
	import net.flashpunk.FP;

	public class RFlyingFish extends Wave
	{
		public function RFlyingFish()
		{
			super(0,0,20,1.5);
		}
		override public function update():void
		{
			waveTimer += FP.elapsed;
			
			if (waveTimer >= delay)
			{
				if (counter < waveTotalCount)
				{
					FP.world.add(new FlyingFish(100+Math.random()*440));
					counter += 1;
					
					waveTimer = 0;
				}
				
			}
		}
	}
}