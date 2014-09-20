package DryErase.Enemies.Flower.Enemies
{
	import DryErase.Enemies.Generic.ForPauseEnemy;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import DryErase.Enemies.Bullets.AniBullet;
	
	public class BFlowerBHR extends ForPauseEnemy
	{
		private var turn:Number = 2;
		private var totalTurn:Number = 0;
		private var miniTurn:Number = 0;
		private var shootAlarm:Number = 0;
		private var shootAlarm2:Number = 0;
		public function BFlowerBHR()
		{
			super(new Image(Assets.B_FLOWER_REAL), new Image(Assets.B_FLOWER_REAL), 1, 12, 0, null, 4, 64, 64, 32, 32, 25, 120, 320, -72, true);
		}
		override public function update():void
		{
			shootAlarm += FP.elapsed;
			shootAlarm2 += FP.elapsed;
			super.update();
			totalTurn += turn * Main.frameRate * FP.elapsed;
			miniTurn += 0.5 * Main.frameRate * FP.elapsed;
			currentImage.angle = totalTurn;
			if (shootAlarm > 1.5 && shootAlarm < 12)
			{
				if (shootAlarm2 > 0.1)
				{
					shootAlarm2 = 0;
					/*		shoot(new AniBullet(24, 24, 12, 12, 0+miniTurn, 3, 0.2, true, "green"),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 45+miniTurn, 3, 0.2, true, "green"),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 90+miniTurn, 3, 0.2, true, "green"),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 135+miniTurn, 3, 0.2, true, "green"),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 180+miniTurn, 3, 0.2, true, "green"),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 225+miniTurn, 3, 0.2, true, "green"),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 270+miniTurn, 3, 0.2, true, "green"),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 315+miniTurn, 3, 0.2, true, "green"),x,y);
					
					shoot(new AniBullet(24, 24, 12, 12, 22+miniTurn, 3, -0.2, true, "green"),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 66+miniTurn, 3, -0.2, true, "green"),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 112+miniTurn, 3, -0.2, true, "green"),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 156+miniTurn, 3, -0.2, true, "green"),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 202+miniTurn, 3, -0.2, true, "green"),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 246+miniTurn, 3, -0.2, true, "green"),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 292+miniTurn, 3, -0.2, true, "green"),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 336+miniTurn, 3, -0.2, true, "green"),x,y);
					*/
					shoot(new AniBullet(24, 24, 12, 12, miniTurn, 3, -0.2, true, "blue"),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 60 + miniTurn, 3, -0.2, true, "blue"),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 120 + miniTurn, 3, -0.2, true, "blue"),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 180 + miniTurn, 3, -0.2, true, "blue"),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 240 + miniTurn, 3, -0.2, true, "blue"),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 300 + miniTurn, 3, -0.2, true, "blue"),x,y);
					
					
					shoot(new AniBullet(24, 24, 12, 12, -miniTurn, 3, 0.2, true, "blue"),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 60 - miniTurn, 3, 0.2, true, "blue"),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 120 - miniTurn, 3,0.2, true, "blue"),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 180 - miniTurn, 3, 0.2, true, "blue"),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 240 - miniTurn, 3, 0.2, true, "blue"),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 300 - miniTurn, 3, 0.2, true, "blue"),x,y);
				}
			}
		}
	}
}