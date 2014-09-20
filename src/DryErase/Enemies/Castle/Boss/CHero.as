package DryErase.Enemies.Castle.Boss
{
	import DryErase.Enemies.Boss;
	import DryErase.Enemies.Bullets.TimedBullet;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	
	public class CHero extends Boss
	{
		public static var totalHealth:Number = 500;
		public static var hp:Number = 500;
		
		public var hand:CHero_Hand = new CHero_Hand();
		
		public static var introFlag:Boolean = false;
		
		public var imagSprite:Spritemap = new Spritemap(Assets.C_HERO_IMAG, 500, 595);
		public var realSprite:Spritemap = new Spritemap(Assets.C_HERO_REAL, 500,595);
		public var shadowSprite:Spritemap = new Spritemap(Assets.C_HERO_IMAG, 500,595);
		public function CHero()
		{
			super(imagSprite, realSprite, shadowSprite, 250, 2000, 270, 200,150,100,75,1.5);
			direction = 270;
			fixDirection = true;
			currentImage.angle = 0;
			
			x = 320;
			y = -400;
			
			introFlag = false;
		}
		override public function introState():void
		{
			invincible = 0.8;
			if (y < 96)
			{
				y += 4;
			}
			else if (introFlag == true)
			{
				currentState = "idle";
				FP.world.add(hand);
			}
		}
		override public function idleState():void
		{
			super.idleState();
			if (idleTimer > 2)
			{
				idleTimer = 0;
				shoot(new TimedBullet(new Image(Assets.BULLET_GREY_IMAG), 300, 5, 1, 0, false, 0, 1, true), x, y, new Image(Assets.BULLET_GREY_IMAG));
				shoot(new TimedBullet(new Image(Assets.BULLET_GREY_IMAG), 240, 5, 1, 0, false, 0, 1, true), x, y, new Image(Assets.BULLET_GREY_IMAG));
				
				shoot(new TimedBullet(new Image(Assets.BULLET_GREY_REAL), 330, 5, 1, 0, true, 0, 1, true), x, y, new Image(Assets.BULLET_GREY_REAL));
				shoot(new TimedBullet(new Image(Assets.BULLET_GREY_REAL), 210, 5, 1, 0, true, 0, 1, true), x, y, new Image(Assets.BULLET_GREY_REAL));
			}
		}
		override public function update():void
		{
			if (hitPoints > 0)
			{
			super.update();
			hp = hitPoints;
			if (totalHealth <= 0)
			{
				hitPoints = 0;
			}
			currentImage.angle = 0;
			}
			else
			{
				FP.world.remove(this);
				totalHealth = 0;
				FP.world.add(new CHero_ShieldForm());
				//FP.world.remove(hand);
				
			}
		}
	}
}