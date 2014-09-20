package DryErase.Enemies.Mountain.Enemies
{
	import DryErase.Effects.Explosion_Imagination;
	import DryErase.Enemies.Bullets.AniBullet;
	import DryErase.Enemies.Bullets.WaveBullet;
	import DryErase.Enemies.Generic.ForPauseEnemy;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	
	public class BirdM extends ForPauseEnemy
	{
		
		public var startShootTimer:Number = 1.8;
		public var stopShootTimer:Number = 20;
		public var shootPauseTimer:Number = 0;
		public function BirdM()
		{
			
			super(new Image(Assets.MX_BIRD_IMAG), new Image(Assets.MX_BIRD_IMAG), 1, 20, 0, null, 3.5, 312, 240, 156, 120, 20, 500, 320, -96, false);
			
			imageScale = 1.4;
		}
		
		override public function update():void
		{
			super.update();
			
			startShootTimer -= FP.elapsed;
			stopShootTimer -= FP.elapsed;
			shootPauseTimer -= FP.elapsed;

			if (startShootTimer <= 0 && stopShootTimer > 0)
			{
				if (shootPauseTimer <= 0)
				{
					shootPauseTimer = 0.5;
					var bullet:Entity = FP.world.add(new WaveBullet(new Image(Assets.BULLET_WAVE), 200, 50, 100, 25, 270, 2, false, 0.25, 0.025, 0.035));
					bullet.x = x;
					bullet.y = y+ 84;
				}
			}
		}
	}
}