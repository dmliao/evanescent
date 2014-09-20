package DryErase.Enemies.River.Enemies
{
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Enemy;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class RUTurnerR extends Enemy
	{
		
		public var startTimer:Number = 0;
		public var wshoot:Boolean = false;
		public function RUTurnerR()
		{
			super(new Image(Assets.R_FLYINGFISH_REAL), new Image(Assets.R_FLYINGFISH_REAL), 8, 125, true, 270, 64, 64, 32, 32, 1, false, 0);
			x = 330;
			y = -72;
			moveDirection(270, 3);
			imageScale = 0.4;
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
					shoot(new Bullet(new Image(Assets.BULLET_GSTAR_REAL), 24, 24, 12, 12, pointDirection(x,y,Listener.x2,Listener.y2),4, 0, true, 1),x,y, new Image(Assets.BULLET_GSTAR_REAL));
					shoot(new Bullet(new Image(Assets.BULLET_GSTAR_REAL), 24, 24, 12, 12, pointDirection(x,y,Listener.x2,Listener.y2) - 30,4, 0, true, 1),x,y, new Image(Assets.BULLET_GSTAR_REAL));
					shoot(new Bullet(new Image(Assets.BULLET_GSTAR_REAL), 24, 24, 12, 12, pointDirection(x,y,Listener.x2,Listener.y2) + 30,4, 0, true, 1),x,y, new Image(Assets.BULLET_GSTAR_REAL));
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