package DryErase.Enemies.Flower.Enemies
{
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Generic.ForEnemy;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class BHummingBirdR extends ForEnemy
	{
		[Embed(source = '../assets/Hummingbird_R.png')]
		private const IMAGE:Class;
		
		public var moveAlarm:Number = 0;
		public var shootAlarm:Number = 0;
		public var first:Boolean = false;
		public var second:Boolean = false;
		public function BHummingBirdR()
		{
			super(new Image(IMAGE), new Image(IMAGE), 24, 500, 2, 270, 640-120, -72, true, 100, 100, 50, 50, 1, 0);
			
		}
		override public function update():void
		{
			super.update();
			moveAlarm += FP.elapsed;
			shootAlarm += FP.elapsed;
			if (moveAlarm > 4 && first == false)
			{
				first = true;
				direction = 150;
			}
			if (moveAlarm > 8 && second == false)
			{
				second = true;
				direction = 270;
			}
			if (shootAlarm > 0.7)
			{ 
				shootAlarm = 0;
				shoot(new Bullet(new Image(Assets.BULLET_RED_REAL), 24, 24, 12, 12, 0+ Math.random()*40 - 20, 5, 0, true, 4), x, y, new Image(Assets.BULLET_RED_REAL));
				shoot(new Bullet(new Image(Assets.BULLET_RED_REAL), 24, 24, 12, 12, 90+ Math.random()*40 - 20, 5, 0, true, 4), x, y, new Image(Assets.BULLET_RED_REAL));
				shoot(new Bullet(new Image(Assets.BULLET_RED_REAL), 24, 24, 12, 12, 180+ Math.random()*40 - 20, 5, 0, true, 4), x, y, new Image(Assets.BULLET_RED_REAL));
				shoot(new Bullet(new Image(Assets.BULLET_RED_REAL), 24, 24, 12, 12, 270+ Math.random()*40 - 20, 5, 0, true, 4), x, y, new Image(Assets.BULLET_RED_REAL));
				
			//	shoot(new Bullet(new Image(BULLET), 24, 24, 12, 12, pointDirection(x,y,Listener.x2,Listener.y2), 5, 0, true, 4), x, y, new Image(BULLET));
			//	shoot(new Bullet(new Image(BULLET), 24, 24, 12, 12, 360*Math.random(), 5, 0, true, 4), x, y, new Image(BULLET));
			}
		}
		
	}
}