package DryErase.Enemies.Flower.WaveControl
{
	import DryErase.Enemies.Flower.Enemies.BJetI;
	import DryErase.Enemies.Generic.WaveControl.Wave;
	
	import net.flashpunk.FP;

	public class BJetSprayI extends Wave
	{
		public function BJetSprayI()
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
					FP.world.add(new BJetI(Math.random()*640));
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
	}
}