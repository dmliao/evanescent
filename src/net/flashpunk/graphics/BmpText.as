package net.flashpunk.graphics 
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import net.flashpunk.graphics.BmpFont;
	import net.flashpunk.graphics.Image;

	public class BmpText extends Image
	{
		private var _bmpfont: BmpFont;
		private var _text: String;
		
		/*
		The text to be displayed.
		*/
		public function get text(): String
		{
			return _text;
		}
		
		/*
		Sets or changes the text to draw.
		@param text			The text to draw.
		@param x			Horizontal offset to draw the text on the image. Default 0.
		@param y			Vertical offset to draw the text on the image. Default 0.
		*/
		public function setText(text: String, x: Number=0, y: Number=0): void
		{
			// First clear buffer: completely transparent black
			_source.fillRect(_source.rect, 0x00000000);
			
			// Set the internal variable
			_text = text;
			
			// And let's draw!
			var cx: Number = x;
			var pnt: Point = new Point(cx, y);
			var ch: uint = 0;
			
			for (var i:uint = 0; i < _text.length; i++)
			{
				ch = _text.charCodeAt(i);
				pnt.x = cx;
				// Copy the character (maintaining alpha values)
				source.copyPixels(_bmpfont.bitmap, _bmpfont.charRect(ch), pnt, null, _bmpfont.charRect(ch).topLeft, true);
				// And increase width to draw at the correct position
				cx += _bmpfont.charRect(ch).width + _bmpfont.charSeperation;
				
			}
			
			//this.x = x;
			//this.y = y;
			updateBuffer();
		}
		
		/*
		Creates a new bitmap text.
		@param bitmapfont	The bitmap font to use when drawing text on the image.
		@param text			The text to draw on the image. You can use \n for carriage return and \\ for a backslash.
		@param x			Horizontal offset to draw the text on the image. Default 0.
		@param y			Vertical offset to draw the text on the image. Default 0.
		@param width		Width of the new image. Leave to 0 to automatically calculate width based on the text.
		@param height		Height of the new image. Leave to 0 to automatically calculate width based on the text.
		*/
		public function BmpText(bitmapfont: BmpFont, text:String, x: Number = 0, y: Number = 0, width: uint = 0, height: uint = 0)
		{
			// First set the private variables
			_bmpfont = bitmapfont;
			
			var w: uint=0, h: uint =0;
			
			// Currently all bitmaps have the same height unless otherwise specified
			// In future, the code here will change a lot to support newline and escape characters,
			// in which case the resulting height of an image also increases
			if (height == 0) h = _bmpfont.charHeight else h = height;
			
			if (width == 0)
			{
				// Check for the width of the image
				if (_bmpfont.proportional)
				{
					// Proportional: add all char widths plus seperators
				
					for (var i: uint = 0; i < text.length; i++)
						w += _bmpfont.charRect(text.charCodeAt(i)).width;
				}
				else
				{
					// Fixed width - faster calculation
					w = text.length * _bmpfont.charWidth;
				}
			// Add seperator space
			w += _bmpfont.charSeperation * (text.length - 1);
			}
			else w = width;
						
			// Create the image
			_source = new BitmapData(w, h, true, 0);
			super(_source);
			
			// Draw the text on the image
			setText(text, x, y);
		}
	}
}