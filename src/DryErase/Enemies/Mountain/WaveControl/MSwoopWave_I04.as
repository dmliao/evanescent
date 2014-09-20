package DryErase.Enemies.Mountain.WaveControl
{
	import DryErase.Enemies.Generic.ArcEnemy;
	import DryErase.Enemies.Generic.WaveControl.Wave;
	import DryErase.Enemies.Mountain.Enemies.ForwardThrush2M;
	import DryErase.Enemies.Specific.Swooper;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	public class MSwoopWave_I04 extends Wave
	{
		
		public var faceright:Boolean;
		public var currentField:Boolean;
		public function MSwoopWave_I04(faceRight:Boolean, field:Boolean)
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
					FP.world.add(new Swooper(new Image(Assets.M_SPTHRUSH_REAL),new Image(Assets.M_SPTHRUSH_REAL), true, faceright)); 
					counter += 1;
					waveTimer = 0;
				}
				
			}
		}
	}
}