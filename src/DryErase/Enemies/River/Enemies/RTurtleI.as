package DryErase.Enemies.River.Enemies
{
	import DryErase.Effects.Explosion_Imagination;
	import DryErase.Enemies.Bullets.AniBullet;
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Generic.PauseEnemy;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class RTurtleI extends PauseEnemy
	{
		public var movingRight:Boolean;
		//INITIALIZE IMAGES
		private var shootTimer:Number = 2;
		private var shootTimes:Number = 0;
		public function RTurtleI(right:Boolean, field:Boolean = false)
		{
			movingRight = right;
			
			super(new Image(Assets.R_TURTLE_IMAG), new Image(Assets.R_TURTLE_IMAG), 1.5, 4, 0, null, 4, 300 - (Number(right)* 80), 144, 144, 72, 72, 20, 300, 200 + (Number(right)* 200), 0, field);
			
			
		}
		override public function update():void
		{
			super.update();
			shootTimer -= FP.elapsed;
			if (shootTimer <= 0 && shootTimes < 3)
			{
				shoot(new AniBullet(24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2), 3, 0, false),x,y);
				shoot(new AniBullet(24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2), 3, 0.5, false),x,y);
				shoot(new AniBullet(24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2), 3, -0.5, false),x,y);
				shootTimer = 0.2;
				shootTimes += 1;
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