package DryErase.Enemies.Mountain.Enemies
{
	
	import DryErase.Obstacle.SwitchObstacle;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import DryErase.Effects.*;
	import DryErase.Hero.Listener;
	import flash.geom.Point;

	public class RockM extends SwitchObstacle
	{
		[Embed(source = '../../../Obstacle/assets/Rock_Imagination.png')]
		private const ROCK:Class;
		[Embed(source = '../../../Obstacle/assets/Rock_Reality.png')]
		private const ROCK_REALITY:Class;
		public var invincible:Number; //timer to check invincibility
		public var hitPoints:Number;
		
		public var speed:Number;
		
		private var turnSpeed:Number;
		public function RockM(xx:Number, moveSpeed:Number = 2, hp:Number = 20)
		{
			turnSpeed = Math.random();
			super(new Image(ROCK),new Image(ROCK_REALITY),xx,-120,200,200,400,400,0.5);
			y= - 240;
			x = xx;
			hitPoints = hp;
			
			
			speed = moveSpeed*2+1;
			
		}
		
		override public function update():void
		{
			currentField = Listener.currentField;
			super.update();
			if (invincible > 0)
			{
				currentImage.blend = "lighten";
				realImage.blend = "lighten";
			}
			else {
				currentImage.blend = "normal";
				realImage.blend = "normal";
			}
			if (hitPoints <= 0)
			{
				if (currentField == false)
				{
					FP.world.add(new Explode_Small_Imag(x,y));
					FP.world.remove(this);
				}
				else
				{
					FP.world.add(new Explosion_Reality(x, y, 1.5));
					FP.world.remove(this);
				}
				FP.world.remove(this);
			}
			
			y += speed;
			currentImage.angle += (turnSpeed *2);
			realImage.angle += (turnSpeed *2);
			
			invincible -= FP.elapsed;
			
			if (invincible <= 0)
			{
				if (collide("bullet_imagination", x, y))
				{
					hitPoints -= 1;
					invincible = 0.05;
				}
				if (collide("bullet_laser", x, y))
				{
					hitPoints -= 3;
					invincible = 0.1;
				}
					
				
			}
			
			if (invincible <= 0)
			{
				if (collide("bullet_reality", x, y))
				{
					hitPoints -= 1;
					invincible = 0.05;
				}
			}
			if (collide("bullet_spider", x, y))
			{
				hitPoints -= 1;
				invincible = 0.1;
			}
			
		}
		
		override public function render():void
		{
			super.render();
			currentImage.render(FP.buffer,new Point(x,y),FP.camera);
			realImage.render(FP.buffer,new Point(x,y),FP.camera);
		}
	}
}