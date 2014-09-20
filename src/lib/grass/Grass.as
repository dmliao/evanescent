package lib.grass
{
	public class Grass extends flash.display.Shape
	{
		private var size:Number; /* pixels length */
		private var stiffness:Number; /* 0..1 how flexible it should be */
		private var springiness:Number; /* max limit applyed by the wind */
		private var wind_force:Number; //used for moving the whole body, is like his actual position. 	
		private var zero_force:Number; //is the position when it is stopped.
		private var shadow_width:Number; 			
		private var shadow_color:Number;
		private var grass_color:Number;
		private var px:Number; //x position
		private var py:Number; //y position		
		//using in drawing function.
		private var st_mov:Number; //depending of its position, ending point will be lower.
		private var tension:Number; //constant value, see object creation
		private var tension2:Number; //constant value, see object creation
		private var redraw:Boolean;							
		//vars used in animation.
		private var vel:Number = 0;	//velocity applyed during animation.
		private var fact_friction:Number;
		private var fact_acc:Number;
		private var last_wf:Number;
		private var returning:Boolean;
		private var shadow_green:uint;
		private var grass_green:uint;
		private var status:uint;
		//colors during animation.
		public static var GRASS_GREEN:uint = 120;	
		public static var SHADOW_GREEN:uint = 60;	
		public static var GRASS_RED:uint = 0x66;
		public static var SHADOW_RED:uint = 0x33;		
		
		public function Grass(newx:Number, newy:Number, len:Number, st:Number, sp:Number, zf:Number, sw:Number) {			
			status = 0;
			redraw = true;
			returning = false;			
			x = newx;
			y = newy;
			px = 0;
			py = 170;
			size = len;
			stiffness = st;		
			st_mov = .8 + (1 - stiffness) * .2;
			springiness = sp;
			zero_force = zf;
			shadow_width = sw;			
			shadow_green = rand(40);
			grass_green = rand(40);			
			shadow_color = RGBtoNum(SHADOW_RED, SHADOW_GREEN + shadow_green, 0x00);
			grass_color = RGBtoNum(GRASS_RED, GRASS_GREEN + grass_green, 0x00);			
			tension = this.size / 4;
			tension2 = tension / 16;			
			fact_friction = .95 + (stiffness * .025);			
			resetSpeed();
		}
		public static function rand(n:uint):uint {
			return int(Math.random() * n);
		}
		public static function RGBtoNum(i_r:int,i_g:int,i_b:int):Number{
			return i_r<<16 | i_g<<8 | i_b;
		}		
		public function resetSpeed():void {
			fact_acc = 0;		
			vel = 0;	
		}
		private function applyAnimation(limit:Number):Boolean {
			var diff:Number = limit-wind_force;		
			if (fact_acc == 0){
				fact_acc = 0.5 * (diff < 0 ? -1 : 1);
				fact_acc += (stiffness * .45)
			} else if ((diff > 0 && fact_acc < 0) || (diff < 0 && fact_acc > 0)){				
				fact_acc *= -1;		
			}				
			var old_vel:Number = vel;			
			vel = (vel+fact_acc)*fact_friction;
			if ((vel > 0 && old_vel < 0) || (vel < 0 && old_vel > 0)){
				fact_acc *= .7;
				if (Math.abs(diff) <= 0.65){					
					return false;
					vel = 0;
				}
			}				
			wind_force += vel;			
			return true;
		}
		public function next(wf:Number, refresh_color:Boolean = false):Boolean {
			if (wf != 0){
				if (status != 1) {
					resetSpeed();					
					status = 1;
				}
				if (last_wf != wf) {
					last_wf = wf;
					if (fact_acc < .5) {
						fact_acc += .5;
					}
				}
				returning = true;
				redraw = true;				
				applyAnimation(zero_force + wf);
			} else if (returning) {	
				if (status != 2) {
					resetSpeed();
					status = 2;
				}
				redraw = true;
				returning = applyAnimation(zero_force);
			} else {
				wind_force = zero_force;
				status = 0;
			}	
			if (redraw || refresh_color) {
				if (refresh_color) {
					shadow_color = RGBtoNum(SHADOW_RED, SHADOW_GREEN + shadow_green, 0x00);
					grass_color = RGBtoNum(GRASS_RED, GRASS_GREEN + grass_green, 0x00);
				}
				var canvas:flash.display.Graphics = this.graphics;				
				canvas.clear();				
				var end_x:Number = px+wind_force;
				var end_y:Number = py - size + (Math.abs(wind_force) * Math.abs(wind_force/springiness)*.3);		
				var control_y:Number = tension*stiffness+tension;				
				canvas.beginFill(shadow_color);
				canvas.moveTo(px,py);
				canvas.curveTo(px,control_y,end_x,end_y);
				canvas.curveTo(px+tension2,control_y,px+tension2,py);
				canvas.lineTo(px,py);
				canvas.endFill();
				canvas.beginFill(grass_color);
				canvas.moveTo(px,py);
				canvas.curveTo(px,control_y,end_x,end_y);
				canvas.curveTo(px-tension2*(1+shadow_width),control_y,px-tension2,py);
				canvas.lineTo(px,py);
				canvas.endFill();				
				redraw = wind_force != zero_force;				
				return redraw; 
			}			
			return false;
		}		
	}
}