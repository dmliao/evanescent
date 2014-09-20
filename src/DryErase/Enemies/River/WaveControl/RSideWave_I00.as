package DryErase.Enemies.River.WaveControl
{
	import DryErase.Enemies.Generic.WaveControl.Wave;
	import DryErase.Enemies.River.Enemies.RSideSwooperI;
	
	import net.flashpunk.FP;

	public class RSideWave_I00 extends Wave
	{
		public var r:Boolean;
		public function RSideWave_I00(right:Boolean)
		{
			r = right;
			super(0,0,4,1.2);
		}
		
		override public function update():void
		{
			waveTimer += FP.elapsed;
			
			if (waveTimer >= delay)
			{
				if (counter < waveTotalCount)
				{
					if (r == true)
					{
						FP.world.add(new RSideSwooperI(240, -120, 280, 2, false));
					}
					if (r == false)
					{
						FP.world.add(new RSideSwooperI(400, -120, 260, 2, true));
					}
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
	}
}