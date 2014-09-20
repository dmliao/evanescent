package DryErase.Enemies.Flower.Enemies
{
	import DryErase.Enemies.Bullets.AniBullet;
	import DryErase.Enemies.Generic.ForPauseEnemy;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class BFlowerBHI2 extends ForPauseEnemy
	{
		[Embed(source = '../assets/ThreeFlower.png')]
		private const IMAGE:Class;
		private var turn:Number = 2;
		private var totalTurn:Number = 0;
		private var miniTurn:Number = 0;
		private var shootAlarm:Number = 0;
		private var shootAlarm2:Number = 0;
		public function BFlowerBHI2(xx:Number = 320)
		{
			super(new Image(IMAGE), new Image(IMAGE), 1, 12, 0, null, 4, 64, 64, 32, 32, 25, 120, xx, -72, false);
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
				if (shootAlarm2 > 0.3)
				{
					shootAlarm2 = 0;
					shoot(new AniBullet(24, 24, 12, 12, 0+miniTurn, 3, 0.2, false),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 45+miniTurn, 3, 0.2, false),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 90+miniTurn, 3, 0.2, false),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 135+miniTurn, 3, 0.2, false),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 180+miniTurn, 3, 0.2, false),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 225+miniTurn, 3, 0.2, false),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 270+miniTurn, 3, 0.2, false),x,y);
					shoot(new AniBullet(24, 24, 12, 12, 315+miniTurn, 3, 0.2, false),x,y);
					
		//			shoot(new AniBullet(24, 24, 12, 12, 22+miniTurn, 3, -0.2, false),x,y);
			//		shoot(new AniBullet(24, 24, 12, 12, 66+miniTurn, 3, -0.2, false),x,y);
		//			shoot(new AniBullet(24, 24, 12, 12, 112+miniTurn, 3, -0.2, false),x,y);
			//		shoot(new AniBullet(24, 24, 12, 12, 156+miniTurn, 3, -0.2, false),x,y);
		//			shoot(new AniBullet(24, 24, 12, 12, 202+miniTurn, 3, -0.2, false),x,y);
		//			shoot(new AniBullet(24, 24, 12, 12, 246+miniTurn, 3, -0.2, false),x,y);
			//		shoot(new AniBullet(24, 24, 12, 12, 292+miniTurn, 3, -0.2, false),x,y);
		//			shoot(new AniBullet(24, 24, 12, 12, 336+miniTurn, 3, -0.2, false),x,y);
					
				
				}
			}
		}
	}
}