package DryErase.Enemies.Mountain.Enemies 
{
	import DryErase.Effects.Explosion_Imagination;
	import DryErase.Enemies.Bullets.AniBullet;
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Generic.ForPauseEnemy;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author 
	 */
	public class ForPauseM_SideFlank_I00 extends ForPauseEnemy
	{
		public var pauseShootTimer:Number = 0;
		public var indivShotTimer:Number = 0;
		public var shotNumber:Number = 0;
		
		//TIMERS
		
		
		public function ForPauseM_SideFlank_I00(xx:Number,yy:Number) 
		{
			super(new Image(Assets.MX_WING_IMAG), new Image(Assets.MX_WING_IMAG), 0.8, 4, 0.5, null, 4, 200, 200, 100, 100, 8, 300, xx, yy, false);
			graphic = currentImage;
			
			scaleFactor = scaleFactor / 2;
		}
		override public function update():void
		{
			
			super.update();
			scaleFactor = scaleFactor / 2;
			currentImage.scale = scaleFactor;
			pauseShootTimer += FP.elapsed;
			if (pauseShootTimer > 1)
			{
				indivShotTimer += FP.elapsed;
				if (indivShotTimer > 0.4 && shotNumber < 5)
				{
					//shoot(new AniBullet(24, 24, 12, 12, direction, 6, 0, false), x, y + 100);
					shoot(new AniBullet(24, 24, 12, 12, direction - 30, 4, 0, false), x, y + 100);
					shoot(new AniBullet(24, 24, 12, 12, direction + 30, 4, 0, false), x, y + 100);
					
					indivShotTimer = 0;
					shotNumber += 1;
				}
			}
			
		}
			
	}

}