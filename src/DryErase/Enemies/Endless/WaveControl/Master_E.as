package DryErase.Enemies.Endless.WaveControl
{
	import DryErase.Enemies.Flower.Enemies.BJetI;
	import DryErase.Enemies.Flower.WaveControl.BFlowerWaveI;
	import DryErase.Enemies.Flower.WaveControl.BJetSprayI;
	import DryErase.Enemies.Flower.WaveControl.BLadybirdWaveI;
	import DryErase.Enemies.Flower.WaveControl.BThrushWaveR00;
	import DryErase.Enemies.Forest.Enemies.FCreepI;
	import DryErase.Enemies.Forest.Enemies.FCreepR;
	import DryErase.Enemies.Forest.Enemies.FForTurnerI;
	import DryErase.Enemies.Forest.WaveControl.FCreepWaveI;
	import DryErase.Enemies.Forest.WaveControl.FCreepWaveR;
	import DryErase.Enemies.Forest.WaveControl.FForWaveI00;
	import DryErase.Enemies.Forest.WaveControl.FForWaveR00;
	import DryErase.Enemies.Forest.WaveControl.FUTurnerWaveR;
	import DryErase.Enemies.Forest.WaveControl.FWaverWaveI;
	import DryErase.Enemies.Generic.WaveControl.Wave;
	import DryErase.Enemies.Mountain.WaveControl.MArcWave_I01;
	import DryErase.Enemies.Mountain.WaveControl.MArcWave_R01;
	import DryErase.Enemies.Mountain.WaveControl.MForPausEwave_I00;
	import DryErase.Enemies.Mountain.WaveControl.MForPauseWave_R00;
	import DryErase.Enemies.Mountain.WaveControl.MSwoopWave_I04;
	import DryErase.Enemies.River.Enemies.RArcEnemyI;
	import DryErase.Enemies.River.Enemies.RCrawlerI;
	import DryErase.Enemies.River.WaveControl.RArcWave_I;
	import DryErase.Enemies.River.WaveControl.RArcWave_R;
	import DryErase.Enemies.River.WaveControl.RForThreeWave_I00;
	import DryErase.Enemies.River.WaveControl.RLadyWaveR;
	import DryErase.Enemies.River.WaveControl.RMoveInWaveI;
	
	import Worlds.classes.LevelComplete;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;

	public class Master_E extends Entity
	{
		
		public var currentWave:Entity;
		public var currentWaveR:Entity;
		private var fadeImage:Image = new Image(Assets.TITLE_BACK);
		private var fadeOut:Entity = new Entity(0,0,fadeImage);
		public var timeElapsed:Number = 4;
		
		public var easyWavesI:Array = new Array(new MArcWave_I01(), new MForPausEwave_I00(), new RArcWave_I(), new RForThreeWave_I00(), new RMoveInWaveI(), new FForWaveI00(), new FWaverWaveI(320,true), new FWaverWaveI(320,false), new FCreepWaveI(), new BLadybirdWaveI(), new BJetSprayI());
		public var easyWavesR:Array = new Array();
		
		public var medWavesI:Array = new Array();
		public var medWavesR:Array = new Array();
		
		public var hardWavesI:Array = new Array();
		public var hardWavesR:Array = new Array();
		
		public var superTime:Number = 0;
		
		public static var bossDead:Boolean = false;
		public var bossTimer:Number = 0;
		public var reset3:Boolean = false;
		
		public function Master_E()
		{
			init();
		}
		
		public function init():void
		{
			Main.currentLevel = "endless";
			bossDead = false;
			bossTimer = 0;
			reset3 = false;
			
		}
		override public function update():void
		{
			timeElapsed += FP.elapsed;
			if (timeElapsed > 8)
			{
			//	var index:Number = Math.floor(Math.random()*easyWavesI.length());
				currentWaveR = FP.choose(new MArcWave_I01(), new MForPausEwave_I00(), new RArcWave_I(), new RForThreeWave_I00(), new RMoveInWaveI(), new FForWaveI00(), new FWaverWaveI(320,true), new FWaverWaveI(320,false), new FCreepWaveI(), new BLadybirdWaveI(), new BJetSprayI());
				currentWave = FP.choose(new MArcWave_R01(), new MForPauseWave_R00(), new RArcWave_R(), new FCreepWaveR(), new RLadyWaveR(), new FForWaveR00(), new FUTurnerWaveR(), new BThrushWaveR00(320,true), new BThrushWaveR00(320,false));
				FP.world.add(currentWave);
				FP.world.add(currentWaveR);
				timeElapsed = 0;
			}
			if (bossDead)
			{
				if (reset3 == false)
				{
					FP.world.add(fadeOut);
					reset3 = true;
					
					SoundManager.currentMusic = SoundManager.musicFin;
					
				}
				bossTimer += FP.elapsed;
				fadeOut.layer = -9999999999;
				fadeImage.alpha = bossTimer / 3;
				if (bossTimer > 5)
				{
					
					FP.world = new LevelComplete();
				}
			}
		}
	}
}