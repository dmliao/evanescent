package DryErase.Enemies.Flower.WaveControl
{
	import DryErase.Enemies.Flower.Enemies.BRusherR;
	import DryErase.Enemies.Generic.WaveControl.Wave;
	
	import net.flashpunk.FP;

	public class BJetSprayR extends Wave
	{
		public function BJetSprayR()
		{
			super(0,0,30,0.7);
		}
		override public function update():void
		{
			waveTimer += FP.elapsed;
			
			if (waveTimer >= delay)
			{
				if (counter < waveTotalCount)
				{
					
					FP.world.add(new BRusherR(72 + Math.random()*516, -72, 250 + Math.random()*40, 3+Math.random()));
					FP.world.add(new BRusherR(-72, 72 + Math.random()*348, 340 + Math.random()*40, 3+Math.random()));
					FP.world.add(new BRusherR(640+72, 72 + Math.random()*348, 160 + Math.random()*40, 3+Math.random()));
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
	}
}