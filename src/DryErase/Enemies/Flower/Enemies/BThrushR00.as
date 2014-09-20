package DryErase.Enemies.Flower.Enemies
{
	import DryErase.Enemies.Bullets.AniBullet;
	import DryErase.Enemies.Generic.ForEnemy;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class BThrushR00 extends ForEnemy
	{
		[Embed(source = '../assets/PointThrush_Real.png')]
		private const IMAGE:Class;
		
		public var shooterTimer:Number;
		public var shooterReset:Number;
		
		public var oscilRight:Boolean;
		public function BThrushR00(xx:Number,right:Boolean)
		{
			super(new Image(IMAGE), new Image(IMAGE), 4, 100, 4, 270, xx, -72, true, 64, 64, 32, 32, 0.6, 0);
			shooterTimer = 0.5;
			direction = 270;
			oscilRight = right;
		}
		override public function update():void
		{
			
			super.update();
			shooterTimer -= FP.elapsed;
			
			if (shooterTimer < 0)
			{
				shooterTimer = 1;
				//shoot!
				oscilRight = !oscilRight;
				if (oscilRight == true)
				{
				shoot(new AniBullet(24, 24, 12, 12, pointDirection(x,y, Listener.x2, Listener.y2), 4, 0, true, "blue"), x, y + 35);
				}
				
			}	
			
			if (oscilRight == true)
			{
				direction += 2 * Main.frameRate * FP.elapsed;
			}
			else
			{
				direction -= 2 * Main.frameRate * FP.elapsed;
			}
			
		}
	}
}