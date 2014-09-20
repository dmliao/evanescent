package DryErase.Enemies.Mountain.WaveControl
{
	import DryErase.Enemies.Specific.Dragon;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	public class MDragon_Left extends Entity
	{
		public var dragon:Dragon;
		public function MDragon_Left(field:Boolean = false)
		{
			dragon = new Dragon(-64,320,30,field,240,240,120,120,0.7,0.35);
			FP.world.add(dragon);
			FP.world.remove(this);
		}
	}
}