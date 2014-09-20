package DryErase.Hero.Title 
{
	/**
	 * ...
	 * @author 
	 */
	
	import DryErase.Effects.*;
	import DryErase.Effects.Laser;
	
	import Worlds.classes.Backgrounds.Transition;
	import Worlds.classes.Title.TitleMenu;
	
	import com.debug.Debug;
	
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	 
	public class ListenerTitle extends Entity
	{
		//INITIALIZE IMAGES
		private var currentImage:Image;
		private var RImage:Image;
		private var LImage:Image;
		
		//INITIALIZE VARIABLES
		private var basicShoot:Boolean;
		private var flyIn:Boolean;
		private var hoverPixel:Number;
		private var hoverDir:Number;
		
		private var scaleFactor:Number;
		
		//INITIALIZE ALARMS
		public var bulletTimer:Number = 0;
		public var startTimer:Number = 0;
		public var inkjetTimer:Number = 0;
		
		
		//INITIALIZE BULLETS
		private var newBullet:Entity;
		
	
		private var laser:Laser;
		

		
		
		
		public var targetAlpha:Number = 0.5;
		public var fadeSpeed:Number = 0.05;
		
		public function ListenerTitle() 
		{
			type = "hero";
			currentImage = new Image(Assets.PLAYER);	
			currentImage.centerOO();
			currentImage.smooth = true;
			
			RImage = new Image(Assets.PLAYER_RIGHT);	
			RImage.centerOO();
			RImage.smooth = true;
			
			LImage = new Image(Assets.PLAYER_LEFT);	
			LImage.centerOO();
			LImage.smooth = true;
			
			
			setHitbox(32, 64, 16, 32);
			
			scaleFactor = (1 - (( -(y - FP.camera.y) + 600) / 5000)) * 3 / 5;
			
			basicShoot = true;
			
			
			laser = new Laser();
			laser.x = x;
			laser.y = y - 248;
			
			x = 320;
			y = 300;
			
			graphic = currentImage;
			currentImage.alpha = 0;
			RImage.alpha = 0;
			LImage.alpha = 0;
			
			layer = 499;
		}
		
	
		override public function update():void 
		{
			startTimer += FP.elapsed;
			if (startTimer > 2)
			{
				if (currentImage.alpha > targetAlpha + fadeSpeed)
				{
					currentImage.alpha -= fadeSpeed;
				}
				else if (currentImage.alpha < targetAlpha - fadeSpeed)
				{
					currentImage.alpha += fadeSpeed;
				}
			}
			if (TitleMenu.currentMenu == 0)
			{
				targetAlpha = 0.5;
			}
			else
			{
				targetAlpha = 0;
			}
			RImage.alpha = currentImage.alpha;
			LImage.alpha = currentImage.alpha;
			
			
			scaleFactor = (1 - (( -(y - FP.camera.y) + 600) / 1500)) * 3 / 5;
			
			
				currentImage.scale = scaleFactor;
				RImage.scale = scaleFactor;
				LImage.scale = scaleFactor;
			
			
			if (x <= 72) x = 72;
			if (y <= 48) y = 48;
			if (x >= FP.stage.width-72) x = FP.stage.width-72;
			if (y >= FP.stage.height-48) y = FP.stage.height-48;
			
			if (targetAlpha != 0)
			{
				stepEvent();
			}
			Debug.log(type);
			
		}
		
		public function stepEvent():void
		{
			//Step Event
			laser.x = x-2;
			laser.y = y - 248;
			
			if (Input.check("left"))
			{
				x -= 8;
			}
			
			if (Input.check("right"))
			{	
				x += 8;
			}
			
			if (Input.check("up"))
			{
				y -= 6;
			}
			
			if (Input.check("down"))
			{
				y += 6;
			}
			if (Input.check("shoot") && laser.visible == false)
			{
				if (basicShoot == true)
				{
					
						newBullet = FP.world.create(TitleBulletI, true);
					
					newBullet.x = x;
					newBullet.y = y - 4;
					basicShoot = false;
					
					bulletTimer = 0;
				}
			}
			if (Input.check("special"))
			{
				laser.visible = true;
			}
			else
			{
				laser.visible = false;
			}
			if (Input.pressed("special"))
			{
				
				FP.world.add(laser);
				
				
			}
	
			
			if (Input.check("left") && !Input.check("right"))
			{
				graphic = LImage;
			}
			else if (Input.check("right") && !Input.check("left"))
			{	
				graphic = RImage;
			}
			else
			{
				graphic = currentImage;
			}
			
			//ALARMS
			bulletTimer += FP.elapsed;
			inkjetTimer += FP.elapsed;
			
		
			//ALARM EVENTS
			if (bulletTimer > 0.1)
			{
				basicShoot = true;
			}
			
			
			
		}
		
		
	}

}