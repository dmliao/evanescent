package DryErase.Enemies.Castle.Enemies
{
	import DryErase.Enemies.Bullets.AniBullet;
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Generic.ForEnemy;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class CJetReal extends ForEnemy
	{
		public var shootTimer:Number = 0;
		public function CJetReal(xx:Number, yy:Number, dir:Number, spd:Number)
		{
			super(new Image(Assets.B_JET_REAL), new Image(Assets.B_JET_REAL), 3, 100, spd, dir, xx, yy, true, 64, 64, 32, 32);
			imageScale = 0.5;
			x=xx;
			y=yy;
		}
		override public function update():void
		{
			super.update();
			shootTimer += FP.elapsed;
			if (shootTimer > 1)
			{
				shootTimer = -50;
				shoot(new AniBullet(24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2),5, 0, true,"blue"),x,y,null);
			}
		}
	}
}