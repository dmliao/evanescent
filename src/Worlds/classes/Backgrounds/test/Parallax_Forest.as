package Worlds.classes.Backgrounds.test
{
	import DryErase.Hero.Listener;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class Parallax_Forest extends Entity
	{
		[Embed(source = 'ForestImag.png')]
		public const IMAGE:Class;
		[Embed(source = 'ForestImag2.png')]
		public const IMAGE2:Class;
		[Embed(source = 'ForestReal.png')]
		public const IMAGE3:Class;
		[Embed(source = 'ForestReal2.png')]
		public const IMAGE4:Class;
		
		public var scaleFactor:Number = (1 - (( -(y - FP.camera.y) + 600) / 1600))*1.5;
		public var img:Image = new Image(IMAGE);
		public var img2:Image = new Image(IMAGE3);
		public var kind:Number = 0;
		public function Parallax_Forest(yy:Number, k:Number = 1)
		{
			if (k ==1)
			{
				img = new Image(IMAGE);
				img2 = new Image(IMAGE3);
				kind = 1;
			}
			else
			{
				img = new Image(IMAGE2);
				img2 = new Image(IMAGE4);
				kind = 2;
			}
			super(320 + 80 - Math.random()*160,yy, img);
			img.centerOO();
			img2.centerOO();
		}
		override public function update():void
		{
			if (y > 0)
			{
				y += (0.5 + (y/320)) * Main.frameRate * FP.elapsed;
			}
			else
			{
				y += 0.5 * Main.frameRate * FP.elapsed;
			}
			layer = -y / 10 + 80;
			super.update();
			scaleFactor = (1 - (( -(y - FP.camera.y) + 600) / 1600))*1.5;
			img.scale = scaleFactor;
			img2.scale = scaleFactor;
			if (y > 900) 
			{
				y = - 300;
			}
			if (Listener.currentField == false)
			{
				graphic = img;
			}
			else
			{
				graphic = img2;
			}
		}
		
	}
}