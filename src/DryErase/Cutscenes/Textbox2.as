package DryErase.Cutscenes
{
	import flash.filters.GlowFilter;
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class Textbox2 extends SceneEntity
	{
		private var _txt:Text;
		private var _buffer:String;
		protected var index:int;
		protected var timer:Number;
		protected const SPEED:Number = .01;
		protected const WIDTH:Number = 480;
		protected const HEIGHT:Number = 120;
		
		public var portraitImage:Image;
		
		public var deleteTextbox:Boolean = false;
		
		private var portraitOrientation:Boolean;
		private var bufferSpace:Number = 0;
		
		private var arrow:Image;
		private var arrowText:Text;
		
		public var waverX:Number = 0;
		public var waverRight:Boolean = true;
		
		public var showArrow:Boolean = false;
		
		public var outline:GlowFilter = new GlowFilter(0xFFFFFF, 1);
		
		private var _txt2:Text;
		
		public function Textbox2(xx:Number, yy: Number, text:String, portrait:Image, portraitRight:Boolean = false)
		{
			arrow = new Image(Assets.CONTINUE);
			arrow.centerOO();
			arrowText = new Text(Key.name(Input.keys("start")[0]));
			arrowText.size = 12;
			arrowText.align="center";
			arrowText.color=0x000000;
			arrowText.font="mainFont";
			arrowText.centerOO();
			portraitOrientation = portraitRight;
			super(xx,yy,portrait);
			portraitImage= portrait;
			portraitImage.centerOO();
			portraitImage.alpha = 0;
			layer = -9999999999;
			if (portraitRight)
			{
				x=xx;
			}
			else
			{
				x = xx+portraitImage.width;
			}
			y=yy;
			_txt = new Text("");
			_txt.font = "mainFont";
			_txt.width = WIDTH;
			_txt.height = HEIGHT;
			_txt.wordWrap = true;
			_txt.align = "left";
			_txt.size = 14;
			_txt.color = 0xFFFFFF;
			
			_txt.outlineStrength = 4;
			_txt.outlineColor = 0xFFFFFF;
			_txt.updateTextBuffer();
			
			
			_txt2 = new Text("");
			_txt2.font = "mainFont";
			_txt2.width = WIDTH;
			_txt2.height = HEIGHT;
			_txt2.wordWrap = true;
			_txt2.align = "left";
			_txt2.size = 14;
			_txt2.color = 0x000000;
			
			graphic = _txt;
			txt = text;
		}
		override public function update():void
		{
			super.update();
			if (waverRight)
			{
				if (waverX < 4)
				{
					waverX += 0.2;
				}
				else
				{
					waverRight = false;
				}
			}
			else
			{
				if (waverX > -4)
				{
					waverX -= 0.2;
				}
				else
				{
					waverRight = true;
				}
			}
			if (deleteTextbox == false)
			{
				if (_txt.text == _buffer)
				{
					bufferSpace += FP.elapsed;
					if (bufferSpace > 1)
					{
						showArrow = true;
					}
				}
				portraitImage.alpha += 0.1;
				if (Input.released("confirm")) 
				{
					if (_txt.text != _buffer)
					{
						_txt.text = _buffer;
					}
					else if (bufferSpace > 1)
					{
						if (deleted == false)
						{
							SoundManager.playSound(SoundManager.SFX_CONFIRM);
						}
						deleteTextbox = true;
						showArrow = false;
						
					}
				}
				if (_txt.text.length < _buffer.length) 
				{
					timer += FP.elapsed
					if (timer >= SPEED) 
					{
						SoundManager.playSound(SoundManager.SFX_TEXTBOX);
						timer -= SPEED;
						_txt.text += _buffer.charAt(index)
						index++;
						//	_txt.text += _buffer.charAt(index)
						//	index++;
						//			_txt.text += _buffer.charAt(index)
						//			index++;
					}
				}
			}
			else
			{
				deleteOut();
				portraitImage.alpha-=0.05;
				_txt.alpha -= 0.05;
				_txt2.alpha -= 0.05;
				if (portraitImage.alpha <= 0)
				{
					FP.world.remove(this);
				}
			}
			_txt2.text = _txt.text;
			
		}
		/**
		 * The text displayed in the description panel. 
		 */
		public function set txt(arg:String):void
		{
			while (arg.search("/n") != -1)
			{
				arg = arg.replace("/n",String.fromCharCode(10))				
			}
			while (arg.search("/t") != -1)
			{
				arg = arg.replace("/t"," "+String.fromCharCode(9))				
			}
			_txt.text = "";
			_buffer = arg;
			timer = 0;
			index = 0;
		}
		
		override public function render():void
		{
			super.render();
			
			if (portraitOrientation == false)
			{
				portraitImage.render(FP.buffer,new Point(x-portraitImage.width / 2,y +50),FP.camera);
			}
			else
			{
				portraitImage.render(FP.buffer,new Point(x+_txt.width+portraitImage.width / 2,y +50),FP.camera);
			}
			if (showArrow)
			{
				arrow.render(FP.buffer,new Point(600+waverX,440),FP.camera); 
				arrowText.render(FP.buffer,new Point(600+waverX,420),FP.camera); 
			}
			_txt2.render(FP.buffer, new Point(x,y), FP.camera);
		}
		
		override public function removed():void
		{
			//	deleted = true;
			super.removed();
		}
	}
}