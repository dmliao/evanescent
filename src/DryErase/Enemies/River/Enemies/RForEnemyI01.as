package DryErase.Enemies.River.Enemies
{
	import DryErase.Enemies.Generic.ForwardEnemy;
	import DryErase.Hero.Listener;
	
	import DryErase.Enemies.Bullets.AniBullet;
	
	import net.flashpunk.FP;
	
	import net.flashpunk.graphics.Image;
	
	public class RForEnemyI01 extends ForwardEnemy
	{
		
		public var shooterTimer:Number;
		public var shooterReset:Number;
		
		public function RForEnemyI01(xx:Number, shootTimer:Number)
		{
			super(new Image(Assets.R_LADY_IMAG), new Image(Assets.R_LADY_IMAG), 5, 50, 2, xx, -72, false, 64, 48, 32, 24);
			shooterTimer = shootTimer;
			shooterReset = shootTimer;
			imageScale = 0.35;
		}
		
		override public function update():void
		{
			super.update();
			shooterTimer -= FP.elapsed;
			if (shooterTimer < 0)
			{
				shooterTimer = 3;
				//shoot!
				
				shoot(new AniBullet(24, 24, 12, 12, 360 * Math.random(), 2.5, 0, false), x, y + 35);
				shoot(new AniBullet(24, 24, 12, 12, 360 * Math.random(), 2.5, 0, false), x, y + 35);
				shoot(new AniBullet(24, 24, 12, 12, 360 * Math.random(), 2.5, 0, false), x, y + 35);
			}	
			
		}
	}
}