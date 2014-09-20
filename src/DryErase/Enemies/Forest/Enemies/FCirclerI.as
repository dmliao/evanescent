package DryErase.Enemies.Forest.Enemies
{
	import DryErase.Enemies.Bullets.AniBullet;
	import DryErase.Enemies.Generic.ForEnemy;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
		
	public class FCirclerI extends ForEnemy
	{
		public var circleTimer:Number = 0;
		public var isCircling:Boolean = false;
		public var circledTimes:Number = 0;
		public function FCirclerI()
		{
			super(new Image(Assets.F_SCARAB_IMAG), new Image(Assets.F_SCARAB_IMAG), 14, 350, 3, 270, 320, -72, false, 64, 64, 32, 32, 1, 0);
		}
		override public function update():void
		{
			circleTimer += FP.elapsed;
			if (circleTimer >= 1.5)
			{
				circledTimes += 1;
				isCircling = !isCircling;
				circleTimer = 0;
				
				shoot(new AniBullet(24, 24, 12, 12, 0, 3, 0.1, false),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 45, 3, 0.1, false),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 90, 3, 0.1, false),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 135, 3, 0.1, false),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 180, 3, 0.1, false),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 225, 3, 0.1, false),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 270, 3, 0.1, false),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 315, 3, 0.1, false),x,y);
			}
			super.update();
			if (isCircling && circledTimes < 5)
			{
			circleAround(320,240,5,true);
			}
			else
			{
				direction = 270;
				moveSpeed = 4;
			}
		}
	}
}