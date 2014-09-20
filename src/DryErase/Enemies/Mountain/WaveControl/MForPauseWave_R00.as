package DryErase.Enemies.Mountain.WaveControl 
{
	import DryErase.Enemies.Generic.WaveControl.Wave;
	import DryErase.Enemies.Mountain.Enemies.ArcThrushM;
	import DryErase.Enemies.Mountain.Enemies.ForPauseM_R00;
	import DryErase.Enemies.Mountain.Enemies.ForPauseM_SideFlank_R00;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author 
	 */
	public class MForPauseWave_R00 extends Wave
	{
		public var wave2Timer:Number = 0;
		public function MForPauseWave_R00() 
		{
			super(320, -100, 1, 0);
			x = 320;
			y = -100;
		}
		override public function update():void
		{
			waveTimer += FP.elapsed;
			wave2Timer += FP.elapsed;
			
			if (waveTimer >= delay)
			{
				if (counter < waveTotalCount)
				{
					FP.world.add(new ForPauseM_R00(x,y));
					counter += 1;
					waveTimer = 0;
				}
				
			}
			if (wave2Timer >= delay + 1.50)
			{
				FP.world.add(new ForPauseM_SideFlank_R00(x - 120, y));
				FP.world.add(new ForPauseM_SideFlank_R00(x + 120, y));
				FP.world.remove(this);
			}
		}
	}
	
}