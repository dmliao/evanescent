package DryErase.Enemies.River.Enemies.Boss
{
	import DryErase.Effects.Explosion_Top;
	import DryErase.Enemies.Enemy;
	
	import Worlds.classes.River;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class RTurret extends Enemy
	{
		
		public static var flag:Boolean;
		public var count:Number = 0;
		public var shootAlarm:Number = 0;
		
		public function RTurret()
		{
			flag = false;
			
			super(new Image(Assets.R_SHIP_TURRET), new Image(Assets.R_SHIP_TURRET), 300, 1500, true, 0, 240, 240, 120,120,1,false);
			
			x = 332;
			y = - 1000+216;
			removeBounds = false;
			sizeScale = false;
			imageScale = 0.75
			drawShadow = false;
		}
		override public function update():void
		{	
			if (y > 1000)
			{
				FP.world.remove(this);
			}
			else
			{
			super.update();
			
			if (shootAlarm > 3 && flag == false)
			{
				shootAlarm = 0;
				if (count == 0)
				{
					FP.world.add(new Explosion_Top(x+32,100,2));
					FP.world.add(new RShipCannon(270+15-Math.random()*30, true));
					count = 1;
				}
				else if (count == 1)
				{
					FP.world.add(new Explosion_Top(x-32,100,2));
					FP.world.add(new RShipCannon(270+15-Math.random()*30, false));
					count = 2;
				}
				else if (count == 2)
				{
					FP.world.add(new Explosion_Top(x+32,100,2));
					FP.world.add(new Explosion_Top(x-32,100,2));
					FP.world.add(new RShipCannon(270+15-Math.random()*30, false));
					FP.world.add(new RShipCannon(270+15-Math.random()*30, true));
					count = 0;
				}
			}
			if (y < 16)
			{
				y += 2 * Main.frameRate * FP.elapsed;
			}
			else
			{
				shootAlarm += FP.elapsed;
			}
			
			layer = -240;
			
			if (flag == true)
			{
				y += 2;
			}
			}
			
			
		}
		override public function removed():void
		{
			super.removed();
			FP.world.add(new Explosion_Top(x,y,5));
		}
	}
}