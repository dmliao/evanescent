package DryErase.Enemies.Mountain.WaveControl
{
	import DryErase.Enemies.Specific.DragonReal;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	public class MDragonR_Left extends Entity
	{
		public var dragon:DragonReal;
		public function MDragonR_Left(field:Boolean = true)
		{
			dragon = new DragonReal(-64,320,30,field,240,240,120,120,0.7,0.35);
			FP.world.add(dragon);
			FP.world.remove(this);
		}
	}
}