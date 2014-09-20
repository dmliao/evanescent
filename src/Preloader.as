package
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	import flash.utils.getDefinitionByName;
	
	[SWF(width = "640", height = "480")]
	public class Preloader extends Sprite
	{
		// Change these values
		private static const mustClick: Boolean = true;
		private static const mainClassName: String = "Main";
		
		private static const BG_COLOR:uint = 0xFFFFFF;
		private static const FG_COLOR:uint = 0x000000;
		
		[Embed(source = 'assets/font/Gondola_SD.ttf', 
			embedAsCFF="false", fontFamily = 'default')]
		private static const FONT:Class;
		[Embed(source = 'assets/world/credits/1.png')]
		private const PICTURE:Class;
		
		private var image:Bitmap = new PICTURE;
		// Ignore everything else
		
		
		
		private var progressBar: Shape;
		private var text: TextField;
		
		private var px:int;
		private var py:int;
		private var w:int;
		private var h:int;
		private var sw:int;
		private var sh:int;
		
		public function Preloader ()
		{
			sw = stage.stageWidth;
			sh = stage.stageHeight;
			
			w = 320;
			h = 4;
			
			px = (sw - w) * 0.5;
			py = (sh - h) * 0.75;
			
			graphics.beginFill(BG_COLOR);
			
			graphics.drawRect(0, 0, sw, sh);
			graphics.endFill();
			
			graphics.beginFill(FG_COLOR);
			graphics.drawRect(px - 2, py - 2, w + 4, h + 4);
			graphics.endFill();
			
			addChild(image);
			
			progressBar = new Shape();
			
			addChild(progressBar);
			
			text = new TextField();
			
			text.textColor = FG_COLOR;
			text.selectable = false;
			text.mouseEnabled = false;
			text.defaultTextFormat = new TextFormat("default", 10);
			text.embedFonts = true;
			text.autoSize = "left";
			text.text = "0%";
			text.x = (sw - text.width) * 0.5;
			text.y = sh * 0.75 + h;
			
			addChild(text);
			
			stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			if (mustClick) {
				stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			}
		}
		
		public function onEnterFrame (e:Event): void
		{
			if (hasLoaded())
			{
				graphics.clear();
				graphics.beginFill(BG_COLOR);
				graphics.drawRect(0, 0, sw, sh);
				graphics.endFill();
				
				if (! mustClick) {
					startup();
				} else {
					text.scaleX = 1.4;
					text.scaleY = 1.4;
					
					text.text = "Click to start";
					
					text.y = (sh - text.height) * 0.75;
				}
			} else {
				var p:Number = (loaderInfo.bytesLoaded / loaderInfo.bytesTotal);
				
				progressBar.graphics.clear();
				progressBar.graphics.beginFill(BG_COLOR);
				progressBar.graphics.drawRect(px, py, p * w, h);
				progressBar.graphics.endFill();
				
				text.text = int(p * 100) + "%";
			}
			
			text.x = (sw - text.width) * 0.5;
		}
		
		private function onMouseDown(e:MouseEvent):void {
			if (hasLoaded())
			{
				stage.removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
				startup();
			}
		}
		
		private function hasLoaded (): Boolean {
			return (loaderInfo.bytesLoaded >= loaderInfo.bytesTotal);
		}
		
		private function startup (): void {
			stage.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			var mainClass:Class = getDefinitionByName(mainClassName) as Class;
			parent.addChild(new mainClass as DisplayObject);
			
			parent.removeChild(this);
		}
	}
}