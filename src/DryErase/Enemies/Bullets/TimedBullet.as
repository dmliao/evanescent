package DryErase.Enemies.Bullets
{
	import DryErase.Hero.Listener;
	
	import com.debug.Debug;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class TimedBullet extends Bullet
	{
		public var homeTimer:Number = 0;
		public var targetTimer:Number;
		public var targetDir:Number;
		public function TimedBullet(newImage:Image = null,dir:Number = 0, argspeed:Number = 8, timer:Number = 1, rot:Number = 0, field:Boolean = false, imageRot:Number = 0, size:Number = 1, imagePoint:Boolean = false)
		{
			super(newImage, 24, 24, 12, 12, dir, argspeed, rot, field,imageRot, size, imagePoint);
			targetTimer = timer;
			Debug.log(x);
			Debug.log(y);
			layer = 0;
		}
		override public function update():void
		{
			super.update();
			homeTimer += FP.elapsed;
			if (homeTimer >= targetTimer)
			{
				targetDir = pointDirection(x,y,Listener.x2,Listener.y2);
				direction = pointDirection(x,y,Listener.x2,Listener.y2);
				homeTimer = -500;
			}
		}
	}
}