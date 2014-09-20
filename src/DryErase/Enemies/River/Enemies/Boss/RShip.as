package DryErase.Enemies.River.Enemies.Boss
{
	import DryErase.Effects.Explosion_Top;
	import DryErase.Enemies.Enemy;
	import DryErase.Enemies.River.WaveControl.Master_R;
	
	import Worlds.classes.River;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class RShip extends Enemy
	{
		public var alarm:Number = 80;
		public var flag:Boolean = false;
		public function RShip()
		{
			super(new Image(Assets.R_SHIP_REAL), new Image(Assets.R_SHIP_REAL), 400, 1500, true, 0, 640, 640, 320,320,1,false);
			FP.world.add(new RTurret());
			this.collidable = false;
			x = 320;
			y = - 1000;
			removeBounds = false;
			sizeScale = false;
			drawShadow = false;
		}
		override public function update():void
		{	
			if (y > 1200)
			{
				Master_R.canCreateBoss = true;
				FP.world.remove(this);
			}
			else
			{
			alarm += FP.elapsed;
			super.update();
			if (y < -200)
			{
				y += 2 * Main.frameRate * FP.elapsed;
			}
			else if (alarm <= 150)
			{
				River.freezeFrame = true;
			}
			if (alarm > 150)
			{
				RTurret.flag = true;
				y += 2;
				River.freezeFrame = false;
				if (y > 200)
				{
					if (flag == false)
					{
						Utils.flash.start(0xFFFFFF, 2, 0.7);
						flag = true;
					}
					River.icedOver = false;
					
				}
				
				
			}
			}
			layer = -100;
			
		}
		
	}
}