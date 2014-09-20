package DryErase.Enemies.Castle.Boss
{
	import DryErase.Enemies.Boss;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class CHero_Hand extends Boss
	{
		
		public function CHero_Hand()
		{
			super(new Image(Assets.C_HEROHAND_IMAG), new Image(Assets.C_HEROHAND_REAL), new Image(Assets.C_HEROHAND_REAL), 0, 300, 270, 160,160,80,80,0.67);
			fixDirection = true;
			currentImage.angle = 0;
		}
		override public function update():void
		{
			if (CHero.totalHealth > 0)
			{
			super.update();
			
			if (Listener.currentField == false)
			{
				type = "enemy_imagination";
			}
			else
			{
				type = "enemy_reality";
			}
			
			currentImage.angle = direction + 90;
			}
			else
			{
				FP.world.remove(this);
			}
		}
		override public function idleState():void
		{
			super.idleState();
			basicCounter = 0;
			basicTimer = 0;
			if (x < 320-8 || x > 320 + 8 || y < 180 - 8 || y > 180 + 8)
			{
				direction = 270;
				moveDirection(pointDirection(x,y,320,180),3);
				
				
			}
			else
			{
				currentState = "basic";
			}
		}
		public var basicCounter:Number = 0;
		override public function introState():void
		{
			y = 180;
			x = -200;
			currentState = "idle";
		}
		override public function basicState():void
		{
			basicTimer += FP.elapsed;
			if (basicCounter < 6)
			{
			if (basicTimer < 2)
			{
				direction = pointDirection(x,y,Listener.x2,Listener.y2);
			}
			else if (basicTimer > 2 && basicTimer < 3.4)
			{
				moveDirection(direction,5);
			}
			else
			{
				if (x < 320-8 || x > 320 + 8 || y < 180 - 8 || y > 180 + 8)
				{
					direction = 270;
					moveDirection(pointDirection(x,y,320,180),5);
				}
				else
				{
					basicTimer = 0;
					basicCounter += 1;
				}
			}
			}
			else
			{
				basicCounter = 0;
				currentState = "idle";
			}
		}
	}
}