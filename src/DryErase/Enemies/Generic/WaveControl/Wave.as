package DryErase.Enemies.Generic.WaveControl
{
	import DryErase.Enemies.Enemy;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author 
	 */
	public class Wave extends Entity
	{
		
		public var waveTimer:Number = 0; 
		public var waveTotalCount:Number = 0; //How many enemies are in this wave
		
		public var counter:Number = 0; //which enemy have we created already?
		
		public var createEnemy:Enemy;
		public var delay:Number; //How long time passes in between each enemy appearance in teh wave
		
		public var flag:Boolean = false;
		
		public function Wave(xx:Number, yy:Number, waveNumber:Number, waveDelay:Number) 
		{
			waveTotalCount = waveNumber;
			delay = waveDelay;
			counter = 0;
		}
		
		override public function update():void
		{
			waveTimer += FP.elapsed;
			
			if (waveTimer >= delay)
			{
				if (counter < waveTotalCount)
				{
					FP.world.add(createEnemy);
					counter += 1;
					waveTimer = 0;
				}
				else
				{
					flag = true;
				}
				
			}
		}
		
	}

}