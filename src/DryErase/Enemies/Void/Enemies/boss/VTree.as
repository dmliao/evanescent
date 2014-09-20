package DryErase.Enemies.Void.Enemies.boss
{
	import DryErase.Enemies.Enemy;
	import DryErase.Hero.Listener;
	
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class VTree extends Entity
	{
		public var imagImage:Image;
		public var realImage:Image;
		
		public static var waverY:Number = 0;
		public static var Y:Number = -400;
		public var waverUp:Boolean = false;
		public function VTree()
		{
			imagImage=new Image(Assets.V_TREE_IMAG);
			realImage = new Image(Assets.V_TREE_REAL);
			waverY = 0;
			imagImage.centerOO();
			realImage.centerOO();
			y = - 400;
			x = 320;
			
			FP.world.add(new VStoryteller());
			imagImage.alpha = 0.5;
			realImage.alpha = 0.5;
		}
		override public function update():void
		{
			Y = y;
			super.update();
			if (y < 96)
			{
				y += 2;
			}
			if (waverUp == true)
			{
				waverY -= 0.05;
			}
			else
			{
				waverY += 0.05;
			}
			
			if (waverY > 4)
			{
				waverUp = true;
			}
			else if (waverY < -4)
			{
				waverUp = false;
			}
		}
		override public function render():void
		{
			if (Listener.currentField == false)
			{
				imagImage.render(FP.buffer,new Point(x,y + waverY),FP.camera);
			}
			else
			{
				realImage.render(FP.buffer,new Point(x,y + waverY - 16),FP.camera);
			}
		}
	}
}