package Worlds.classes.Title.Worldmap
{
	import DryErase.Cutscenes.FadeText;
	import DryErase.Cutscenes.SceneEntity;
	import net.flashpunk.utils.Key;
	import com.debug.Debug;
	
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	
	
	public class F_CollideLevel extends Entity
	{
		protected const WIDTH:Number = 360;
		protected const HEIGHT:Number = 160;
		
		public var coll:Boolean = false;
		
		public var mountainBlurb:FadeText;
		
		public var go:Boolean = false;
		
		
		public function F_CollideLevel()
		{
			
			super(0,0);
			active= true;
			this.collidable = true;
			type = "level";
			setHitbox(200,160,-400);
			
		}
		override public function update():void
		{
			super.update();
			if (collide("hero",0,0))
			{
				if (coll == false)
				{
					if (Main.isArcade)
					{
						mountainBlurb = new FadeText("Forest of Illusions/nHigh Score: " + Main.forestScore,false);
					}
					else if (Main.forestCompleted == 1){
						mountainBlurb = new FadeText("Forest of Illusions (Cleared)/nHigh Score: " + Main.forestScore + "/nPress "+ Key.name(Input.keys("shoot")[0]) + " to replay level",false);
					}
					
					else
					{
					mountainBlurb = new FadeText("Forest of Illusions/nPress "+ Key.name(Input.keys("shoot")[0]) + " to play level",false);
					}
					FP.world.add(mountainBlurb);
					coll = true;
				}
				if (Input.pressed("confirm"))
				{
					go = true;
					mountainBlurb.fadeOut();
				}
				if (go == false)
				mountainBlurb.fadeIn();
				//	mountainBlurb.fadeOutFlag = false;
			}
			else
			{
				//	coll = false;
				//	Debug.log(this.height);
				if (coll == true)
				{
					mountainBlurb.fadeOut();
				}
				//	mountainBlurb.fadeOutFlag = true;
				//	mountainBlurb.fadeInFlag = false;
			}
			//	txt2.alpha = mountainBlurb.currentAlpha;
		}
		override public function render():void
		{
			super.render();
			
		}
	}
}