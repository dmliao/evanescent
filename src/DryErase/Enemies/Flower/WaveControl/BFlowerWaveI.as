package DryErase.Enemies.Flower.WaveControl
{
	import DryErase.Enemies.Flower.Enemies.BFlower00I;
	import DryErase.Enemies.Flower.Enemies.BForEnemyI00;
	import DryErase.Enemies.Generic.WaveControl.Wave;
	
	import net.flashpunk.FP;

	public class BFlowerWaveI extends Wave
	{
		public var turnRight:Boolean;
		public function BFlowerWaveI(right:Boolean)
		{
			turnRight = right;
			super(0,0, 7, 1);
		}
		override public function update():void
		{
			waveTimer += FP.elapsed;
			
			if (waveTimer >= delay)
			{
				if (counter < waveTotalCount)
				{
					
						FP.world.add(new BFlower00I(turnRight));
						FP.world.add(new BForEnemyI00(turnRight));
						

					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
	}
}