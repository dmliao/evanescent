package DryErase.Enemies.Flower.Enemies
{
	import DryErase.Enemies.Bullets.AniBullet;
	import DryErase.Enemies.Generic.ForEnemy;
	import DryErase.Hero.Listener;
	
	import com.debug.Debug;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class BJetR extends ForEnemy
	{
		[Embed(source = '../assets/JetReal.png')]
		private const IMAGE:Class;
		
		public var shooting:Boolean = false;
		public var random:Number = Math.random()*360;
		public var timer:Number = 0;
		public function BJetR(xx:Number)
		{
			
			super(new Image(IMAGE), new Image(IMAGE), 5, 100, 4, pointDirection(x,y,Listener.x2,Listener.y2),xx,-72,true,80,80,40,40,0.6);
			direction=pointDirection(x,y,Listener.x2,Listener.y2);
			
		}
		override public function update():void
		{
			super.update();
			timer += FP.elapsed;
			if (timer > 2)
			{
				direction = 270;
				moveSpeed = 5;
				shooting = true;
				timer = -100;
			}
			if (shooting == true)
			{
				shooting = false;
				//shoot everything!
				shoot(new AniBullet(24, 24, 12, 12, random, 3, 0.1, true),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 45+random, 3, 0.1, true),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 90+random, 3, 0.1, true),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 135+random, 3, 0.1, true),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 180+random, 3, 0.1, true),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 225+random, 3, 0.1, true),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 270+random, 3, 0.1, true),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 315+random, 3, 0.1, true),x,y);
			}
		}
	}
}