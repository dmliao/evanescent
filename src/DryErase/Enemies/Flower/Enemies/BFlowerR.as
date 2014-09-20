package DryErase.Enemies.Flower.Enemies
{
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Generic.ForEnemy;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class BFlowerR extends ForEnemy
	{
		
		private var turn:Number;
		private var totalTurn:Number = 0;
		public var shootTimer:Number = 0;
		public function BFlowerR(right:Boolean)
		{
			var dir:Number;
			var xxx:Number;
			var rot:Number;
			if (right == true)
			{
				dir = 0;
				xxx = -72;
				rot = 4;
				turn = 4;
			}
			else
			{
				dir = 180;
				xxx = 640 + 72;
				rot = -4;
				turn = -4;
			}
			super(new Image(Assets.B_FLOWER_REAL), new Image(Assets.B_FLOWER_REAL), 5, 90, 3, dir, xxx, 320, true, 100, 100, 50, 50, 0.7, rot);
		}
		
		override public function update():void
		{
			if (y <= -72)
			{
				FP.world.remove(this);
			}
			else
			{
				shootTimer += FP.elapsed;
				if (shootTimer > 1.4)
				{
					shootTimer = 0;
					shoot(new Bullet(null, 24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2),4,0,true,2),x,y,new Image(Assets.BULLET_BLUE_REAL));
					shoot(new Bullet(null, 24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2)+40,4,0,true,2),x,y,new Image(Assets.BULLET_BLUE_REAL));
					shoot(new Bullet(null, 24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2)-40,4,0,true,2),x,y,new Image(Assets.BULLET_BLUE_REAL));
				}
				super.update();
				totalTurn += turn;
				currentImage.angle = totalTurn;
				direction += turn/8;
			}
		}
	}
}