package DryErase.Enemies.Castle.WaveControl
{
	import DryErase.Enemies.Castle.Enemies.CBow_Imag;
	import DryErase.Enemies.Castle.Enemies.CJetImag;
	import DryErase.Enemies.Flower.Enemies.BRusherR;
	import DryErase.Enemies.Generic.WaveControl.Wave;
	
	import net.flashpunk.FP;
	
	public class CBowWaveI extends Wave
	{
		public function CBowWaveI()
		{
			super(0,0,15,2); 
		}
		override public function update():void
		{
			waveTimer += FP.elapsed;
			
			if (waveTimer >= delay)
			{
				if (counter < waveTotalCount)
				{
					FP.world.add(new CBow_Imag(80));
					FP.world.add(new CBow_Imag(560));
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
	}
}