package DryErase.Cutscenes
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class BossScene extends Entity
	{
		
		public var currentImage:Image;
		public var flag:Boolean = false;
		public var color2:uint = Math.random() * 16777216;
		public var alarm:Number = 0;
		
		public var muted:Boolean;
		public function BossScene()
		{
			if (SoundManager.volumeMusic == 0)
			{
				muted = true;
			}
			else
			{
				muted = false;
			}
			layer = -9999;
			currentImage = new Image(Assets.bossFrame);
			x = 320;
			y = 240;
			currentImage.centerOO();
			graphic = currentImage;
			currentImage.active = true;
			currentImage.alpha = 0;
			currentImage.color = Math.random() * 16777216;
			
		}
		override public function update():void
		{
			if (muted == false)
			{
			if (SoundManager.currentMusic != SoundManager.musicNightmare && SoundManager.currentMusic != SoundManager.musicVictory)
			{
				if (SoundManager.volumeMusic > 0)
				{
					SoundManager.volumeMusic -= 0.003;
					SoundManager.currentMusic.volume = SoundManager.volumeMusic;
				}
				else
				{
					SoundManager.currentMusic = SoundManager.musicNightmare;
				}
			}
			else
			{
				if (SoundManager.volumeMusic < 0.5)
				{
					SoundManager.volumeMusic += 0.003;
					SoundManager.currentMusic.volume = SoundManager.volumeMusic;
				}
				else
				{
					SoundManager.volumeMusic = 0.5;
				}
			}
			}
			alarm += FP.elapsed;
			super.update();
			if (flag == false)
			{
				currentImage.alpha += 0.05;
			}
			else
			{
				currentImage.alpha -= 0.05;
			}
			currentImage.color = fadeHex(currentImage.color,color2,0.01);
			if (alarm > 2)
			{
				color2 = Math.random() * 16777216;
				alarm = 0;
			}
		}
		public function kill():void
		{
			flag = true;
		}
		public function fadeHex (hex, hex2, ratio):uint{
			var r = hex >> 16;
			var g = hex >> 8 & 0xFF;
			var b = hex & 0xFF;
			r += ((hex2 >> 16)-r)*ratio;
			g += ((hex2 >> 8 & 0xFF)-g)*ratio;
			b += ((hex2 & 0xFF)-b)*ratio;
			return(r<<16 | g<<8 | b);
		}
	}
}