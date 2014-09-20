package DryErase.Enemies.Flower.Enemies
{
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Generic.ForPauseEnemy;
	
	import net.flashpunk.graphics.Image;

	public class BFlowerR002 extends ForPauseEnemy
	{
		private var turn:Number = 2;
		private var totalTurn:Number = 0;
		private var shootAlarm:Number = 0;
		private var shootAlarm2:Number = 0;
		
		private var turnClockwise:Boolean;
		public function BFlowerR002(clockwise:Boolean = true, startDir:Number = 270)
		{
			turnClockwise = clockwise;
			totalTurn = startDir;
			super(new Image(Assets.B_FLOWER_REAL), new Image(Assets.B_FLOWER_REAL), 1, 12, 0, null, 4, 64, 64, 32, 32, 25, 120, 320, -72, false);
		}
		override public function update():void
		{
			shootAlarm += FP.elapsed;
			shootAlarm2 += FP.elapsed;
			super.update();
			if (turnClockwise)
			{
				totalTurn -= Turn;
				miniTurn -= 0.5;
			}
			else
			{
				totalTurn += turn;
				miniTurn += 0.5;
			}
			currentImage.angle = totalTurn;
			if (shootAlarm > 1.5 && shootAlarm < 12)
			{
				if (shootAlarm2 > 0.06)
				{
					shootAlarm2 = 0;
					shoot(new Bullet(new Image(Assets.BULLET_BLUE_REAL),24,24,12,12,totalTurn,5,0,true,3),x,y,new Image(Assets.BULLET_BLUE_REAL));
				}
			}
		}
	}
}