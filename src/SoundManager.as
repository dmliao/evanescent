package
{
	import net.flashpunk.Sfx;
	
	public final class SoundManager
	{
		[Embed(source="assets/sfx/shoot.mp3")] 
		public static const SFX_HERO_SHOOT:Class;
		[Embed(source="assets/sfx/hero_shoot2.mp3")] 
		public static const SFX_HERO_SHOOT2:Class;
		[Embed(source="assets/sfx/hero_hurt.mp3")] 
		public static const SFX_HERO_HURT:Class;
		[Embed(source="assets/sfx/hero_hurt2.mp3")] 
		public static const SFX_HERO_HURT2:Class;
		[Embed(source="assets/sfx/confirm.mp3")] 
		public static const SFX_HERO_PICKUP:Class;
		
		[Embed(source="assets/sfx/enemy_explode.mp3")] 
		public static const SFX_ENEMY_EXPLODE:Class;
		[Embed(source="assets/sfx/enemy_explode2.mp3")] 
		public static const SFX_ENEMY_EXPLODE2:Class;
		
		[Embed(source="assets/sfx/confirm.mp3")] 
		public static const SFX_CONFIRM:Class;
		[Embed(source="assets/sfx/ping.mp3")] 
		public static const SFX_TEXTBOX:Class;
		
		[Embed(source="assets/music/Evanescent_Short.mp3")] 
		public static const MUSIC_TITLE:Class;
		[Embed(source="assets/music/WorldAwakens.mp3")] 
		public static const MUSIC_SCENE:Class;
		[Embed(source="assets/music/Dreams.mp3")] 
		public static const MUSIC_ENDLESS:Class;
		[Embed(source="assets/music/Mountains.mp3")] 
		public static const MUSIC_MOUNTAIN:Class;
		[Embed(source="assets/music/River.mp3")] 
		public static const MUSIC_RIVER:Class;
		[Embed(source="assets/music/Forest.mp3")] 
		public static const MUSIC_FOREST:Class;
		[Embed(source="assets/music/FlowerBed.mp3")] 
		public static const MUSIC_FLOWER:Class;
		[Embed(source="assets/music/Castle.mp3")] 
		public static const MUSIC_CASTLE:Class;
		[Embed(source="assets/music/Void.mp3")] 
		public static const MUSIC_VOID:Class;
		[Embed(source="assets/music/Nightmare.mp3")] 
		public static const MUSIC_NIGHTMARE:Class;
		[Embed(source="assets/music/Fin.mp3")] 
		public static const MUSIC_FIN:Class;
		[Embed(source="assets/music/StayWithMe.mp3")] 
		public static const MUSIC_FINAL:Class;
		
		public static var volumeMusic:Number = 0.5;
		
		public static var volumeSound:Number = 0.5;
		
		public static const musicTitle:Sfx = new Sfx(MUSIC_TITLE);
		public static const musicAwaken:Sfx = new Sfx(MUSIC_SCENE);
		
		public static const musicDreams:Sfx = new Sfx(MUSIC_ENDLESS,20);
		
		public static const musicMountain:Sfx = new Sfx(MUSIC_MOUNTAIN,50);
		public static const musicRiver:Sfx = new Sfx(MUSIC_RIVER,50);
		public static const musicForest:Sfx = new Sfx(MUSIC_FOREST,50);
		public static const musicFlower:Sfx = new Sfx(MUSIC_FLOWER,50);
		
		public static const musicCastle:Sfx = new Sfx(MUSIC_CASTLE,50);
		public static const musicVoid:Sfx = new Sfx(MUSIC_VOID,50);
		
		public static const musicNightmare:Sfx = new Sfx(MUSIC_NIGHTMARE,50);
		
		public static const musicVictory:Sfx = new Sfx(MUSIC_FIN,50);
		public static const musicFin:Sfx = new Sfx(MUSIC_FIN,50);
		public static const musicFinal:Sfx = new Sfx(MUSIC_FINAL,50);
		
		private static var _currentMusic:Sfx;
		
		public static function get currentMusic():Sfx
		{
			return _currentMusic;
		}
		
		public static function set currentMusic(music:Sfx):void
		{
			if(_currentMusic != music)
			{
				if(_currentMusic)
				{
					_currentMusic.stop();
					_currentMusic.volume = 0;
				}
				_currentMusic = music;
				_currentMusic.volume = volumeMusic;
				_currentMusic.loop(volumeMusic);
			}
		}
		
		public static function playSound(name:Class, 
			pan:Number=0, callback:Function=null):void
		{
			var s:Sfx = new Sfx(name,0,0, callback);
			s.play(volumeSound, pan);
		}
	}
}