package DryErase.Enemies.River.Enemies.Boss
{
	import DryErase.Enemies.Boss;
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Hero.Listener;
	
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class RBossUpper extends Boss
	{
		
		public var alarm:Number = 0.35;
		
		public var upImag:Image = new Image(Assets.GUEY_UPPER_IMAG_UP);
		public var up2Imag:Image = new Image(Assets.GUEY_UPPER_IMAG_UP);
		public var downImag:Image = new Image(Assets.GUEY_UPPER_IMAG_DOWN);
		
		public var upReal:Image = new Image(Assets.GUEY_UPPER_REAL_UP);
		public var downReal:Image = new Image(Assets.GUEY_UPPER_REAL_DOWN);
		
		public static var neckPoint:Point = new Point(0,0);
		public static var tailPoint:Point = new Point(0,0);
		
		public var imageAlarm:Number = 0;
		public var temp:Image;
		
		public static var dir:Number = 0;
		public function RBossUpper()
		{
			dir = direction;
			upImag.centerOO();
			upImag.smooth = true;
			downImag.centerOO();
			downImag.smooth = true;
			upReal.centerOO();
			upReal.smooth = true;
			
			downReal.centerOO();
			downReal.smooth = true;
			super(up2Imag,up2Imag,up2Imag,200, 600, 0, 200, 140, 100, 70, 1);
			fixDirection = true;
			temp = downImag;
			drawShadow = false;
		}
		override public function update():void
		{
			if (RBoss.numDead < 4)
			{
				if (deathTrigger == true)
				{
					upImag.color = 0xCCCCCC;
					upReal.color = 0xFFA9A9;
					downImag.color = 0xCCCCCC;
					downReal.color = 0xFFA9A9;
				}
			super.update();
			upd();
			dir = RBossHead.dir;
			}

		}
		public function upd():void
		{
			neckPoint.x = RBossHead.neckPoint.x;
			neckPoint.y = RBossHead.neckPoint.y;
			
			imageAlarm += FP.elapsed;
			scaleFactor = 1 - (( -(y) + 600) / 1200);
			
			upImag.scale = scaleFactor * imageScale;
			downImag.scale = scaleFactor * imageScale;
			upReal.scale = scaleFactor * imageScale;
			downReal.scale = scaleFactor * imageScale;
			if (RBossHead.dir <90 || RBossHead.dir > 270)
			{
				x = neckPoint.x - 212*scaleFactor;
				tailPoint.x = x - 120*scaleFactor;
			}
			else
			{
				x = neckPoint.x + 212*scaleFactor;
				tailPoint.x = x + 120*scaleFactor;
			}
			if (RBossHead.dir >=0 && RBossHead.dir < 180)
			{
				y = neckPoint.y + 85*scaleFactor;
				tailPoint.y = y + 90*scaleFactor;
			}
			else
			{
				y = neckPoint.y - 176*scaleFactor;
				tailPoint.y = y + 32*scaleFactor;
			}
			
			
			graphic = temp;
			
			if (RBossHead.dir > 0 && RBossHead.dir <180)
			{
				if (Listener.currentField == false)
				{
					temp = upImag;
				}
				else
				{
					temp = upReal;
				}
			}
			else
			{
				if (Listener.currentField == false)
				{
					temp = downImag;
				}
				else
				{
					temp = downReal;
				}
			}
			
			if (RBossHead.dir >90 && RBossHead.dir < 270)
			{
				upImag.flipped = true;
				downImag.flipped = true;
				
				upReal.flipped = true;
				downReal.flipped = true;
			}
			else
			{
				upImag.flipped = false;
				downImag.flipped = false;
				
				upReal.flipped = false;
				downReal.flipped = false;
			}
			
			neckPoint.x = RBossHead.neckPoint.x;
			neckPoint.y = RBossHead.neckPoint.y;
			
			
		}
		public function shootDir():void
		{
			//	shoot(new Bullet(new Image(Assets.BULLET_GSTAR_IMAG), 30,30,15,15,direction,4, 0, false, 1),x,y,new Image(Assets.BULLET_GSTAR_IMAG));
			shoot(new Bullet(new Image(Assets.BULLET_GSTAR_REAL), 30,30,15,15,direction+90,4, 0, true, 3),x,y,new Image(Assets.BULLET_GSTAR_REAL));
			//	shoot(new Bullet(new Image(Assets.BULLET_GSTAR_IMAG), 30,30,15,15,direction+180,4, 0, false, 1),x,y,new Image(Assets.BULLET_GSTAR_IMAG));
			shoot(new Bullet(new Image(Assets.BULLET_GSTAR_REAL), 30,30,15,15,direction+270,4, 0, true, 3),x,y,new Image(Assets.BULLET_GSTAR_REAL));
			shoot(new Bullet(new Image(Assets.BULLET_GSTAR_IMAG), 30,30,15,15,direction+45,4, 0, false, -3),x,y,new Image(Assets.BULLET_GSTAR_IMAG));
			shoot(new Bullet(new Image(Assets.BULLET_GSTAR_IMAG), 30,30,15,15,direction+135,4, 0, false, -3),x,y,new Image(Assets.BULLET_GSTAR_IMAG));
			shoot(new Bullet(new Image(Assets.BULLET_GSTAR_IMAG), 30,30,15,15,direction+225,4, 0, false, -3),x,y,new Image(Assets.BULLET_GSTAR_IMAG));
			shoot(new Bullet(new Image(Assets.BULLET_GSTAR_IMAG), 30,30,15,15,direction+315,4, 0, false, -3),x,y,new Image(Assets.BULLET_GSTAR_IMAG));
		}
		
		override public function render():void
		{
			super.render();
		}
		
	}
}