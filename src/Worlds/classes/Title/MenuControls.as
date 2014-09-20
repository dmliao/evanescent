package Worlds.classes.Title
{
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

	public class MenuControls extends Entity
	{
		public var image:Image = new Image(Assets.HUD_CONTROLS_MENU);
		public var active2:Boolean = false;
		
		public var shootButtonText:Text;
		public var specialButtonText:Text;
		public var shiftButtonText:Text;
		
		public var activate:Boolean = false;
		public function MenuControls()
		{
			
			super(0,554, image);
			image.alpha = 0;
			layer = 5;
			shootButtonText = new Text("");
			specialButtonText = new Text("");
			shiftButtonText = new Text("");
		}
		public function init():void
		{
			shootButtonText = new Text(Key.name(Input.keys("shoot")[0]),0,0);
			shootButtonText.color=0x000000;
			shootButtonText.size=12;
			shootButtonText.font = "mainFont";
			shootButtonText.centerOO();
			shootButtonText.alpha = 0;
			shootButtonText.align = "center";
			
			specialButtonText = new Text(Key.name(Input.keys("special")[0]),0,0);
			specialButtonText.color=0x000000;
			specialButtonText.size=12;
			specialButtonText.font = "mainFont";
			specialButtonText.centerOO();
			specialButtonText.alpha = 0;
			specialButtonText.align = "center";
			
			shiftButtonText = new Text(Key.name(Input.keys("start")[0]),0,0);
			shiftButtonText.color=0x000000;
			shiftButtonText.size=12;
			shiftButtonText.font = "mainFont";
			shiftButtonText.centerOO();
			shiftButtonText.alpha = 0;
			shiftButtonText.align = "center";
		}
		
		
		override public function update():void
		{
			super.update();
			if (activate == false)
			{
				activate = true;
				init();
			}
			if (active2 == false)
			{
				image.alpha -= 0.05;
				shootButtonText.alpha -= 0.05;
				specialButtonText.alpha -= 0.05;
				shiftButtonText.alpha -= 0.05;
			}
			else if (image.alpha < 0.4)
			{
				image.alpha += 0.05;
				shootButtonText.alpha += 0.05;
				specialButtonText.alpha += 0.05;
				shiftButtonText.alpha += 0.05;
			}
			else
			{
				image.alpha = 0.4;
			}
		}
		override public function render():void
		{
			image.render(FP.buffer, new Point(0,384), FP.camera);
			shootButtonText.render(FP.buffer, new Point(597,32+384), FP.camera);
			specialButtonText.render(FP.buffer, new Point(41,32+384), FP.camera);
			shiftButtonText.render(FP.buffer, new Point(520,32+384), FP.camera);
		}
	}
}