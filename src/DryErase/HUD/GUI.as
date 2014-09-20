package DryErase.HUD 
{
	/**
	 * ...
	 * @author 
	 */
	
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import DryErase.Hero.Listener;
	
	 
	public class GUI extends Entity
	{
		
		private var hero:Listener;
		
		private var hudImagination:Image;
		private var hudReality:Image;
		private var hpImagination:Image;
		private var hpReality:Image;
		private var weapImagination:Image;
		private var weapReality:Image;
		private var wBarImagination:Image;
		private var wBarReality:Image;
		
		private var crack:Image;
		
		private var slideY:Number;
		
		private var tempHP:Number;
		private var tempWeap:Number;
		
		//ALARM
		private var slideAlarm:Number = 0;
		
		public function GUI(Player:Listener) 
		{
			hero = Player;
			collidable = false;
			hudImagination = new Image(Assets.HUD_IMAGINATION);
			hudImagination.alpha = 1;
			hudReality = new Image(Assets.HUD_REALITY);
			hudReality.alpha = 0;
			hpImagination = new Image(Assets.HP_IMAGINATION);
			hpImagination.alpha = 1;
			hpImagination.smooth = true;
			hpReality = new Image(Assets.HP_REALITY);
			hpReality.smooth = true;
			hpReality.alpha = 0;
			weapImagination = new Image(Assets.WEAPON_IMAGINATION);
			weapImagination.alpha = 1;
			weapReality = new Image(Assets.WEAPON_REALITY);
			weapReality.alpha = 0;
			wBarImagination = new Image(Assets.WBAR_IMAGINATION);
			wBarImagination.alpha = 1;
			wBarImagination.smooth = true;
			wBarReality = new Image(Assets.WBAR_REALITY);
			wBarReality.alpha = 0;
			wBarReality.smooth = true;
			
			crack = new Image(Assets.crack);
			crack.alpha = 0;
			
			layer = -99999999;
			
			tempHP = Listener.hitPoints;
			tempWeap = Listener.weaponBar;
			
			x = 8;
			y = -48;
			slideY = 8;
			originX = 0;
			originY = 0;
			graphic = hudImagination;
		}
		
		public function Transition():void
		{
			if (Listener.isTransitioning == false)
			{
				//return;
			}
			else
			if (Listener.currentField == false)
			{
				if (hudImagination.alpha > 0)
				{
					hudImagination.alpha -= 0.05 * Main.frameRate * FP.elapsed;
					hpImagination.alpha -= 0.05 * Main.frameRate * FP.elapsed;
					weapImagination.alpha -= 0.05 * Main.frameRate * FP.elapsed;
					wBarImagination.alpha -= 0.05 * Main.frameRate * FP.elapsed;
				}
				if (hudReality.alpha < 1)
				{
					hudReality.alpha += 0.05 * Main.frameRate * FP.elapsed;
					hpReality.alpha += 0.05 * Main.frameRate * FP.elapsed;
					weapReality.alpha += 0.05 * Main.frameRate * FP.elapsed;
					wBarReality.alpha += 0.05 * Main.frameRate * FP.elapsed;
				}
				slideY = 8;
			slideAlarm = 0;
			}
			else
			{
				if (hudImagination.alpha < 1)
				{
					hudImagination.alpha += 0.05 * Main.frameRate * FP.elapsed;
					hpImagination.alpha += 0.05 * Main.frameRate * FP.elapsed;
					weapImagination.alpha += 0.05 * Main.frameRate * FP.elapsed;
					wBarImagination.alpha += 0.05 * Main.frameRate * FP.elapsed;
				}
				if (hudReality.alpha > 0)
				{
					hudReality.alpha -= 0.05 * Main.frameRate * FP.elapsed;
					hpReality.alpha -= 0.05 * Main.frameRate * FP.elapsed;
					weapReality.alpha -= 0.05 * Main.frameRate * FP.elapsed;
					wBarReality.alpha -= 0.05 * Main.frameRate * FP.elapsed;
				}
				slideY = 8;
			slideAlarm = 0;
			}
		}
		
		override public function update():void
		{
			crack.alpha -= 0.025;
		//	slideAlarm += FP.elapsed;
			if (slideAlarm > 2)
			{
				slideY = -64;
			}
			if (Listener.hitPoints != tempHP || Listener.weaponBar != tempWeap)
			{
				if (Listener.hitPoints != tempHP)
				{
					crack.alpha = 1;
				}
				slideAlarm = 0;
				tempHP = Listener.hitPoints;
				tempWeap = Listener.weaponBar;
				slideY = 8;
			}
			
			Transition();
			
			if (y > slideY + 4)
			{
				y -= 4 * Main.frameRate * FP.elapsed;
			}
			else if (y < slideY - 4)
			{
				y += 4 * Main.frameRate * FP.elapsed;
			}
			else
			{
				y = slideY;
			}
			
			if (Listener.isTransitioning == false)
			{
				if (Listener.currentField == false)
				{
					hudReality.alpha = 0;
					hudImagination.alpha = 1;
					hpReality.alpha = 0;
					hpImagination.alpha = 1;
					weapReality.alpha = 0;
					weapImagination.alpha = 1;
					wBarReality.alpha = 0;
					wBarImagination.alpha = 1;
				}
				else
				{
					hudReality.alpha = 1;
					hudImagination.alpha = 0;
					hpReality.alpha = 1;
					hpImagination.alpha = 0;
					weapReality.alpha = 1;
					weapImagination.alpha = 0;
					wBarReality.alpha = 1;
					wBarImagination.alpha = 0;
				}
			}
			hpReality.scaleX = Listener.hitPoints / 6.5;
			hpImagination.scaleX = Listener.hitPoints / 6.5;
			
			wBarReality.scaleX = Listener.weaponBar / 100;
			wBarImagination.scaleX = Listener.weaponBar / 100;
		}
		
		override public function render():void
		{
			super.render();
			hudReality.render(FP.buffer, new Point(x, y), FP.camera);
			hpImagination.render(FP.buffer, new Point(x + 40, y+4), FP.camera);
			hpReality.render(FP.buffer, new Point(x + 40, y + 4), FP.camera);
			weapImagination.render(FP.buffer, new Point(FP.screen.width - 216, y), FP.camera);
			weapReality.render(FP.buffer, new Point(FP.screen.width - 216, y), FP.camera);
			
			wBarImagination.render(FP.buffer, new Point(FP.screen.width - 208 + wBarImagination.width - (wBarImagination.scaleX * wBarImagination.width), y + 4), FP.camera);
			wBarReality.render(FP.buffer, new Point(FP.screen.width - 208 + wBarReality.width - (wBarReality.scaleX * wBarReality.width), y + 4), FP.camera);
			
			crack.render(FP.buffer, new Point(0, 0), FP.camera);
		}
		
	}

}