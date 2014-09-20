package DryErase.Effects
{
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Entity;

	public class Tests extends Entity
	{
		public var testImage:Image = new Image(FP.buffer);
		public function Tests()
		{
			x = 0;
			y = 0;
			
			FP.buffer.perlinNoise(x,y,1,4,false,true);
			testImage.scale = 0.5;
			graphic = testImage;
			layer = -999999;
		
		}
		override public function update():void
		{
			testImage.update();
			testImage = new Image(FP.buffer);
			FP.buffer.perlinNoise(x,y,1,4,false,true);
		}
	}
}