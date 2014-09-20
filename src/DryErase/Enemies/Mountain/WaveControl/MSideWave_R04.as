
package DryErase.Enemies.Mountain.WaveControl
{
	import DryErase.Enemies.Generic.ArcEnemy;
	import DryErase.Enemies.Generic.WaveControl.Wave;
	import DryErase.Enemies.Mountain.Enemies.ForwardThrush2M;
	import DryErase.Enemies.Mountain.Enemies.SideSwooperM;
	import DryErase.Enemies.Specific.Swooper;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class MSideWave_R04 extends Wave
	{
		
		public var faceright:Boolean;
		public var currentField:Boolean;
		public function MSideWave_R04(faceRight:Boolean, field:Boolean)
		{
			super(x, y, 5, 1);
			faceright = faceRight;
			currentField = field;
		}
		override public function update():void
		{
			waveTimer += FP.elapsed;
			
			if (waveTimer >= delay)
			{
				if (counter < waveTotalCount)
				{
					if (faceright == true)
					{
						FP.world.add(new SideSwooperM(32, -96, 290, 2, true));
					}
					else
					{
						FP.world.add(new SideSwooperM(608, -96, 250, 2, false));
					}
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
	}
}