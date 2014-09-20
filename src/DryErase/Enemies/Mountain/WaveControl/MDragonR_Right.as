package DryErase.Enemies.Mountain.WaveControl
{
	import DryErase.Enemies.Specific.DragonReal;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	public class MDragonR_Right extends Entity
	{
		public var dragon:DragonReal;
		public function MDragonR_Right(field:Boolean = true)
		{
			dragon = new DragonReal(704,320,150,field,240,240,120,120,0.7,0.35,-1);
			FP.world.add(dragon);
			FP.world.remove(this);
		}
	}
}