package net.flashpunk.graphics 
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import net.flashpunk.FP;

	public class BmpFont
	{
		private var _bitmap:BitmapData;
		private var _charrect: Vector.<Rectangle> = new Vector.<Rectangle>(256,true);
		private var _asciicodefirst: uint;
		private var _charnum: uint;
		private var _charwidthempty: uint;
		private var _proportional: Boolean;
		private var _charwidth: uint;
		private var _charheight: uint;
		private var _charseperation: uint;
		
		/*
		 Returns the base character width in the source image.
		*/
		public function get charWidth(): uint
		{
			return _charwidth;
		}
		
		/*
		 Returns the defined character seperation in pixels.
		*/
		public function get charSeperation(): int
		{
			return _charseperation;
		}
		
		/*
		 Returns the base character height in the source image.
		*/
		public function get charHeight(): uint
		{
			return _charheight;
		}
		
		/*
		 Returns the BitmapData object containing all characters in the bitmap font.
		 */
		public function get bitmap(): BitmapData
		{
			return _bitmap;
		}
		
		/*
		 Returns the first ASCII character for which a bitmap image is available.
		 */
		public function get asciiCodeFirst(): uint
		{
			return _asciicodefirst;
		}
		
		/*
		 Returns the total number of characters defined in the bitmap.
		 */
		public function get charNum(): uint
		{
			return _charnum;
		}
		
		/**
		 Returns the bounding box rectangle for the ASCII character code in the font's bitmap image.
		@param asciicode	The ASCII code of the character to get the rectangle of.
		 */
		public function charRect(asciicode: uint): Rectangle
		{
			return _charrect[asciicode];
		}
				
		/*
		 Returns the defined width for characters in the bitmap that have no pixels.
		 */
		public function get charWidthEmpty(): uint
		{
			return _charwidthempty;
		}
		
		/*
		 Returns if the font is proportional.
		*/
		 public function get proportional(): Boolean
		 {
			 return _proportional;
		 }
		/*
		 Creates a new bitmap font resource.
		 @param source	The source image.
		 @param charwidth	The character width in the source image.
		 @param charheight	The character height in the source image.
		 @param asciicodefirst	The ASCII code of the first (top-left) character in the source image.
		 @param proportional	Whether the bitmap is proportional (true) or fixed-width (false).
		 @param charseperation	Seperation between characters in pixels. Default 0 pixels.
		 @param charwidthempty	For proportional fonts, the width in pixels of characters without visible pixels (such as space). By default set to the charwidth parameter.
		 */
		
		public function BmpFont(source:*, charwidth:uint, charheight:uint, asciicodefirst:uint, proportional: Boolean, charseperation: int = 0, charwidthempty:int = -1) // Constructor
		{
			// Get the bitmap
			if (source is Class) _bitmap = FP.getBitmap(source)
			else if (source is BitmapData) _bitmap = source;
			if (!_bitmap) throw new Error("Invalid source image.");
			
			// Get characterset parameters
			_charnum = (bitmap.height / charheight) * (bitmap.width / charwidth);
			if (charwidthempty == -1) _charwidthempty = charwidth else _charwidthempty = charwidthempty;
			_asciicodefirst= asciicodefirst;
			_proportional = proportional;
			_charwidth = charwidth;
			_charheight = charheight;
			_charseperation = charseperation;
			
			// Clear all (in case someone uses a character that is not in the bitmap)
			for (var i: uint = 0 ; i < 256; i++)
			{
				_charrect[i] = new Rectangle;
				_charrect[i].left = 0;
				_charrect[i].top = 0;
				_charrect[i].width = 1;
				_charrect[i].height = charheight; // Height is the same for all characters
			}
			
			// Now cycle through the bitmap and store the character dimensions
			var n: uint = _asciicodefirst;
			var testbmp: BitmapData = new BitmapData(charwidth, charheight, true);
			var bmprect: Rectangle = new Rectangle;

			for (var y: uint = 0; y < bitmap.height; y += charheight)
			{
				for (var x: uint = 0; x < bitmap.width; x += charwidth)
				{
					if (_proportional)
					{
						// Proportional font: measure the left and right to get the correct character dimensions
						// First set the rectangle to copy
						bmprect.left = x;
						bmprect.top = y;
						bmprect.width = charwidth;
						bmprect.height = charheight;
						
						// Clear the test image
						testbmp.fillRect(testbmp.rect, 0x00000000);
						// Copy the relevant rectangle
						
						// Copy char from bitmap
						testbmp.copyPixels(bitmap, bmprect, testbmp.rect.topLeft, null, bmprect.topLeft);
						
						// Get the bounding box!
						_charrect[n] = testbmp.getColorBoundsRect( 0xFF000000,0xFF000000, true);
						_charrect[n].x += x;
						_charrect[n].y += y;
						if (_charrect[n].width == 0) _charrect[n].width = _charwidthempty;	// If empty, get default width
					}
					else
					{
						// Fixed width font: all chars have the same width
						_charrect[n].left = x;
						_charrect[n].width = _charwidth;
					}
					// Top position is not influenced
					_charrect[n].top = y;
					// Height should remain charheight (same for all characters)
					_charrect[n].height = _charheight;
					// Go to next ASCII code
					n++;
				}
			}
		}
	}

}