package DryErase.Enemies.Bullets 
{
	/**
	 * ...
	 * @author 
	 */
	
	import net.flashpunk.FP;
	 
	public class Emitter
	{
		/* usage
		main_create(x, y, bullet name, main angle to fill, secondary angles in the main angle, secondary angle witdth, number of bullets per sub angle, total rotation, speed, step roation of individual bullets)
		*/
		public var bullet:Bullet;
		
		public function Emitter(centerX:Number, centerY:Number, bulletType:Bullet, mainAngle:Number, mainNode:Number, fillAngle:Number, numBullets:Number, globRotation:Number, bulletSpeed:Number, rotateSpeed:Number)
		{
			// lets define the known subangles
			// first the angular measure between each node in the main angle
			var mainSub:Number = mainAngle / mainNode;
			var secondarySub:Number = fillAngle / numBullets;
			
			bullet = bulletType;
			
			// main for loop make the main angle
			for(i = 0; i < mainNode; i += 1) // loop through each node in the main angle
			{
				// make a holder to tell the current outside node's angle
				var current_node_angle:Number = i * mainSub +globRotation;
				for (j = 0; j < numBullets; j += 1) 
				{
					FP.world.add(bullet);
					bullet.direction = current_node_angle-(fillAngle / 2) + (secondarySub * j);
					bullet.speed = bulletSpeed;
					bullet.rotSpeed = rotateSpeed;
				}
			}

		}
		
	}

}