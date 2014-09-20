package Worlds.classes
{
	import DryErase.Effects.Explosion_Imagination;
	import DryErase.Effects.Fire_Dark;
	import DryErase.Enemies.*;
	import DryErase.Enemies.Castle.WaveControl.Master_C;
	import DryErase.Enemies.Flower.WaveControl.Master_B;
	import DryErase.Enemies.Generic.ForPauseEnemy;
	import DryErase.Enemies.Mountain.WaveControl.MArcWave_I01;
	import DryErase.Enemies.Mountain.WaveControl.Master_M;
	import DryErase.HUD.GUI;
	import DryErase.HUD.Score;
	import DryErase.Hero.Listener;
	import DryErase.Obstacle.Obstacle;
	
	import Worlds.GameWorld;
	import Worlds.classes.Backgrounds.Castle2_Back;
	import Worlds.classes.Backgrounds.Castle2_Back_Real;
	import Worlds.classes.Backgrounds.Castle_Back;
	import Worlds.classes.Backgrounds.Castle_Back_Real;
	import Worlds.classes.Backgrounds.Flower_Back;
	import Worlds.classes.Backgrounds.Flower_Back_Real;
	import Worlds.classes.Backgrounds.Fog;
	import Worlds.classes.Backgrounds.Transition;
	
	import com.amorphous.flame.Fire;
	
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;

	public class Castle extends GameWorld
	{
		private var _background:Castle_Back;
		private var _backreal:Castle_Back_Real;
		private var _background2:Castle2_Back;
		private var _backreal2:Castle2_Back_Real;
		
		
		public var arch:Entity = new Entity(0,-900, new Image(Assets.CASTLE_BRIDGE));
		
		public static var outside:Boolean = false;
		private var _hero:Listener;
		public static var _glare:Entity;
		public var glareImage:Image;
		private var _hud:GUI;
		private var _score:Score;
		
		private var created:Boolean = false;
		private var flag1:Boolean = false;
		public function Castle()
		{
			_hero = new Listener();
			_background = new Castle_Back();
			_backreal = new Castle_Back_Real();
			_background2 = new Castle2_Back();
			_backreal2 = new Castle2_Back_Real();
			_backreal.visible = false;
			_backreal2.visible = false;
			_background2.visible = false;
			_hud = new GUI(_hero);
			_score = new Score();
			add(new Entity(0,0,_background));
			add(new Entity(0,0,_backreal));
			add(new Entity(0,0,_background2));
			add(new Entity(0,0,_backreal2));
			
			add(new Master_C());
			
			add(new Fog());
			
			add(_hero);	
			
			add(_hud);
			add(_score);
			add(arch);
			outside = false;
			arch.layer = - 500000;
		}
		override public function begin():void
		{
			super.begin();
			SoundManager.currentMusic=SoundManager.musicCastle;
		}
		override public function update():void
		{
			
			if (Listener.currentField == false)
			{
				_background.visible = true;
				_backreal.visible = false;
				_backreal2.visible = false;
				if (outside == true && arch.y > 320)
				{
					_background2.visible = true;
				}
				else
				{
					_background2.visible = false;
				}
				worldBackground = _background;
				
			}
			else
			{
				_background.visible = false;
				_backreal.visible = true;
				_background2.visible = false;
				if (outside == true && arch.y > 320)
				{
					_backreal2.visible = true;
				}
				else
				{
					_backreal2.visible = false;
				}
				worldBackground = _backreal;
			}
			super.update();
			if (outside == true)
			{
				arch.y += 2;
				if (created == false)
				{
					created = true;
					FP.world.add(new Transition(0,-1500));
				}
			}
			if (arch.y > 1000)
			{
				if (flag1 == false)
				{
					flag1 = true;
					Master_C.canCreateBoss2 = true;
				}
			}
			_background.y += 2 * Main.frameRate * FP.elapsed;
			_backreal.y += 2 * Main.frameRate * FP.elapsed;
			_background2.y += 2 * Main.frameRate * FP.elapsed;
			_backreal2.y += 2 * Main.frameRate * FP.elapsed;
		}
	}
}