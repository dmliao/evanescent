package com.oaxoa.fx {
	
	import flash.display.Sprite;
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	
	import flash.events.Event;
	import flash.geom.Point;
	
	import flash.filters.BevelFilter;
	
	public class Branch extends Sprite {
		
		private var power:Number;
		private var decay:Number;
		private var seed:uint=Math.random()*999;
		private var bd:BitmapData;
		private var bmp:Bitmap;
		private var offsets:Array;
		
		private var line:Sprite;
		private var tx:Number;
		private var ty:Number;
		
		private var angle:Number;
		private var angleRadians:Number;
		
		private var maxRotSpeed:Number=50;
		
		private var colorValue:uint;
		private var rotSpeed:Number;
		
		private var r:Number;
		private var lum:uint;
		private var grey:uint;
		
		private var bevel:BevelFilter;
		private var perlinSize:Number;
		
		public function Branch(pperlinSize:Number=20) {
			perlinSize=pperlinSize;
			init();
			addEventListener(Event.ENTER_FRAME, onframe);
			
		}
		private function init():void {
			bd=new BitmapData(1, 1, false);
			bmp=new Bitmap(bd);
			
			offsets=[new Point(0,0), new Point(0,0)];
			
			lum=Math.random()*255;
			grey=lum<<16 | lum<<8 |lum;
			tx=ty=0;
			angle=Math.random()*360;
			power=Math.random()*8;
			decay=(90+Math.random()*9)/100;
			lum=Math.random()*255;
			
			line=new Sprite();
			line.graphics.moveTo(0,0);
			addChild(line);
		}
		
		private function onframe(event:Event):void {
			for(var i:uint=0; i<3; i++) grow();
		}
		private function grow():void {
			power*=decay;
			r=power;
			
			if(r<.3) stopThis();
			offsets[0].x+=1;
			offsets[0].y-=.4;
			
			offsets[1].x-=.3;
			offsets[1].y=.1;
			
			bd.perlinNoise(perlinSize, perlinSize, 2, seed, false, true, 7, true, offsets);
			colorValue=bd.getPixel(0,0)>>16;
			rotSpeed=(-128+colorValue)/255*maxRotSpeed;
			
			angle+=rotSpeed;
			angleRadians=angle/180*Math.PI;
			
			tx+=Math.cos(angleRadians)*power;
			ty+=Math.sin(angleRadians)*power;
			
			line.graphics.lineStyle(r*1.5, 0);
			line.graphics.lineTo(tx,ty);
		}
		
		private function stopThis():void {
			removeEventListener(Event.ENTER_FRAME, onframe);
			dispatchEvent(new Event(Event.COMPLETE));
		}
	}
	
	
	
}