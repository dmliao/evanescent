package DryErase.Enemies.River.Enemies
{
	import DryErase.Enemies.Bullets.AniBullet;
	import DryErase.Enemies.Generic.DivingEnemy;
	
	import com.debug.Debug;
	
	import net.flashpunk.graphics.Image;

	public class FlyingFish extends DivingEnemy
	{
		public function FlyingFish(xx:Number)
		{
			//PUT STUFF IN HERE! WE NEED TWO IMAGES! :D
			super(new Image(Assets.R_FLYINGFISH_IMAG), new Image(Assets.R_FLYINGFISH_REAL), new Image(Assets.R_FLYINGFISH_IMAG), 4, 125, 3, 270, xx, -72, false, 72, 96, 36, 48, 0.5, 0, 0.05);
		}
		override public function update():void
		{
			super.update();
			if (depth <= 0)
			{

				shoot(new AniBullet(24,24,12,12, 30 - Math.random()*60, 4, 0, false),x,y);
				shoot(new AniBullet(24,24,12,12, 210 - Math.random()*60, 4, 0, false),x,y);
			}
			if (depth >= 1)
			{
				shoot(new AniBullet(24,24,12,12, 30 - Math.random()*60, 4, 0, true, "green"),x,y);
				shoot(new AniBullet(24,24,12,12, 210 - Math.random()*60, 4, 0, true, "green"),x,y);
			}
		}
	}
}