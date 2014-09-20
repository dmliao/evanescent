package DryErase.Enemies.Forest.Enemies
{
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Enemy;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class FUTurnerI extends Enemy
	{
		public var startTimer:Number = 0;
		public var wshoot:Boolean = false;
		public function FUTurnerI()
		{
			super(new Image(Assets.F_THRUSH_IMAG), new Image(Assets.F_THRUSH_IMAG), 8, 125, false, 270, 64, 64, 32, 32, 1, false, 0);
			x = 330;
			y = -72;
			moveDirection(270, 3);
		}
		override public function update():void
		{
			super.update();
			startTimer += FP.elapsed;
			moveDirection(direction, 3);
			if (startTimer > 2)
			{
				if (wshoot == false)
				{
					wshoot = true;
					shoot(new Bullet(new Image(Assets.BULLET_BLUE_IMAG), 24, 24, 12, 12, pointDirection(x,y,Listener.x2,Listener.y2),4, 0, false, 1),x,y, new Image(Assets.BULLET_BLUE_IMAG));
					shoot(new Bullet(new Image(Assets.BULLET_BLUE_IMAG), 24, 24, 12, 12, pointDirection(x,y,Listener.x2,Listener.y2) - 30,4, 0, false, 1),x,y, new Image(Assets.BULLET_BLUE_IMAG));
					shoot(new Bullet(new Image(Assets.BULLET_BLUE_IMAG), 24, 24, 12, 12, pointDirection(x,y,Listener.x2,Listener.y2) + 30,4, 0, false, 1),x,y, new Image(Assets.BULLET_BLUE_IMAG));
				}
				if (direction > 90 + 3)
				{
					direction -= 3;
				}
				else
				{
					direction = 90;
				}
				
			}
		}
	}
}