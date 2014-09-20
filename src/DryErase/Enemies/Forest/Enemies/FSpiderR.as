package DryErase.Enemies.Forest.Enemies
{
	import DryErase.Enemies.Bullets.AniBullet;
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Forest.WaveControl.Master_F;
	import DryErase.Enemies.Generic.ForPauseEnemy;
	import DryErase.Hero.Listener;
	
	import com.debug.Debug;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class FSpiderR extends ForPauseEnemy
	{
		//TODO: Put shooting patterns here
		public var shootTimer:Number = -1;
		public var phase:Number = 0;
		public var phaseTimer:Number = 0;
		private var miniTurn:Number = 0;
		private var smallTimer:Number = 0;
		
		public function FSpiderR()
		{
			
			super(new Image(Assets.F_SPIDER_REAL), new Image(Assets.F_SPIDER_REAL), 1.5, 50, 4, null, 3, 200,200,100,100,100,1000,320,-72,true);
		}
		override public function update():void
		{
			super.update();
			
			shootTimer += FP.elapsed;
			
			phaseTimer += FP.elapsed;
			
			miniTurn += 0.5 * Main.frameRate * FP.elapsed;
			
			if (phaseTimer > 5)
			{
				phase += 1;
				if (phase >= 3)
				{
					phase = 0;
				}
				phaseTimer = 0;
			}
			
			if (shootTimer > 0.25)
			{
				shootTimer = 0;
				
				//switch bullet patterns depending on the phase
				switch (phase)
				{
					case 0:
					{
						shootArc();
					}break;
					case 1:
					{
						shootFlower();
					}break;
					case 2:
					{
						shootBeam();
					}break;
				}
			}
			
			//	pauseAlarm = 3;
		}
		
		public function shootArc():void
		{
			smallTimer += 1;
			shoot(new Bullet(new Image(Assets.BULLET_RED_REAL), 24,24,12,12,0,4,0,true,3),x,y,new Image(Assets.BULLET_RED_REAL));
			shoot(new Bullet(new Image(Assets.BULLET_RED_REAL), 24,24,12,12,30,4,0,true,3),x,y,new Image(Assets.BULLET_RED_REAL));
			shoot(new Bullet(new Image(Assets.BULLET_RED_REAL), 24,24,12,12,60,4,0,true,3),x,y,new Image(Assets.BULLET_RED_REAL));
			shoot(new Bullet(new Image(Assets.BULLET_RED_REAL), 24,24,12,12,90,4,0,true,3),x,y,new Image(Assets.BULLET_RED_REAL));
			shoot(new Bullet(new Image(Assets.BULLET_RED_REAL), 24,24,12,12,120,4,0,true,3),x,y,new Image(Assets.BULLET_RED_REAL));
			shoot(new Bullet(new Image(Assets.BULLET_RED_REAL), 24,24,12,12,150,4,0,true,3),x,y,new Image(Assets.BULLET_RED_REAL));
			shoot(new Bullet(new Image(Assets.BULLET_RED_REAL), 24,24,12,12,180,4,0,true,3),x,y,new Image(Assets.BULLET_RED_REAL));
			shoot(new Bullet(new Image(Assets.BULLET_RED_REAL), 24,24,12,12,210,4,0,true,3),x,y,new Image(Assets.BULLET_RED_REAL));
			shoot(new Bullet(new Image(Assets.BULLET_RED_REAL), 24,24,12,12,240,4,0,true,3),x,y,new Image(Assets.BULLET_RED_REAL));
			shoot(new Bullet(new Image(Assets.BULLET_RED_REAL), 24,24,12,12,270,4,0,true,3),x,y,new Image(Assets.BULLET_RED_REAL));
			shoot(new Bullet(new Image(Assets.BULLET_RED_REAL), 24,24,12,12,300,4,0,true,3),x,y,new Image(Assets.BULLET_RED_REAL));
			shoot(new Bullet(new Image(Assets.BULLET_RED_REAL), 24,24,12,12,330,4,0,true,3),x,y,new Image(Assets.BULLET_RED_REAL));
		}
		
		public function shootFlower():void
		{
			shoot(new AniBullet(24, 24, 12, 12, miniTurn, 3, -0.2, true),x,y);
			shoot(new AniBullet(24, 24, 12, 12, 60 + miniTurn, 3, -0.2, true),x,y);
			shoot(new AniBullet(24, 24, 12, 12, 120 + miniTurn, 3, -0.2, true),x,y);
			shoot(new AniBullet(24, 24, 12, 12, 180 + miniTurn, 3, -0.2, true),x,y);
			shoot(new AniBullet(24, 24, 12, 12, 240 + miniTurn, 3, -0.2, true),x,y);
			shoot(new AniBullet(24, 24, 12, 12, 300 + miniTurn, 3, -0.2, true),x,y);
			
			
			shoot(new AniBullet(24, 24, 12, 12, -miniTurn, 3, 0.2, true),x,y);
			shoot(new AniBullet(24, 24, 12, 12, 60 - miniTurn, 3, 0.2, true),x,y);
			shoot(new AniBullet(24, 24, 12, 12, 120 - miniTurn, 3,0.2, true),x,y);
			shoot(new AniBullet(24, 24, 12, 12, 180 - miniTurn, 3, 0.2, true),x,y);
			shoot(new AniBullet(24, 24, 12, 12, 240 - miniTurn, 3, 0.2, true),x,y);
			shoot(new AniBullet(24, 24, 12, 12, 300 - miniTurn, 3, 0.2, true),x,y);
		}
		
		public function shootBeam():void
		{
			shoot(new AniBullet(24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2),5,0,true),x,y);
			shoot(new AniBullet(24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2)+5,5,0,true),x,y);
			shoot(new AniBullet(24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2)-5,5,0,true),x,y);
			shoot(new AniBullet(24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2)+10,5,0,true),x,y);
			shoot(new AniBullet(24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2)-10,5,0,true),x,y);
			//	shoot(new AniBullet(24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2)+15,7,0,true),x,y);
			//	shoot(new AniBullet(24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2)-15,7,0,true),x,y);
			//	shoot(new AniBullet(24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2)+20,7,0,true),x,y);
			//	shoot(new AniBullet(24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2)-20,7,0,true),x,y);
		}
		
		override public function removed():void
		{
			Master_F.spiderReset = false;
			Master_F.spidersKilled += 1;
			super.removed();
		}
	}
}