package lib
{
	import flash.geom.Point;
	import flash.display.BitmapData;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	
	/**
	 * A graphic that takes a bitmap as input and then splits it into
	 * separate pixels with random speed vectors and updates accordingly.
	 * 
	 * Should only be used on bitmaps with no varying transparency
	 * @author Medice
	 */
	public class SplatterGraphic extends Graphic
	{
		var pixels:Array;
		
		public function SplatterGraphic(original:BitmapData) 
		{
			pixels = new Array();
			
			for (var j:int = 0; j < original.height; ++j) {
				for (var i:int= 0; i < original.width; ++i) {
					if(original.getPixel32(i,j) & 0xFF000000)
						pixels.push([i, j, original.getPixel(i,j), [(Math.random()*10-5), (Math.random()*10-5)] ] );
					// [x, y, color, [x-speed, y-speed]]
				}
			}
			
		}
		override public function update():void 
		{
			for each(var a:Object in pixels) {
				a[0] += a[3][0] * FP.elapsed * 100;
				a[1] += a[3][1] * FP.elapsed * 100;
			}
			super.update();
		}
		override public function render(target:BitmapData, point:Point, camera:Point):void 
		{
			for each(var a:Object in pixels) {
				target.setPixel(a[0] +point.x - camera.x, a[1] + point.y - camera.y, a[2]);
			}
			
			super.render(target, point, camera);
		}
	}
}