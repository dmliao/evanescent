package DryErase.HUD
{
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

	public class ControlsGUI extends Entity
	{
		public var slideY:Number = 240;
		public var isOnScreen:Boolean = true;
		
		public var guiImage:Image = new Image(Assets.HUD_CONTROLS);
		
		public var leftButtonText:Text;
		public var rightButtonText:Text;
		public var upButtonText:Text;
		public var downButtonText:Text;
		public var shootButtonText:Text;
		public var specialButtonText:Text;
		public var shiftButtonText:Text;
		public var pauseButtonText:Text;
		public var activate:Boolean = false;
		public function ControlsGUI()
		{
			shootButtonText = new Text("");
			specialButtonText = new Text("");
			shiftButtonText = new Text("");
			
			leftButtonText = new Text("");
			rightButtonText = new Text("");
			upButtonText = new Text("");
			downButtonText = new Text("");
			pauseButtonText = new Text("");
			super(0,240,guiImage);
			layer = -999999999;
			
			guiImage.alpha = 0.6;
		}
		public function init():void
		{
			leftButtonText = new Text(Key.name(Input.keys("left")[0]),0,0);
			leftButtonText.color=0x000000;
			leftButtonText.size=12;
			leftButtonText.font = "mainFont";
			leftButtonText.centerOO();
			leftButtonText.alpha = 0.3;
			leftButtonText.align = "center";
			
			rightButtonText = new Text(Key.name(Input.keys("right")[0]),0,0);
			rightButtonText.color=0x000000;
			rightButtonText.size=12;
			rightButtonText.font = "mainFont";
			rightButtonText.centerOO();
			rightButtonText.alpha = 0.3;
			rightButtonText.align = "center";
			
			upButtonText = new Text(Key.name(Input.keys("up")[0]),0,0);
			upButtonText.color=0x000000;
			upButtonText.size=12;
			upButtonText.font = "mainFont";
			upButtonText.centerOO();
			upButtonText.alpha = 0.3;
			upButtonText.align = "center";
			
			downButtonText = new Text(Key.name(Input.keys("down")[0]),0,0);
			downButtonText.color=0x000000;
			downButtonText.size=12;
			downButtonText.font = "mainFont";
			downButtonText.centerOO();
			downButtonText.alpha = 0.3;
			downButtonText.align = "center";
			
			shootButtonText = new Text(Key.name(Input.keys("shoot")[0]),0,0);
			shootButtonText.color=0x000000;
			shootButtonText.size=12;
			shootButtonText.font = "mainFont";
			shootButtonText.centerOO();
			shootButtonText.alpha = 0.3;
			shootButtonText.align = "center";
			
			specialButtonText = new Text(Key.name(Input.keys("special")[0]),0,0);
			specialButtonText.color=0x000000;
			specialButtonText.size=12;
			specialButtonText.font = "mainFont";
			specialButtonText.centerOO();
			specialButtonText.alpha = 0.3;
			specialButtonText.align = "center";
			
			shiftButtonText = new Text(Key.name(Input.keys("start")[0]),0,0);
			shiftButtonText.color=0x000000;
			shiftButtonText.size=12;
			shiftButtonText.font = "mainFont";
			shiftButtonText.centerOO();
			shiftButtonText.alpha = 0.3;
			shiftButtonText.align = "center";
			
			pauseButtonText = new Text("Pause: " + Key.name(Input.keys("pause")[0]),0,0);
			pauseButtonText.color=0x000000;
			pauseButtonText.size=12;
			pauseButtonText.font = "mainFont";
			pauseButtonText.centerOO();
			pauseButtonText.alpha = 0.3;
			pauseButtonText.align = "center";
		}
		override public function update():void
		{
			if (activate == false)
			{
				init();
				activate = true;
			}
			if (isOnScreen == true)
			{
				if (slideY > 6)
				{
					slideY -= 6;
				}
				else
				{
					slideY = 0;	
				}
			}
			if (isOnScreen == false)
			{
				if (slideY < 240)
				{
					slideY += 12;
				}
				else
				{
					slideY = 248;
				}
			}
		}
		
		override public function render():void
		{
			graphic.render(FP.buffer, new Point(x,y+slideY),FP.camera);
			
			leftButtonText.render(FP.buffer, new Point(416, 356 + slideY), FP.camera);
			rightButtonText.render(FP.buffer, new Point(610, 356 + slideY), FP.camera);
			upButtonText.render(FP.buffer, new Point(512, 272 + slideY), FP.camera);
			downButtonText.render(FP.buffer, new Point(512, 432 + slideY), FP.camera);
			shootButtonText.render(FP.buffer, new Point(70, 190 + 240 + slideY), FP.camera);
			specialButtonText.render(FP.buffer, new Point(162, 190 + 240 + slideY), FP.camera);
			shiftButtonText.render(FP.buffer, new Point(308, 184 + 240 + slideY), FP.camera);
			pauseButtonText.render(FP.buffer, new Point(596, 28 + 240 + slideY), FP.camera);
			setHitbox(leftButtonText.x,leftButtonText.y-y,0,0);
		}
	}
}