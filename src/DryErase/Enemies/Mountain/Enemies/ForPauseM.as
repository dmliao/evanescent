/**
 * UNUSED
 */
package DryErase.Enemies.Mountain.Enemies
{
	import DryErase.Effects.*;
	import DryErase.Enemies.Bullets.*;
	import DryErase.Enemies.Generic.ForPauseEnemy;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class ForPauseM extends ForPauseEnemy
	{
		[Embed(source = '../../Generic/assets/Enemy_Wing.png')]
		private const IMAGE:Class;
		
		public var pauseShootTimer:Number = 0;
		public var indivShotTimer:Number = 0;
		public var shotNumber:Number = 0;
		
		public function ForPauseM(xx:Number,yy:Number)
		{
			super(new Image(Assets.MX_WING_REAL), new Image(Assets.MX_WING_REAL), 1, 3, 0.5, null, 4, 200, 200, 100, 100, 18, 300, xx, yy, true);
			graphic = currentImage;
			currentImage.color = 0x689264;
			
		}
		override public function update():void
		{
			
			super.update();
			currentImage.scale = scaleFactor / 3 * 2;
			pauseShootTimer += FP.elapsed;
			if (pauseShootTimer > 1.3)
			{
				indivShotTimer += FP.elapsed;
				if (indivShotTimer > 0.55 && shotNumber < 5)
				{
					shoot(new AniBullet(24, 24, 12, 12, direction, 6, 0, true), x, y + 100);
					shoot(new AniBullet(24, 24, 12, 12, direction - 40, 6, -0.5, true), x, y + 100);
					shoot(new AniBullet(24, 24, 12, 12, direction + 40, 6, 0.5, true), x, y + 100);
					
					shoot(new AniBullet(24, 24, 12, 12, direction - 60, 6, 0.5, true), x, y + 100);
					shoot(new AniBullet(24, 24, 12, 12, direction + 60, 6, -0.5, true), x, y + 100);
					
					indivShotTimer = 0;
					shotNumber += 1;
				}
			}
			
		}
		
		override public function removed():void
		{
			super.removed();
			var Ex01:Entity = new Explosion_Reality(x, y, 2.3);
			FP.world.add(Ex01);
		}
	}
}