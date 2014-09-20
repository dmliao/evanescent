package DryErase.Enemies.Forest.Enemies
{
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Generic.ForEnemy;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class FForTurnerI extends ForEnemy
	{
		public var shootTimer:Number = 0;
		public var turnTimer:Number = 0;
		public function FForTurnerI(xx:Number, yy:Number, dir:Number)
		{
			super(new Image(Assets.F_SCARAB_IMAG),new Image(Assets.F_SCARAB_IMAG)., 3, 35, 3, dir, xx, yy, false, 64,64,32,32,1,0.3);
		}
		override public function update():void
		{
			shootTimer += FP.elapsed;
			if (shootTimer > 1)
			{
				shootTimer = -5;
				shoot(new Bullet(new Image(Assets.BULLET_RED_IMAG), 24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2),4, 0, false, 3),x,y,new Image(Assets.BULLET_RED_IMAG));
			}
			if (turnTimer > 2)
			{
				direction = pointDirection(x,y,Listener.x2,Listener.y2);
				turnTimer = -10;
			}
			super.update();
		}
	}
}