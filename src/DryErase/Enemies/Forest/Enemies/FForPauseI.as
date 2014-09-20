package DryErase.Enemies.Forest.Enemies
{
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Generic.ForPauseEnemy;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class FForPauseI extends ForPauseEnemy
	{
		public var shootTimer:Number = 0;
		public function FForPauseI(xx:Number)
		{
			super(new Image(Assets.MX_BIRD_IMAG),new Image(Assets.MX_BIRD_IMAG),1,6,0,null,4,200,120,100,60, 25,300,xx,-72,false);
			
		}
		override public function update():void
		{
			super.update();
			shootTimer += FP.elapsed;
			if (shootTimer > 1.5)
			{
				shootTimer = 0.5;
				shoot(new Bullet(new Image(Assets.BULLET_GSTAR_IMAG),24,24,12,12,300,4,-0.6,false,2),x,y,new Image(Assets.BULLET_GSTAR_IMAG));
				shoot(new Bullet(new Image(Assets.BULLET_GSTAR_IMAG),24,24,12,12,240,4,0.6,false,2),x,y,new Image(Assets.BULLET_GSTAR_IMAG));
			}
		}
	}
}