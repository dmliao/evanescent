package DryErase.Enemies.Void.WaveControl
{
	import DryErase.Cutscenes.BossScene;
	import DryErase.Cutscenes.Cutscene;
	import DryErase.Cutscenes.FadeText;
	import DryErase.Cutscenes.FinalScene;
	import DryErase.Cutscenes.SceneEntity;
	import DryErase.Cutscenes.Textbox;
	import DryErase.Enemies.Boss;
	import DryErase.Enemies.Castle.Boss.CHero;
	import DryErase.Enemies.Castle.Boss.CHero_Horseback;
	import DryErase.Enemies.Flower.Enemies.boss.BBoss_Imag;
	import DryErase.Enemies.Flower.Enemies.boss.BBoss_Real;
	import DryErase.Enemies.Flower.WaveControl.Master_B;
	import DryErase.Enemies.Forest.Enemies.Boss.FMuon;
	import DryErase.Enemies.Forest.Enemies.Boss.FTau;
	import DryErase.Enemies.Void.Enemies.boss.VTree;
	import DryErase.Hero.Listener;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class VBossControl extends Cutscene
	{
		public var cutsceneTimer:Number =5;
		public var sceneNumber:Number = 0;
		
		//CUTSCENE IMAGES
		public var mtImage:SceneEntity = new SceneEntity(0,0,new Image(Assets.ENCOUNTERVOID2));
		//PORTRAITS
		public var listenerNormal:Image = new Image(Assets.PORTRAIT_LISTENER_NORMAL);
		public var listenerShocked:Image = new Image(Assets.PORTRAIT_LISTENER_SHOCKED);
		public var storyteller:Image = new Image(Assets.PORTRAIT_STORYTELLER);
		public var storytellerManic:Image = new Image(Assets.PORTRAIT_STORYTELLER_MANIC);
		
		public var currentEntity:SceneEntity;
		
		public var pauseTimer:Number = 2;
		public var greaterPauseSwitch:Boolean = false;
		
		public function VBossControl()
		{
			FP.world.add(mtImage);
			Listener.inCutscene = true;
			currentEntity = new FadeText("Dar");
			FP.world.add(new FinalScene());
		}
		override public function update():void
		{
			if (Main.isArcade == true)
			{
				skipped();
			}
			super.update();
			
			cutsceneTimer += FP.elapsed;
			pauseTimer -= FP.elapsed;
			
			if (pauseTimer < 0 && pauseTimer > -10)
			{
				switch (sceneNumber)
				{
					case 0:
					{
						currentEntity = new Textbox(120,300,"I am afraid to love...", storyteller,true);
						FP.world.add(currentEntity);
						
					}break;
					case 1:
					{
						
						currentEntity = new Textbox(32,300,"Why?", listenerNormal);
						FP.world.add(currentEntity);
						
					}break;
					case 2:
					{
						
						currentEntity = new Textbox(120,300,"Because every man kills the one he loves.", storyteller,true);
						FP.world.add(currentEntity);
						
					}break;
					case 3:
					{
						
						currentEntity = new Textbox(120,300,"Does that make me evil?", storyteller,true);
						FP.world.add(currentEntity);
						
					}break;
					case 4:
					{
						
						currentEntity = new Textbox(32,300,"No...it just makes you alone. Dreams do not have to be tragic. They can be inspiring, as well.", listenerNormal);
						FP.world.add(currentEntity);
						
					}break;
					case 5:
					{
						currentEntity = new Textbox(120,300,"No...I am evil. I have always been.", storyteller,true);
						FP.world.add(currentEntity);
					}break;
					case 6:
					{
						currentEntity = new Textbox(32,300,"I don't think you're evil. You just needed someone to listen to you.", listenerNormal);
						FP.world.add(currentEntity);
					}break;
					case 7:
					{
						currentEntity = new Textbox(120,300,"You don't understand. Nobody can, nobody's ever tried, and nobody ever will.", storyteller,true);
						FP.world.add(currentEntity);
					}break;
					case 8:
					{
						currentEntity = new Textbox(32,300,"You're so young...have you tried talking to people? Someone is bound to listen...and to understand.", listenerShocked);
						FP.world.add(currentEntity);
					}break;
					case 9:
					{
						currentEntity = new Textbox(120,300,"Someone like you?", storyteller,true);
						FP.world.add(currentEntity);
					}break;
					case 10:
					{
						currentEntity = new Textbox(32,300,"...someone like me. Maybe.", listenerNormal);
						FP.world.add(currentEntity);
					}break;
					case 11:
					{
						currentEntity = new Textbox(120,300,"No...you are wrong. You can't understand. You can't help me. I left the world so long ago, and I'm not going back.", storytellerManic,true);
						FP.world.add(currentEntity);
					}break;
					case 12:
					{
						mtImage.fadeIn();
					}break;
					case 13:
					{
						currentEntity = new Textbox(120,300,"My friends warned you to stay away. But they were wrong. I was not in danger from you.", storytellerManic,true);
						FP.world.add(currentEntity);
					}break;
					case 14:
					{
						currentEntity = new Textbox(120,300,"You were in danger because of me.", storytellerManic,true);
						FP.world.add(currentEntity);
					}break;
					case 15:
					{
						mtImage.fadeOut();
					}break;
					case 16:
					{
						endCutscene();
					}break;
				}
				
				pauseTimer = -15;
			}
			else if (currentEntity.deleted == true && pauseTimer < -10)
			{
				if (greaterPauseSwitch == false)
				{
					pauseTimer = 1;
					sceneNumber += 1;
				}
				else
				{
					pauseTimer = 5;
					sceneNumber += 1;
					greaterPauseSwitch = true;
				}
			}
			
		}
		override public function endCutscene():void
		{
			FP.world.remove(this);
			Listener.inCutscene = false;
			
			FP.world.add(new VTree);
			
		}
		override public function skipped():void
		{
			mtImage.deleteOut();
			FP.world.remove(currentEntity);
			currentEntity.deleteOut();
			endCutscene();
			FP.world.remove(this);
			Listener.inCutscene = false;
			cutsceneTimer = 500;
			Utils.flash.start();
		}
		
	}
}