package DryErase.Enemies.Castle.WaveControl
{
	import DryErase.Enemies.Castle.Enemies.CJetReal;
	import DryErase.Enemies.Flower.Enemies.BRusherR;
	import DryErase.Enemies.Generic.WaveControl.Wave;
	
	import net.flashpunk.FP;
	
	public class CJetWaveReal extends Wave
	{
		public function CJetWaveReal()
		{
			super(0,0,60,0.5); 
		}
		override public function update():void
		{
			waveTimer += FP.elapsed;
			
			if (waveTimer >= delay)
			{
				if (counter < waveTotalCount)
				{
					var random:Number = Math.random();
					if (random < 0.33)
					{
						FP.world.add(new CJetReal(72 + Math.random()*516, -72, 250 + Math.random()*40, 3+Math.random()));
					}
					else if (random < 0.67)
					{
						FP.world.add(new CJetReal(-72, 72 + Math.random()*348, 340 + Math.random()*40, 3+Math.random()));
					}
					else
					{
						FP.world.add(new CJetReal(640+72, 72 + Math.random()*348, 160 + Math.random()*40, 3+Math.random()));
					}
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
	}
}