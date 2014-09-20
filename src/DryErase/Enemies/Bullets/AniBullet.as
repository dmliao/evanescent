package DryErase.Enemies.Bullets 
{
	import DryErase.Hero.Listener;
	
	import flash.geom.Point;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;

	/**
	 * ...
	 * @author 
	 */
	public class AniBullet extends Bullet
	{
		
		public var bImage:Spritemap = new Spritemap(Assets.BULLET_ANIBLACK, 32, 32);
		public var rImage:Spritemap = new Spritemap(Assets.BULLET_ANIRED, 32, 32);
		public var gImage:Spritemap = new Spritemap(Assets.BULLET_ANIGREEN, 32, 32);
		public var bbImage:Spritemap = new Spritemap(Assets.BULLET_ANIBLUE, 32, 32);
		public var liImage:Image = new Image(Assets.LUNGBULLET_IMAG);
		public var lrImage:Image = new Image(Assets.LUNGBULLET_REAL);
		
		public var c:String;
		
		public function AniBullet(hboxWidth:Number = 0, hboxHeight:Number = 0, hboxOriginX:Number = 0, hboxOriginY:Number = 0, dir:Number = 0, argspeed:Number = 8, rot:Number = 0, field:Boolean = false, color:String = "red") 
		{
			super(bImage, 24, 24, 12, 12, dir, argspeed, rot, field, 0, 1);
			bImage.centerOO();
			bImage.smooth = true;
			bImage.scale = scaleFactor*1.25;
			bImage.add("anim", [0, 1, 2, 3, 4, 5, 6, 7], 15, true);
			bImage.play("anim");
			
			rImage.centerOO();
			rImage.smooth = true;
			rImage.scale = scaleFactor*1.25;
			rImage.add("anim", [0, 1, 2, 3, 4, 5, 6, 7], 15, true);
			rImage.play("anim");
			
			gImage.centerOO();
			gImage.smooth = true;
			gImage.scale = scaleFactor*1.25;
			gImage.add("anim", [0, 1, 2, 3, 4, 5, 6, 7], 15, true);
			gImage.play("anim");
			
			bbImage.centerOO();
			bbImage.smooth = true;
			bbImage.scale = scaleFactor*1.25;
			bbImage.add("anim", [0, 1, 2, 3, 4, 5, 6, 7], 15, true);
			bbImage.play("anim");
			
			liImage.centerOO();
			liImage.smooth = true;
			liImage.scale = scaleFactor*1.25;
			
			lrImage.centerOO();
			lrImage.smooth = true;
			lrImage.scale = scaleFactor*1.25;
			
			c = color;
			
			layer = 0;
			if (currentField == false)
			{
				if (c != "lung")
				{
					graphic = bImage;
				}
				else
				{
					graphic = liImage;
					liImage.angle = direction;
				}
			}
			else
			{
				if (c == "red")
				{
					graphic = rImage;
				}
				else if (c == "green")
				{
					graphic = gImage;
				}
				else if (c == "blue")
				{
					graphic = bbImage;
				}
				else if (c == "lung")
				{
					graphic = lrImage;
					lrImage.angle = direction;
				}
				
			}
		}
		
		override public function update():void
		{
			if (speed > 2)
			{
				speed -= 0.01;
			}
			super.update();
			
			if (currentField == false)
			{
				if (c != "lung")
				{
					graphic = bImage;
				}
				else
				{
					graphic = liImage;
					liImage.angle = direction;
				}
			}
			else
			{
				if (c == "red")
				{
					graphic = rImage;
				}
				else if (c == "green")
				{
					graphic = gImage;
				}
				else if (c == "blue")
				{
					graphic = bbImage;
				}
				else if (c == "lung")
				{
					graphic = lrImage;
					lrImage.angle = direction;
				}
				
			}
			
			bImage.scale = scaleFactor*1.25;
			bImage.angle += 1 * Main.frameRate * FP.elapsed;
			
			bbImage.scale = scaleFactor*1.25;
			bbImage.angle += 1 * Main.frameRate * FP.elapsed;
	
			if (Listener.currentField == currentField)
			{
				currentImage.alpha = 1;
				rImage.alpha = 1;
				gImage.alpha = 1;
				bImage.alpha = 1;
				bbImage.alpha = 1;
				liImage.alpha = 1;
				lrImage.alpha = 1;
			}
			else
			{
				currentImage.alpha = Main.FADEFIELD;
				rImage.alpha = Main.FADEFIELD;
				gImage.alpha = Main.FADEFIELD;
				bImage.alpha = Main.FADEFIELD;
				bbImage.alpha = Main.FADEFIELD;
				liImage.alpha = Main.FADEFIELD;
				lrImage.alpha = Main.FADEFIELD;
			}
		}
		
		override public function render():void
		{
			super.render();
			
		}
		
	}

}