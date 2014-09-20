package Worlds.classes.Title
{
	import DryErase.Cutscenes.FadeText;
	
	import com.debug.Debug;
	
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

	public class ControlsEditing extends Entity
	{
		//0 is navigating around the controls
		//1 is choosing which key to replace
		//2 is choosing the key to replace the control with
		public var phase:Number = 0;
		
		public var currentEditing:String = "";
		public var currentKey:int;
		
		public var leftButtonText:Text = new Text("");
		public var rightButtonText:Text = new Text("");
		public var upButtonText:Text = new Text("");
		public var downButtonText:Text = new Text("");
		public var shootButtonText:Text = new Text("");
		public var specialButtonText:Text = new Text("");
		public var shiftButtonText:Text = new Text("");
		public var pauseButtonText:Text = new Text("");
		
		private var pulse:Number = 1;
		private var pulseBool:Boolean = false;
		
		public var activate:Boolean = false;
		
		private var pressedOnce:Boolean = false;
		private var doublePressed:Boolean = false;
		public var guiImage:Image = new Image(Assets.HUD_CONTROLS);
		
		public static var transImage:Image = new Image(Assets.TITLE_BACK);
		
		public var transOut:Boolean = false;
		
		private var textControls:FadeText;
		private var controlsAdded:Boolean = false;
		
		public function ControlsEditing()
		{
			super(0, 0, guiImage);
			
			
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
			
			textControls = new FadeText("Press a key, and then press " + Key.name(Input.keys("skipCutscene")[0]) + " to edit controls. /nPress " + Key.name(Input.keys("special")[0]) + " twice to return to the title screen.",false,320,320);
			textControls.WIDTH = 640;
			textControls.settxt("Press a key, and then press " + Key.name(Input.keys("skipCutscene")[0]) + " to edit controls. /nPress " + Key.name(Input.keys("special")[0]) + " twice to return to the title screen.");
			if (!controlsAdded)
			{
				FP.world.add(textControls);
				controlsAdded = true;
			}
			
		}
		public function revertAlpha():void
		{
			leftButtonText.alpha = 0.3;
			rightButtonText.alpha = 0.3;
			upButtonText.alpha = 0.3;
			downButtonText.alpha = 0.3;
			shootButtonText.alpha =0.3;
			specialButtonText.alpha = 0.3;
			shiftButtonText.alpha = 0.3;
			pauseButtonText.alpha = 0.3;
		}
		public function revertText():void
		{
			textControls.settxt("Press a key, and then press " + Key.name(Input.keys("skipCutscene")[0]) + " to edit controls. /nPress " + Key.name(Input.keys("special")[0]) + " twice to return to the title screen.");
			leftButtonText.align = "center";
			rightButtonText.align = "center";
			upButtonText.align = "center";
			downButtonText.align = "center";
			leftButtonText.text=Key.name(Input.keys("left")[0]);
			rightButtonText.text=Key.name(Input.keys("right")[0]);
			upButtonText.text=Key.name(Input.keys("up")[0]);
			downButtonText.text=Key.name(Input.keys("down")[0]);
			pauseButtonText.text=Key.name(Input.keys("pause")[0]);
			init();
			textControls.settxt("Press a key, and then press " + Key.name(Input.keys("skipCutscene")[0]) + " to edit controls. /nPress " + Key.name(Input.keys("special")[0]) + " twice to return to the title screen.");
		}
		public function pulseText(text:Text):void
		{
			if (text.alpha >= 1)
			{
				pulseBool = false;
			}
			else if (text.alpha <= 0.5)
			{
				pulseBool = true;
			}
			
			if (pulseBool == true)
			{
				text.alpha += 0.02;
				
			}
			else
			{
				text.alpha -= 0.02;
			}
		}
		override public function update():void
		{
			if (transOut)
			{
				transImage.alpha += 0.03;
				if (transImage.alpha >= 1)
				{
					Main.savePreferences();
					FP.world = new TitleWorld;
				}
			}
			else
			{
				transImage.alpha -= 0.03;
			}
			if (activate == false)
			{
				init();
				activate = true;
			}
			if (phase == 0)
			{
				if (Input.released("left"))
				{
					currentEditing = "left";
					pressedOnce = false;
					doublePressed = false;
					
					revertAlpha();
					leftButtonText.alpha = 1;
				}
				if (Input.released("right"))
				{
					currentEditing = "right";
					pressedOnce = false;
					doublePressed = false;
					
					revertAlpha();
					rightButtonText.alpha = 1;
				}
				if (Input.released("up"))
				{
					currentEditing = "up";
					pressedOnce = false;
					doublePressed = false;
					
					revertAlpha();
					upButtonText.alpha = 1;
				}
				if (Input.released("down"))
				{
					currentEditing = "down";
					pressedOnce = false;
					doublePressed = false;
					
					revertAlpha();
					downButtonText.alpha = 1;
				}
				
				if (Input.released("shoot"))
				{
					pressedOnce = false;
					doublePressed = false;
					
					currentEditing = "shoot";
					
					
					revertAlpha();
					shootButtonText.alpha = 1;
				}
				if (Input.released("special"))
				{
					if (currentEditing == "special" && pressedOnce == false)
					{
						transOut = true;
						pressedOnce = true;
						Main.savePreferences();
					}
					else if (!currentEditing == "special")
					{
						pressedOnce = false;
					}
					currentEditing = "special";
					
					
					revertAlpha();
					specialButtonText.alpha = 1;
					textControls.settxt("Press a key, and then press " + Key.name(Input.keys("skipCutscene")[0]) + " to edit controls. /nPress " + Key.name(Input.keys("special")[0]) + " twice to return to the title screen.");
				}
				if (Input.released("start"))
				{
					pressedOnce = false;
					doublePressed = false;
					
					
					currentEditing = "start";
					
					revertAlpha();
					shiftButtonText.alpha = 1;
				}
				if (Input.released("pause"))
				{
					pressedOnce = false;
					doublePressed = false;
					
					
					currentEditing = "pause";
					
					revertAlpha();
					pauseButtonText.alpha = 1;
				}
				if (Input.released("skipCutscene"))
				{
					if (pressedOnce == false || doublePressed == true)
					{
						phase = 1;
					}
				}
			}
			if (phase == 1)
			{
				
				switch (currentEditing)
				{
					case "left":
					{
						pulseText(leftButtonText);
					}break;
					case "right":
					{
						pulseText(rightButtonText);
					}break;
					case "up":
					{
						pulseText(upButtonText);
					}break;
					case "down":
					{
						pulseText(downButtonText);
					}break;
					case "shoot":
					{
						pulseText(shootButtonText);
					}break;
					case "special":
					{
						pulseText(specialButtonText);
					}break;
					case "start":
					{
						pulseText(shiftButtonText);
					}break;
					case "pause":
					{
						pulseText(pauseButtonText);
						
					}break;
				}
				if (Input.released(Key.ANY) && !Input.released("unusable") && !Input.released("mapped"))
				{
					textControls.settxt("Press a key, and then press " + Key.name(Input.keys("skipCutscene")[0]) + " to edit controls. /nPress " + Key.name(Input.keys("special")[0]) + " twice to return to the title screen.");
					phase = 0;
					doublePressed = false;
					pressedOnce = false;
					Input.define(currentEditing,Input.lastKey);
					Input.define("confirm",Input.keys("shoot")[0],Input.keys("start")[0]);
					Input.define("mapped", Input.keys("up")[0], Input.keys("left")[0], Input.keys("right")[0], Input.keys("down")[0], Input.keys("shoot")[0], Input.keys("special")[0], Input.keys("start")[0], Input.keys("skipCutscene")[0], Input.keys("pause")[0]);
					revertText();
					textControls.settxt("Press a key, and then press " + Key.name(Input.keys("skipCutscene")[0]) + " to edit controls. /nPress " + Key.name(Input.keys("special")[0]) + " twice to return to the title screen.");
				}
				if (Input.released(currentEditing))
				{
					phase = 0;
					revertText();
				}
			}
		}
		override public function render():void
		{
			
			graphic.render(FP.buffer, new Point(x,y),FP.camera);
			leftButtonText.render(FP.buffer, new Point(416, 116), FP.camera);
			rightButtonText.render(FP.buffer, new Point(610, 116), FP.camera);
			upButtonText.render(FP.buffer, new Point(512, 32), FP.camera);
			downButtonText.render(FP.buffer, new Point(512, 192), FP.camera);
			shootButtonText.render(FP.buffer, new Point(70, 190), FP.camera);
			specialButtonText.render(FP.buffer, new Point(162, 190), FP.camera);
			shiftButtonText.render(FP.buffer, new Point(308, 184), FP.camera);
			pauseButtonText.render(FP.buffer, new Point(596 , 28), FP.camera);
			
			//textControls.render(FP.buffer, new Point(32, 248), FP.camera);
			
			transImage.render(FP.buffer,new Point(0,0), FP.camera);
		}
	}
}