package com.amorphous.flame.fields
{
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	import ru.inspirit.utils.FluidSolver;
	import ru.inspirit.utils.Random;
	
	/**
	 * Class that contains fluid components of the fire.
	 * @author Diana Liao
	 */
	public class Fields
	{	
		//VARIABLES
		///////////////
		[Embed(source='../color/assets/Spectrum.png')]
		private var Spectrum:Class;
		[Embed(source='../color/assets/Spectrum.png')]
		private var Flame:Class;
		
		//how big everything will be....the bigger the numbers, the more detailed, but slower the flame will run.
		public var width:Number = 60;
		public var height:Number = 60;
		
		public var finalIndex:Number;
		
		public var cellwidth:Number;
		public var cellheight:Number;
		
		//3 main parameters...oxygen, fuel and heat. They will react to create fire.
		//For each field, the 'r' value is the amount of x in that particular cell...so oxygen.r would be the amount of oxygen in that particular cell
		public var fuel:NonFluidGrid;
		public var heat:FluidSolver; 
		
		public var defaultOxygen:Number = 1; //How much oxygen will typically be in the environment
		
		/**
		 * Constructor. Used to create a new container for fluid fields. Not to be used outside of the Fire class
		 * @param	w					Width of the fluid fields (in number of cells)
		 * @param	h					Height of the fluid fields (in number of cells)
		 */
		public function Fields(w:uint,h:uint)
		{
			width = w;
			height = h;
			finalIndex = width*height - 1;
			
			//declare the variables
			fuel = new NonFluidGrid(width,height); //FUEL is solid, so it is not a fluid. Setting it as a simple grid will save computer power
			heat = new FluidSolver(width,height);
			
		
			initFuel();
			initHeat();
			
			initColors();
		}
		
		
		//VARIOUS UTILS
		//////////////////
		public function getCellX(i:Number, j:Number):Number
		{
			return i * cellwidth;
		}
		public function getCellY(i:Number, j:Number):Number
		{
			return j * cellheight;
		}
		
		
		//INIT ALL THE FIELDS
		/////////////////////
		
		private function initFuel():void
		{
			fuel.rgb = false;
			fuel.fadeSpeed = 0.00;
			
			fuel.viscosity = 0.00;
			fuel.vorticityConfinement = false;
		}
		
		private function initHeat():void
		{
			heat.rgb = true;
			heat.fadeSpeed = 0.1; //Heat will cool down using Planck's factor...will be changed later
			heat.deltaT = 0.2;
			heat.viscosity = 0.0000;
			heat.vorticityConfinement = true;
			
		}
		
		
		// UPDATE FUNCTIONS
		////////////////////
		
		//call this function every step
		public function update():void
		{
			fuel.update();
			heat.update();
			combust();
			convect();
			limits();
			
		}
		
		//CONSTANTS FOR BURNING FUEL
		///////////////////////////////
		public const energyBarrier:Number = 0; //ENERGY BARRIER (if the temperature is too low, no reaction will occur)
		public const rateConstant:Number = 0.5; //THE CONSTANT AT WHICH THE RATE MOVES
		public const maxRate:Number = 1; //THE MAXIMUM RATE OF REACTION TO AVOID BLOWING THINGS UP
		public var exothermic:Number = 4; //HOW QUICKLY HEAT IS DISPERCED
		
		private function limits():void
		{
			var index:int;
			var i:int, j:int;
			
			for(j = 1; j < height + 1; ++j) {
				for(i = 1; i < width + 1; ++i) {
					index = heat.getIndexForCellPosition(i, j);
					if (fuel.r[index] > 1)
					{
						fuel.r[index] = 1;
					}
					if (fuel.r[index] < 0)
					{
						fuel.r[index] = 0;
					}
					if (heat.r[index] > 1)
					{
						heat.r[index ] = 1;
					}
					if (heat.g[index] > 1)
					{
						heat.g[index ] = 1;
					}
					if (heat.b[index] > 1)
					{
						heat.b[index ] = 1;
					}
					
					
				}
			}
		}
		
		private function combust():void
		{
			//trace(reactionRate);
			var index:int;
			var i:int, j:int;
			var reactionRate:Number;
			//trace(heat.r[50]);
			for(j = 1; j < height + 1; ++j) {
				for(i = 1; i < width + 2; ++i) {
					index = heat.getIndexForCellPosition(i, j);
					reactionRate = (fuel.r[index] * heat.r[index] - energyBarrier) * rateConstant;
					//reactionRate = 0.2;
					
					if (reactionRate < 0)
					{
						reactionRate = 0; //do not have negative reactions
					}
					if (reactionRate > maxRate)
					{
						reactionRate = maxRate; //do not exceed the maximum rate
					}
					
					//consume reactants, and produce heat
					fuel.r[index] -= reactionRate;
					heat.r[index] += reactionRate * exothermic;
					heat.g[index] += reactionRate * exothermic;
					heat.b[index] += reactionRate * exothermic;
				}
			}
		}
		
		//process for adding convection for oxygen and heat
		// NOTE: WILL INVOLVE USE OF UOLD AND VOLD
		private function convect():void
		{
			const velocityDamp:Number = 0.7;
			
			var i:int, j:int, fi:int;
			var index:int = 0;
			
			for(j = 0; j < height; j += 1) {
				for(i = 0; i < width; i += 1) {
					index = heat.getIndexForCellPosition(i, j);
					heat.vOld[index] -= heat.r[index]*01;
					heat.v[index] *= velocityDamp;
					heat.u[index] *= velocityDamp;
					
				}
			}
		}
		
		//OPTIONAL FUNCTION TO CONTINUALLY REPLENISH OXYGEN AND FUEL (TO DEFAULT VALUES)
		
		
		//MAPPING COLORS
		//USE bitmapdata.getPixel function to get the individual pixels
		public var spectrum:BitmapData;
		public var fireParticle:BitmapData;
	
		// USED ONLY FOR TESTING PURPOSES...REAL SIM WILL USE SPECTRUM IMAGE
		private function initColors():void
		{
			var pic:Bitmap = new Spectrum();
			spectrum = pic.bitmapData;
			
			var pic2:Bitmap = new Flame();
			fireParticle = pic2.bitmapData;
			
		}
		public function initFireColors(bmp:BitmapData):void
		{
			spectrum = bmp;
		}
		public function getColors(value:Number):uint
		{
			if (value > 1)
			{
				value = 1;
			}
			var pixel:Number = Math.floor(value*(spectrum.width-1));
			return spectrum.getPixel(pixel,0);
		}
		
	}
}