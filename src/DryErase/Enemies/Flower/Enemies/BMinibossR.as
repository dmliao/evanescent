package DryErase.Enemies.Flower.Enemies
{
	import DryErase.Effects.Explosion_Imagination;
	import DryErase.Effects.Explosion_Reality;
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Enemy;
	import DryErase.Enemies.Flower.WaveControl.Master_B;
	import DryErase.Enemies.Generic.CirclerEnemy;
	import DryErase.Hero.Listener;
	
	import com.debug.Debug;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class BMinibossR extends Enemy
	{
		
		public var shooterTimer:Number;
		public var shooterReset:Number;
		
		public var shooterTimer2:Number = 0;
		public var reloadTimer:Number = 0;
		public var shotTimes:Number = 0;
		
		public var moveDir:Number = 0;
		
		public var introd:Boolean = false;
		
		public var image:Image;
		//START SHOOT TIMER is the time before the enemy fires the first shot, and then shootTimer is the amount of time between shots
		public function BMinibossR()
		{
			image = new Image(Assets.BULLET_GREY_REAL);
			super(new Image(Assets.B_FLOWERBOSS), new Image(Assets.B_FLOWERBOSS), 125, 500, true, 0, 200, 200, 100, 100,1,false,0);
			shooterTimer = 2;
			shooterReset = 1;
			fixDirection = true;
			drawShadow = false;
		}
		
		override public function update():void
		{
			
			super.update();
			if (introd == false)
			{
				if (x < 320-8 || x > 320 + 8 || y < 120 - 8 || y > 120 + 8)
				{
					moveDirection(pointDirection(x,y,320,120),3);
				
				}
				else
				{
					x = 320;
					y = 120;
					introd = true;
				}
			}
			else
			{
				if (moveDir == 0 && x > 500)
				{
					moveDir = 90;
					x = 500;
				}
				if (moveDir == 90 && y < 120)
				{
					moveDir = 180;
					y = 120;
				}
				if (moveDir == 180 && x < 140)
				{
					moveDir = 270;
					x = 140;
				}
				if (moveDir == 270 && y > 360)
				{
					moveDir = 0;
					y=360;
				}
				moveDirection(moveDir,3);
			}
			
			currentImage.angle -= 2 * Main.frameRate * FP.elapsed;
			shooterTimer -= FP.elapsed;
			if (shooterTimer <= 0)
			{
				shoot(new Bullet(image, 24,24,12,12, direction, 3, 0, true, 4, 0.6), x, y, new Image(Assets.BULLET_GREY_REAL));
				shoot(new Bullet(image, 24,24,12,12, direction + 120, 3, 0, true, 4, 0.6), x, y, new Image(Assets.BULLET_GREY_REAL));
				shoot(new Bullet(image, 24,24,12,12, direction + 240, 3, 0, true, 4, 0.6), x, y, new Image(Assets.BULLET_GREY_REAL));
				shoot(new Bullet(new Image(Assets.BULLET_RED_REAL), 24,24,12,12, pointDirection(x,y,Listener.x2,Listener.y2),4,0,true,2), x, y, new Image(Assets.BULLET_RED_REAL));
				shoot(new Bullet(new Image(Assets.BULLET_RED_REAL), 24,24,12,12, pointDirection(x,y,Listener.x2,Listener.y2)+30,4,-0.5,true,2), x, y, new Image(Assets.BULLET_RED_REAL));
				shoot(new Bullet(new Image(Assets.BULLET_RED_REAL), 24,24,12,12, pointDirection(x,y,Listener.x2,Listener.y2)-30,4,0.5,true,2), x, y, new Image(Assets.BULLET_RED_REAL));
				shooterTimer = shooterReset;
			}
			
			if (hitPoints <= 90)
			{
				shooterTimer2 += FP.elapsed;
				if (shooterTimer2 >= 3)
				{
					reloadTimer += FP.elapsed;
					if (reloadTimer >= 0.75)
					{
						reloadTimer = 0;
						shotTimes += 1;
						if (shotTimes <= 6)
						{
							shoot(new Bullet(new Image(Assets.BULLET_RED_REAL), 24, 24, 12, 12, 0, 4, 0.5, false, 1), x, y, new Image(Assets.BULLET_RED_REAL));
							shoot(new Bullet(new Image(Assets.BULLET_RED_REAL), 24, 24, 12, 12, 45, 4, 0.5, false, 1), x, y, new Image(Assets.BULLET_RED_REAL));
							shoot(new Bullet(new Image(Assets.BULLET_RED_REAL), 24, 24, 12, 12, 90, 4, 0.5, false, 1), x, y, new Image(Assets.BULLET_RED_REAL));
							shoot(new Bullet(new Image(Assets.BULLET_RED_REAL), 24, 24, 12, 12, 135, 4, 0.5, false, 1), x, y, new Image(Assets.BULLET_RED_REAL));
							shoot(new Bullet(new Image(Assets.BULLET_RED_REAL), 24, 24, 12, 12, 180, 4, 0.5, false, 1), x, y, new Image(Assets.BULLET_RED_REAL));
							shoot(new Bullet(new Image(Assets.BULLET_RED_REAL), 24, 24, 12, 12, 225, 4, 0.5, false, 1), x, y, new Image(Assets.BULLET_RED_REAL));
							shoot(new Bullet(new Image(Assets.BULLET_RED_REAL), 24, 24, 12, 12, 270, 4, 0.5, false, 1), x, y, new Image(Assets.BULLET_RED_REAL));
							shoot(new Bullet(new Image(Assets.BULLET_RED_REAL), 24, 24, 12, 12, 315, 4, 0.5, false, 1), x, y, new Image(Assets.BULLET_RED_REAL));
						}
						else
						{
							shotTimes = 0;
							shooterTimer2 = 0;
						}
					}
				}
			}
		}
		override public function removed():void
		{
			super.removed();
			Master_B.minibossKilled = true;
			var Ex01:Entity = new Explosion_Reality(x, y);
			FP.world.add(Ex01);
		}
	}
}