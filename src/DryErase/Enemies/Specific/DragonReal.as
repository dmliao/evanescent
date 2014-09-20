package DryErase.Enemies.Specific
{
	import DryErase.Effects.Explosion_Imagination;
	import DryErase.Enemies.Bullets.AniBullet;
	import DryErase.Enemies.Enemy;
	import DryErase.Enemies.Generic.ForEnemy;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class DragonReal extends Entity
	{
		[Embed(source = '../Generic/assets/Head_Dragon_Real.png')]
		private const HEAD:Class;
		[Embed(source = '../Generic/assets/Body_Dragon_Real.png')]
		private const BODY:Class;
		
		public var DragonHead:ForEnemy;
		public var DragonBody01:Enemy;
		public var DragonBody02:Enemy;
		public var DragonBody03:Enemy;
		public var DragonBody04:Enemy;
		
		public var headImage:Image;
		public var bodyImage:Image;
		
		public var shootAlarm:Number = 0.5;
		public var shotTimes:Number = 0;
		
		public var dragonAlarm1:Number = 0;
		public var dragonAlarm2:Number = 0;
		public var dragonAlarm3:Number = 0;
		public var dragonAlarm4:Number = 0;
		
		public var length:Number;
		
		public var scaleSize:Number;
		public var scaleXXX:Number;
		
		public function DragonReal(xx:Number, yy:Number, direct:Number, field:Boolean, hboxWidth:Number = 0, hboxHeight:Number = 0, hboxOriginX:Number = 0, hboxOriginY:Number = 0, size:Number = 1, lengthFactor:Number = 0.35, scaleXX:Number = 1)
		{
			headImage = new Image(HEAD);
			headImage.centerOO();
			headImage.smooth = true;
			headImage.scaleY = scaleXX;
			scaleXXX = scaleXX;
			
			bodyImage = new Image(BODY);
			bodyImage.centerOO();
			bodyImage.smooth = true;
			bodyImage.scaleY = scaleXX;
			
			DragonBody04 = new Enemy(bodyImage, new Image(BODY), 12, 400, field, direct, hboxWidth, hboxHeight, hboxOriginX, hboxOriginY, size);
			DragonBody03 = new Enemy(bodyImage, new Image(BODY), 12, 400, field, direct, hboxWidth, hboxHeight, hboxOriginX, hboxOriginY, size);
			DragonBody02 = new Enemy(bodyImage, new Image(BODY), 12, 400, field, direct, hboxWidth, hboxHeight, hboxOriginX, hboxOriginY, size);
			DragonBody01 = new Enemy(bodyImage, new Image(BODY), 12, 400, field, direct, hboxWidth, hboxHeight, hboxOriginX, hboxOriginY, size);
			DragonHead = new ForEnemy(headImage, new Image(HEAD), 12, 400, 3, direct, xx, yy, field, hboxWidth, hboxHeight, hboxOriginX, hboxOriginY,size);
			
			FP.world.add(DragonBody04);
			FP.world.add(DragonBody03);
			FP.world.add(DragonBody02);
			FP.world.add(DragonBody01);
			FP.world.add(DragonHead);
			
			DragonBody01.x = xx;
			DragonBody01.y = yy;
			
			DragonBody02.x = xx;
			DragonBody02.y = yy;
			
			DragonBody03.x = xx;
			DragonBody03.y = yy;
			
			DragonBody04.x = xx;
			DragonBody04.y = yy;
			
			DragonHead.currentImage.scale = DragonHead.scaleFactor * size;
			DragonBody01.currentImage.scale = DragonBody01.scaleFactor * size;
			DragonBody02.currentImage.scale = DragonBody02.scaleFactor * size;
			DragonBody03.currentImage.scale = DragonBody03.scaleFactor * size;
			DragonBody04.currentImage.scale = DragonBody04.scaleFactor * size;
			
			scaleSize = size;
			
		}
		
		override public function update():void
		{
			shootAlarm += FP.elapsed;
			if (shootAlarm > 1)
			{
				if (shotTimes < 5)
				{
					DragonHead.shoot(new AniBullet(24,24,12,12,DragonHead.direction - 45*scaleXXX, 4, 0, true),DragonHead.x,DragonHead.y);
					DragonHead.shoot(new AniBullet(24,24,12,12,DragonHead.direction - 45*scaleXXX, 4, 0, true),DragonBody01.x,DragonBody01.y);
					DragonHead.shoot(new AniBullet(24,24,12,12,DragonHead.direction - 45*scaleXXX, 4, 0, true),DragonBody02.x,DragonBody02.y);
					DragonHead.shoot(new AniBullet(24,24,12,12,DragonHead.direction - 45*scaleXXX, 4, 0, true),DragonBody03.x,DragonBody03.y);
					DragonHead.shoot(new AniBullet(24,24,12,12,DragonHead.direction - 45*scaleXXX, 4, 0, true),DragonBody04.x,DragonBody04.y);
					shootAlarm = 0.6;
				}
			}
			dragonAlarm1 += FP.elapsed;
			dragonAlarm2 += FP.elapsed;
			dragonAlarm3 += FP.elapsed;
			dragonAlarm4 += FP.elapsed;
			headImage.scaleY = scaleXXX;
			bodyImage.scaleY = scaleXXX;
			
			if (dragonAlarm1 > 0.45)
			{
				DragonBody01.moveDirection(DragonBody01.pointDirection(DragonBody01.x,DragonBody01.y,DragonHead.x,DragonHead.y),DragonHead.moveSpeed);
			}
			if (dragonAlarm2 > 0.9)
			{
				DragonBody02.moveDirection(DragonBody02.pointDirection(DragonBody02.x,DragonBody02.y,DragonBody01.x,DragonBody01.y),DragonHead.moveSpeed);
			}
			if (dragonAlarm3 > 1.35)
			{
				DragonBody03.moveDirection(DragonBody03.pointDirection(DragonBody03.x,DragonBody03.y,DragonBody02.x,DragonBody02.y),DragonHead.moveSpeed);
			}
			if (dragonAlarm4 > 1.8)
			{
				DragonBody04.moveDirection(DragonBody04.pointDirection(DragonBody04.x,DragonBody04.y,DragonBody03.x,DragonBody03.y),DragonHead.moveSpeed);
			}
			
			if (DragonHead.hitPoints <= 0 || DragonBody01.hitPoints <= 0 || DragonBody02.hitPoints <= 0 || DragonBody03.hitPoints <= 0 || DragonBody04.hitPoints <= 0)
			{
				DragonHead.hitPoints = 0;
				DragonBody01.hitPoints = 0;
				DragonBody02.hitPoints = 0;
				DragonBody03.hitPoints = 0;
				DragonBody04.hitPoints = 0;
				if (DragonHead.currentField == false)
				{
					FP.world.add(new Explosion_Imagination(DragonHead.x,DragonHead.y));
					FP.world.add(new Explosion_Imagination(DragonBody01.x,DragonBody01.y));
					FP.world.add(new Explosion_Imagination(DragonBody02.x,DragonBody02.y));
					FP.world.add(new Explosion_Imagination(DragonBody03.x,DragonBody03.y));
					FP.world.add(new Explosion_Imagination(DragonBody04.x,DragonBody04.y));
				}
				FP.world.remove(this);
			}
		}
	}
}