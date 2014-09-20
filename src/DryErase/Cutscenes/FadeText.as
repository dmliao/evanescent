package DryErase.Cutscenes
{
	import flash.geom.Point;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

	public class FadeText extends SceneEntity
	{
		public var WIDTH:Number = 360;
		public var HEIGHT:Number = 160;
		
		public var txt:Text;
		public var txt2:Text;
		public var canDeleteTimer:Number = 0;
		
		public var waverX:Number = 0;
		public var waverRight:Boolean = true;
		
		public var showArrow:Boolean;
		
		private var arrowText:Text;
		
		public var arrow:Image;
		public function FadeText(text:String,showarrow:Boolean = true,xx:Number = 320, yy:Number = 240, autoFadeIn:Boolean = true)
		{
			showArrow=showarrow;
			txt = new Text(text);
			
			txt.font = "mainFont";
			
			arrow = new Image(Assets.CONTINUE);
			arrow.centerOO();
			arrowText = new Text(Key.name(Input.keys("start")[0]));
			arrowText.font="mainFont";
			arrowText.size = 12;
			arrowText.align="center";
			arrowText.color=0x000000;
			arrowText.centerOO();
			
			txt.wordWrap = true;
			txt.align = "center";
			
			txt.color = 0xFFFFFF;
			
			txt.outlineStrength = 4;
			txt.outlineColor = 0xFFFFFF;
			txt.updateTextBuffer();
			
			
			txt2 = new Text(text);
			txt2.font = "mainFont";
			
			txt2.wordWrap = true;
			txt2.align = "center";
			
			txt2.alpha = 0;
			txt2.color = 0x000000;
			super(xx,yy,txt);
			txt.width = WIDTH;
			txt.height = HEIGHT;
			txt.centerOO();
			
			txt2.width = WIDTH;
			txt2.height = HEIGHT;
			txt2.centerOO();
		//	graphic = txt;
			if (autoFadeIn)
			{
			this.fadeInFlag = true;
			fadeIn();
			}
			setHitbox(txt.width,txt.height,txt.width/2,txt.height/2);
			layer = -9999999999;
			settxt(text);
		}
		override public function update():void
		{
			txt.width = WIDTH;
			txt.height = HEIGHT;
			txt2.width = WIDTH;
			txt2.height = HEIGHT;
			txt.centerOO();
			txt2.centerOO();
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
			super.update();
			canDeleteTimer += FP.elapsed;
			if (canDeleteTimer > 0.8 && Input.pressed("confirm") && showArrow == true)
			{
				if (deleted == false)
				{
					SoundManager.playSound(SoundManager.SFX_CONFIRM);
				}
				deleteOut();
				
			}
			txt2.alpha = txt.alpha;
		}
		/**
		 * The text displayed in the description panel. 
		 */
		public function settxt(arg:String):void
		{
			while (arg.search("/n") != -1)
			{
				arg = arg.replace("/n",String.fromCharCode(10))				
			}
			while (arg.search("/t") != -1)
			{
				arg = arg.replace("/t"," "+String.fromCharCode(9))				
			}
			txt.text = arg;
			txt2.text = arg;
			
		}
		override public function render():void
		{
			if (visible == true)
			{
			super.render();
			
			if (canDeleteTimer > 2 && this.deleted == false && showArrow == true)
			{
				arrow.render(FP.buffer,new Point(600+waverX,440),FP.camera); 
				arrowText.render(FP.buffer,new Point(600+waverX,420),FP.camera); 
			}
			txt2.render(FP.buffer, new Point(x,y), FP.camera);
			}
		}
	}
}