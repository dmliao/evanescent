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
	public class ForPauseM_R00 extends ForPauseEnemy
	{
		public var pauseShootTimer:Number = 0;
		public var indivShotTimer:Number = 0;
		public var shotNumber:Number = 0;
		
		public var bimage:Image;
		
		//TIMERS
		
		
		//INITIALIZE IMAGES
		public function ForPauseM_R00(xx:Number,yy:Number) 
		{
			bimage = new Image(Assets.BULLET_RED_REAL);
			super(new Image(Assets.MX_WING_REAL), new Image(Assets.MX_WING_REAL), 1, 4, 0.5, null, 4, 200, 200, 100, 100, 20, 300, xx, yy, true);
			graphic = currentImage;
			
			currentImage.scale = scaleFactor / 3 * 2
		}
		override public function update():void
		{
			currentImage.scale = scaleFactor / 3 * 2;
			super.update();
			pauseShootTimer += FP.elapsed;
			if (pauseShootTimer > 1.3)
			{
				indivShotTimer += FP.elapsed;
				if (indivShotTimer > 0.45 && shotNumber < 6)
				{
					//shoot(new AniBullet(24, 24, 12, 12, direction, 6, 0, false), x, y + 100);
					shoot(new Bullet(bimage, 32, 32, 16, 16, direction + 40, 4, 0, true, 2, 0.85), x, y + 100, bimage);
					shoot(new Bullet(bimage, 32, 32, 16, 16, direction - 40, 4, 0, true, 2, 0.85), x, y + 100, bimage);
					
					indivShotTimer = 0;
					shotNumber += 1;
				}
			}
			
		}
		
		override public function removed():void
		{
			super.removed();
			var Ex01:Entity = new Explosion_Imagination(x, y);
			FP.world.add(Ex01);
		}
		
		
		
	}
	
}