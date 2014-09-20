package DryErase.Enemies.Flower.Enemies.boss
{
	import DryErase.Enemies.Bullets.Bullet;
	import DryErase.Enemies.Enemy;
	import DryErase.Enemies.Flower.WaveControl.Master_B;
	import DryErase.Hero.Listener;
	
	import flash.geom.Point;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;

	public class BBoss_Imag extends Enemy
	{
		public var cImage:Spritemap = new Spritemap(Assets.B_HU_IMAG,214,244);
		public var cShadow:Spritemap = new Spritemap(Assets.B_HU_IMAG,214,244);
		public var introd:Boolean = false;
		public var turn:Number = 0;
		public var turnRight:Boolean = false;
		public var activate:Boolean = false;
		
		public var phase:Number = 0;
		public var phaseTimer:Number = 0;
		
		public var shootTimer:Number = 0;
		
		public static var defeated:Boolean = false;
		
		public static var deadX:Number = 0;
		public static var deadY:Number = 0;
		public function BBoss_Imag()
		{
			cImage.add("idle",[0,1,2,3],15,true);
			
			super(cImage,cShadow, 200, 2500, false, 0, 200,200,100,100,1,false,0);
			x = -200;
			y = 240;
			
			cImage.play("idle");
			defeated = false;
		}
		override public function update():void
		{
			deadX = x;
			deadY = y;
			super.update();
			phaseTimer += FP.elapsed;
			
			shootTimer += FP.elapsed;
			if (introd == false)
			{
				if (x < 320-8 || x > 320 + 8 || y < 180 - 8 || y > 180 + 8)
				{
					direction = pointDirection(x,y,320,180);
					moveDirection(pointDirection(x,y,320,180),3);
				}
				else
				{
					introd = true;
				}
			}
			else
			{
				if (phase == 0)
				{
					if (shootTimer > 1)
					{
						shootTimer = 0;
						shootFan();
					}
					if (phaseTimer > 12)
					{
						phase = 1;
						phaseTimer = 0;
					}
				}
				else if (phase == 1)
				{
					if (phaseTimer > 2)
					{
						phase = 2;
						phaseTimer = 0;
					}
				}
				else
				{
					if (shootTimer > 0.25)
					{
						shootArc();
						shootTimer = 0;
					}
					if (phaseTimer > 6)
					{
						phase = 0;
						phaseTimer = 0;
					}
				}
			
				turn += FP.elapsed;
				if (turn > 1.5)
				{
					turn = 0;
					turnRight = Boolean(Math.round(Math.random()));
				}
				if (turnRight)
				{
					direction += 0.5;
				}
				else
				{
					direction -= 0.5;
				}
				moveDirection(direction,1.7);
				if ( y < - 50)
				{
					turnRight = true;
					turn = 0;
					direction += 2;
				}
				if (y > 220)
				{
					turnRight = false;
					turn = 0;
					direction -= 2;
				}
				if (x < - 50)
				{
					x = 690;
				}
				if (x > 690)
				{
					x = -50;
				}
			}
		}
		
		public function shootArc():void
		{
			shoot(new Bullet(new Image(Assets.BULLET_BLUE_IMAG), 24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2),5,0,false,3),x,y,new Image(Assets.BULLET_BLUE_IMAG));
			shoot(new Bullet(new Image(Assets.BULLET_BLUE_IMAG), 24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2)+45,5,0,false,3),x,y,new Image(Assets.BULLET_BLUE_IMAG));
			shoot(new Bullet(new Image(Assets.BULLET_BLUE_IMAG), 24,24,12,12,pointDirection(x,y,Listener.x2,Listener.y2)-45,5,0,false,3),x,y,new Image(Assets.BULLET_BLUE_IMAG));
		}
		public function shootFan():void
		{
			shoot(new Bullet(new Image(Assets.BULLET_BLUE_IMAG), 24,24,12,12,direction,5,0,false,3),x,y,new Image(Assets.BULLET_BLUE_IMAG));
			shoot(new Bullet(new Image(Assets.BULLET_BLUE_IMAG), 24,24,12,12,direction+45,5,0,false,3),x,y,new Image(Assets.BULLET_BLUE_IMAG));
			shoot(new Bullet(new Image(Assets.BULLET_BLUE_IMAG), 24,24,12,12,direction+90,5,0,false,3),x,y,new Image(Assets.BULLET_BLUE_IMAG));
			shoot(new Bullet(new Image(Assets.BULLET_BLUE_IMAG), 24,24,12,12,direction+135,5,0,false,3),x,y,new Image(Assets.BULLET_BLUE_IMAG));
			shoot(new Bullet(new Image(Assets.BULLET_BLUE_IMAG), 24,24,12,12,direction+180,5,0,false,3),x,y,new Image(Assets.BULLET_BLUE_IMAG));
			shoot(new Bullet(new Image(Assets.BULLET_BLUE_IMAG), 24,24,12,12,direction+225,5,0,false,3),x,y,new Image(Assets.BULLET_BLUE_IMAG));
			shoot(new Bullet(new Image(Assets.BULLET_BLUE_IMAG), 24,24,12,12,direction+270,5,0,false,3),x,y,new Image(Assets.BULLET_BLUE_IMAG));
			shoot(new Bullet(new Image(Assets.BULLET_BLUE_IMAG), 24,24,12,12,direction+315,5,0,false,3),x,y,new Image(Assets.BULLET_BLUE_IMAG));
		}
		override public function removed():void
		{
			super.removed();
			if (BBoss_Real.defeated == true)
			{
				Master_B.bossDead = true;
			}
			defeated = true;
			deadX = x;
			deadY = y;
		}
	}
}