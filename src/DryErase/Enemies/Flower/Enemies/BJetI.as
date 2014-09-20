package DryErase.Enemies.Flower.Enemies
{
	import DryErase.Enemies.Bullets.AniBullet;
	import DryErase.Enemies.Generic.ForEnemy;
	
	import com.debug.Debug;
	
	import net.flashpunk.graphics.Image;

	public class BJetI extends ForEnemy
	{
		[Embed(source = '../assets/Jet.png')]
		private const IMAGE:Class;
		
		public var shooting:Boolean = false;
		public var random:Number = Math.random()*360;
		public function BJetI(xx:Number)
		{
			
			super(new Image(IMAGE), new Image(IMAGE), 5, 100, 4, pointDirection(x,y,320,160),xx,-72,false,80,80,40,40,0.6);
			direction = pointDirection(x,y,320,160);
			
		}
		override public function update():void
		{
			super.update();
			if (distanceToPoint(320,160) < 4)
			{
				direction = 270+25-Math.random()*50;
				moveSpeed = 5;
				shooting = true;
			}
			if (shooting == true)
			{
				shooting = false;
				//shoot everything!
				shoot(new AniBullet(24, 24, 12, 12, random, 3, 0.1, false),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 45+random, 3, 0.1, false),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 90+random, 3, 0.1, false),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 135+random, 3, 0.1, false),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 180+random, 3, 0.1, false),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 225+random, 3, 0.1, false),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 270+random, 3, 0.1, false),x,y);
				shoot(new AniBullet(24, 24, 12, 12, 315+random, 3, 0.1, false),x,y);
			}
		}
	}
}