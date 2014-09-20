package DryErase.Hero
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;

	public class Coin extends Entity
	{
		
		public var currentField:Boolean;
		public var scaleFactor:Number;
		
		public var imageI:Spritemap;
		public var imageR:Spritemap;
		
		public function Coin(field:Boolean = false)
		{
			
			imageI = new Spritemap(Assets.IMAGCOIN,33,33);
			imageI.centerOO();
			imageI.smooth = true;
			imageI.add("default",[0,1,2,3,4,5,6],20,true);
			imageI.play("default");
			imageR = new Spritemap(Assets.REALCOIN,33,33);
			imageR.centerOO();
			imageR.smooth = true;
			imageR.add("default",[0,1,2,3,4,5,6],20,true);
			imageR.play("default");
			
			currentField = field;
			if (currentField == false)
			{
				graphic = imageI;
			}
			else
			{
				graphic = imageR;
			}
			type="coin";
			scaleFactor = 1 - (( -(y - FP.camera.y) + 600) / 2400);
			setHitbox(64*scaleFactor,64*scaleFactor,32*scaleFactor,32*scaleFactor);
		}
		
		override public function update():void
		{
			
			if ( y > 500)
			{
				FP.world.recycle(this);
			}
			else
				y += 2;
			{
			if (currentField == false)
			{
				layer = -(y - FP.camera.y)/2;
				graphic = imageI;
				imageI.scale = scaleFactor;
			}
			else
			{
				layer = -(y - FP.camera.y) * 1.5;
				graphic = imageR;
				imageR.scale = scaleFactor;
			}
			super.update();
			if (collide("hero",x,y))
			{
				if (Listener.currentField == currentField)
				{
					if (Listener.lastCoinCollected > 0.1)
					{
					SoundManager.playSound(SoundManager.SFX_HERO_PICKUP);
				
					Listener.lastCoinCollected = 0;
					}
					Main.currentScore += 25;
					FP.world.recycle(this);
				}
			}
			if (Listener.currentField == currentField)
			{
				imageI.alpha = 1;
				imageR.alpha = 1;
			}
			else
			{
				imageI.alpha = 0.3;
				imageR.alpha = 0.3;
			}
			setHitbox(64*scaleFactor,64*scaleFactor,32*scaleFactor,32*scaleFactor);
			}
		}
	}
}