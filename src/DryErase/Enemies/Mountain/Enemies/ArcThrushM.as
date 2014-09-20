package DryErase.Enemies.Mountain.Enemies 
{
	import DryErase.Enemies.Bullets.AniBullet;
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Generic.ArcEnemy;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author 
	 */
	public class ArcThrushM extends ArcEnemy
	{
		
		
		
		//ALARMS
		private var deleteAlarm:Number = 0;
		private var shootAlarm:Number = 0;
		
		public function ArcThrushM(clockwise:Boolean, xx:Number = 0, yy:Number = 0,startDirection:Number = 0) 
		{
			super(new Image(Assets.MX_THRUSH_IMAG), new Image(Assets.MX_THRUSH_IMAG), 1, 50, 5, -64, 96, false, 64, 48, 32, 24, startDirection, 2, 0.05, clockwise);
			x = xx;
			y = yy;
		}
		
		override public function update():void
		{
			super.update();
			deleteAlarm += FP.elapsed;
			shootAlarm += FP.elapsed;
			
			if (shootAlarm > 1)
			{
				shoot(new AniBullet(24, 24, 12, 12, pointDirection(x, y, Listener.x2, Listener.y2), 3, 0, false), x, y);
				shootAlarm = -2;
				
			}
			if (deleteAlarm > 9.5)
			{
				if (x < -16 || x > 656)
				{
					FP.world.remove(this);
				}
			}
		}
		
	}

}