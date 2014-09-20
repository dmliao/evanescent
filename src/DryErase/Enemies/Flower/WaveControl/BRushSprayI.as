package DryErase.Enemies.Flower.WaveControl
{
	import DryErase.Enemies.Flower.Enemies.BRusherI;
	import DryErase.Enemies.Generic.WaveControl.Wave;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class BRushSprayI extends Wave
	{
		public function BRushSprayI()
		{
			super(0,0,30,0.6);
		}
		override public function update():void
		{
			waveTimer += FP.elapsed;
			
			if (waveTimer >= delay)
			{
				if (counter < waveTotalCount)
				{
					for (var i:int = 0; i < 3; i += 1)
					{
						FP.world.add(new BRusherI(72 + Math.random()*516, -72, 250 + Math.random()*40, 3+Math.random()));
					}
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
	}
}