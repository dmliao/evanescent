package DryErase.Enemies.Castle.Enemies
{
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Enemy;
	import DryErase.Enemies.Generic.ForEnemy;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class CBow_Real extends Enemy
	{
		public var shootTimer:Number = 0;
		public function CBow_Real(xx:Number)
		{
			super(new Image(Assets.C_BOW_REAL), new Image(Assets.C_BOW_REAL),16, 250, true, 270, 200,200,100,100,1,false, 0);
			x=xx;
			y= -72;
		}
		override public function update():void
		{
			super.update();
			currentImage.angle = pointDirection(x,y,Listener.x2,Listener.y2);
			y += 2;
			shootTimer += FP.elapsed;
			if (shootTimer > 1)
			{
				shootTimer = 0;
				shoot(new Bullet(new Image(Assets.HEROBULLET1_REAL),24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2),5,0,true,0,1,true),x,y,new Image(Assets.HEROBULLET1_REAL));
			}
		}
	}
}