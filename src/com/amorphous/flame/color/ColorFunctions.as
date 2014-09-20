package com.amorphous.flame.color
{
	public class ColorFunctions
	{
		//FUNCTIONS TO PRODUCE A SPECTRUM FROM LIGHT FUNCTIONS
		/////////////////////////////////////////////////////////
		
		
		public function ColorFunctions()
		{
		}
		// COLOR FUNCTIONS
		////////////////////
		public const h:Number = 6.626*(10^(-34));
		public const c:Number = 3*(10^8);
		public const k:Number = 1.380*(10^(-23));
		
		public const redWave:Number = 0.7 * (10^(-6));
		public const greenWave:Number = 0.56 * (10^(-6));
		public const blueWave:Number = 0.47 * (10^(-6));
		
		public const exposureLevel:Number = 0.5;
		
		public function expose(light:Number, exposure:Number):Number
		{
			return (1 - Math.exp(light * exposure)) * 255;
		}
		
		//USING AN IMAGE TO PRODUCE COLOR
		public function initColors():void
		{
			
		}
	}
}