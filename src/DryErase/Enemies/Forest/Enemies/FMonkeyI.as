package DryErase.Enemies.Forest.Enemies
{
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Generic.ForEnemy;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class FMonkeyI extends ForEnemy
	{
		public var isRight:Boolean;
		public var xx:Number;
		public var shootTimer:Number;
		public function FMonkeyI(right:Boolean)
		{
			isRight = right;
			if (isRight == true)
			{
				xx = 540;
			}
			else
			{
				xx = 100;
			}
			super(new Image(Assets.F_MONKEY_IMAG), new Image(Assets.F_MONKEY_IMAG), 20, 300, 2, 270, xx, -72, false, 400,100,200,50,0.8);
			currentImage.angle = 0;
			currentImage.flipped = isRight;
			
		}
		override public function update():void
		{
			shootTimer += FP.elapsed;
			super.update();
			currentImage.angle = 0;
			if (shootTimer > 0.9)
			{
				shootTimer = 0;
				shoot(new Bullet(new Image(Assets.BULLET_GREY_IMAG), 24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2), 5, 0, false, 0, 1, true), x, y, new Image(Assets.BULLET_GREY_IMAG));
				shoot(new Bullet(new Image(Assets.BULLET_RED_IMAG), 24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2)+30, 5, 0, false, 0, 1, true), x, y, new Image(Assets.BULLET_RED_IMAG));
				shoot(new Bullet(new Image(Assets.BULLET_RED_IMAG), 24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2)-30, 5, 0, false, 0, 1, true), x, y, new Image(Assets.BULLET_RED_IMAG));
			}
		}
	}
}