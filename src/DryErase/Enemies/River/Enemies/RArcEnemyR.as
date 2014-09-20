package DryErase.Enemies.River.Enemies
{
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Generic.ArcEnemy;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class RArcEnemyR extends ArcEnemy
	{
		
		//ALARMS
		private var deleteAlarm:Number = 0;
		private var shootAlarm:Number = 0;
		public var reloadTimer:Number = 0;
		public var shotTimes:Number = 0;
		
		public var shootRight:Boolean;
		
		public function RArcEnemyR(clockwise:Boolean, xx:Number = 0, yy:Number = 0,startDirection:Number = 0) 
		{
			super(new Image(Assets.R_LADY_REAL), new Image(Assets.R_LADY_REAL), 2, 50, 5, -64, 96, true, 64, 48, 32, 24, startDirection, 2, 0.05, clockwise);
			x = xx;
			y = yy;
			shootRight = clockwise;
			imageScale = 0.4;
		}
		
		override public function update():void
		{
			super.update();
			deleteAlarm += FP.elapsed;
			shootAlarm += FP.elapsed;
			
			if (shootAlarm > 1)
			{
				
				shootAlarm = 0;
				shoot(new Bullet(new Image(Assets.BULLET_GREEN_REAL), 24, 24, 12, 12, pointDirection(x,y,Listener.x2,Listener.y2), 4, 0, true, 2), x, y, new Image(Assets.BULLET_GREEN_REAL));
				
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