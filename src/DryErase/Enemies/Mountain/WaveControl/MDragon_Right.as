package DryErase.Enemies.Mountain.WaveControl
{
	import DryErase.Enemies.Specific.Dragon;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	public class MDragon_Right extends Entity
	{
		public var dragon:Dragon;
		public function MDragon_Right(field:Boolean = false)
		{
			dragon = new Dragon(704,320,150,field,240,240,120,120,0.7,0.35,-1);
			FP.world.add(dragon);
			FP.world.remove(this);
		}
	}
}