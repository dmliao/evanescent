package DryErase.Cutscenes
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class SceneEntity extends Entity
	{
		public var g:Image;
		
		public var fadeInFlag:Boolean = false;
		public var fadeOutFlag:Boolean = false;
		public var spd:Number = 0.1;
		
		public var deleted:Boolean = false;
		
		public var currentAlpha:Number = 0;
		public function SceneEntity(xx:Number, yy:Number, gfx:Image)
		{
			x=xx;
			y=yy;
			g=gfx;
			graphic = g;
			g.smooth = true;
			g.alpha = 0;
			layer = -999999999;
		}
		
		override public function update():void
		{
			
			
			super.update();
			if (g !== null)
			{
			currentAlpha = g.alpha;
			if (fadeInFlag)
			{
				g.alpha += spd;
				
			}
			if (fadeOutFlag)
			{
				g.alpha -= spd;
				
			}
			if (deleted == true && g.alpha <= 0.1)
			{
				FP.world.remove(this);
			}
			}
		}
		
		public function fadeIn(speed:Number = 0.1):void
		{
			fadeInFlag = true;
			fadeOutFlag = false;
			spd = speed;
		}
		public function fadeOut(speed:Number = 0.1):void
		{
			fadeOutFlag = true;
			fadeInFlag = false;
			spd = speed;
		}
		public function deleteOut(speed:Number = 0.1):void
		{
			fadeOutFlag = true;
			fadeInFlag = false;
			spd = speed;
			deleted = true;
		}
		override public function removed():void
		{
			super.removed();
			g = null;
		}
		
	}
}