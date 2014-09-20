package DryErase.Enemies.River.Enemies.Boss
{
	import DryErase.Enemies.Bullets.AniBullet;
	import DryErase.Enemies.Generic.ForEnemy;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class RShipCannon extends ForEnemy
	{
		public var alarm:Number = 0;
		public function RShipCannon(dir:Number, rightCannon:Boolean)
		{
			var xxx:Number;
			if (rightCannon)
			{
				xxx = 376;
			}
			else
			{
				xxx = 294;
			}
			super(new Image(Assets.R_CANNONBALL), new Image(Assets.R_CANNONBALL), 5, 0, 3, dir, xxx, 108, true, 100, 100, 50, 50, 0.7, 0);
			fixDirection = true;
			imageScale = 0.5;
		}
		override public function update():void
		{	
			if (alarm > 2)
			{
				FP.world.remove(this);
			}
			else
			{
				alarm += FP.elapsed;
			super.update();
			currentImage.angle += 1;
			layer = -300;
			}
		}
		override public function removed():void
		{
			
			super.removed();
			shoot(new AniBullet(0,0,0,0,direction, 4, 0, true, "red"),x,y);
			shoot(new AniBullet(0,0,0,0,direction+45, 4, 0, true, "red"),x,y);
			shoot(new AniBullet(0,0,0,0,direction+90, 4, 0, true, "red"),x,y);
			shoot(new AniBullet(0,0,0,0,direction+135, 4, 0, true, "red"),x,y);
			shoot(new AniBullet(0,0,0,0,direction+180, 4, 0, true, "red"),x,y);
			shoot(new AniBullet(0,0,0,0,direction+225, 4, 0, true, "red"),x,y);
			shoot(new AniBullet(0,0,0,0,direction+270, 4, 0, true, "red"),x,y);
			shoot(new AniBullet(0,0,0,0,direction+315, 4, 0, true, "red"),x,y);
			
			
		}
	}
}