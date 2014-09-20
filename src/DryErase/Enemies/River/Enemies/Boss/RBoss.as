package DryErase.Enemies.River.Enemies.Boss
{
	import DryErase.Enemies.River.WaveControl.Master_R;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;

	public class RBoss extends Entity
	{
		public static var head:RBossHead = new RBossHead();
		public static var upper:RBossUpper = new RBossUpper();
		public static var lower:RBossLower = new RBossLower();
		public static var tail:RBossTail = new RBossTail();
		
		public var headDead:Boolean = false;
		public var upperDead:Boolean = false;
		public var lowerDead:Boolean = false;
		public var tailDead:Boolean = false;
		
		private var die:Boolean = false;
		
		public static var numDead:Number = 0;
		public function RBoss()
		{
			head = new RBossHead();
			upper = new RBossUpper();
			lower = new RBossLower();
			tail = new RBossTail();
			FP.world.add(head);
			FP.world.add(upper);
			FP.world.add(lower);
			FP.world.add(tail);
			
		}
		override public function update():void	
		{
			if (numDead >= 4)
			{
				if (die == false)
				{
					die = true;
					FP.world.remove(head);
					FP.world.remove(upper);
					FP.world.remove(lower);
					FP.world.remove(tail);
					Master_R.bossDead = true;
				}
			}
			else
			{
		//	head.currentState = "alt1";
				numDead = int(head.deathTrigger) + int(upper.deathTrigger) + int(lower.deathTrigger) + int(tail.deathTrigger);
			}
			
		}
		
		
	}
}