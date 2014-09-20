package DryErase.Enemies.Forest.Enemies
{
	import DryErase.Enemies.Generic.ForEnemy;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class FCreepI extends ForEnemy
	{
		public var rot:Number = 0;
		public var shockBack:Number = 0;
		public var phase:Boolean = false;
		public var targetDir:Number = 0;
		
		public var chase:Number = 3;
		public function FCreepI(xx:Number)
		{
			super(new Image(Assets.F_ROUND_IMAG), new Image(Assets.F_ROUND_IMAG), 12, 250, 3, 270, xx, -72, false, 200,200,100,100,1,0);
			fixDirection = true;
		}
		override public function update():void	
		{
			super.update();
			shockBack -= FP.elapsed;
			
			currentImage.angle = rot;
			rot+= 4;
			
			if (phase == false)
			{
				if (invincible <= 0)
				{
					if (collide("bullet_imagination", x, y))
					{
						shockBack = 0.7;
					}
				}
				if (shockBack > 0)
				{
					direction = 90;
				}
				else
				{
					direction = 270;
				}
			}
			if (phase == true)
			{
				if (chase > 0)
				{
					targetDir = pointDirection(x,y,Listener.x2,Listener.y2);
					chase -= FP.elapsed;
				}
				direction = targetDir;
				moveSpeed = 5;
			}
			if (y > 480)
			{
				targetDir = pointDirection(x,y,Listener.x2,Listener.y2);
				chase -= FP.elapsed;
				phase = true;
			}
		}
	}
}