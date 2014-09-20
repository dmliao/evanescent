package DryErase.Enemies.Forest.Enemies
{
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Generic.ForEnemy;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class FMonkeyR extends ForEnemy
	{
		public var isRight:Boolean;
		public var xx:Number;
		public var shootTimer:Number;
		public function FMonkeyR(right:Boolean)
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
			super(new Image(Assets.F_MONKEY_REAL), new Image(Assets.F_MONKEY_REAL), 20, 300, 2, 270, xx, -72, true, 400,100,200,50,0.8);
			currentImage.angle = 0;
			currentImage.flipped = isRight;
			
		}
		override public function update():void
		{
		
			super.update();
			shootTimer += FP.elapsed;
			currentImage.angle = 0;
			if (shootTimer > 0.9)
			{
				shootTimer = 0;
				shoot(new Bullet(new Image(Assets.BULLET_GREY_REAL), 24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2), 5, 0, true, 0, 1, true), x, y, new Image(Assets.BULLET_GREY_REAL));
				shoot(new Bullet(new Image(Assets.BULLET_RED_REAL), 24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2)+30, 5, 0, true, 0, 1, true), x, y, new Image(Assets.BULLET_RED_REAL));
				shoot(new Bullet(new Image(Assets.BULLET_RED_REAL), 24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2)-30, 5, 0, true, 0, 1, true), x, y, new Image(Assets.BULLET_RED_REAL));
			}
		}
	}
}