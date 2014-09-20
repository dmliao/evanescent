package DryErase.Enemies.River.WaveControl
{
	import DryErase.Enemies.Generic.WaveControl.Wave;
	import DryErase.Enemies.River.Enemies.RForEnemyI00;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;

	public class RMoveInWaveI extends Wave
	{
		
		public function RMoveInWaveI()
		{
			super(0,0,1,0);
			
		}
		override public function update():void
		{
			waveTimer += FP.elapsed;
			
			if (waveTimer >= delay)
			{
				if (counter < waveTotalCount)
				{
					FP.world.add(new RForEnemyI00( -100, 240, 1.2, -8));
					FP.world.add(new RForEnemyI00( 650, 240, 1.2, -172));
					FP.world.add(new RForEnemyI00( -100, 0, 1.2, -36));
					FP.world.add(new RForEnemyI00( 650, 0, 1.2, 216));
					FP.world.add(new RForEnemyI00( 320, - 100, 1.2, 270));
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
	}
}