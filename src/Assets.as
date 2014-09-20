package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	import flash.geom.Point;
	
	import net.flashpunk.FP;

	public class Assets
	{
		
		//FONT
		/////////
		[Embed(source = "assets/font/Gondola_SD.ttf",embedAsCFF="false", 
			fontFamily = "mainFont")] 
		public static const MAINFONT:Class;
		
		[Embed(source = 'assets/cutscenes/AmorphousLogo.jpg')]
		public static const SPLASHSCREEN:Class;
		
		
		//PORTRAITS
		//////////////
		[Embed(source = 'assets/cutscenes/portraits/listener_normal.png')]
		public static const PORTRAIT_LISTENER_NORMAL:Class;
		[Embed(source = 'assets/cutscenes/portraits/listener_shocked.png')]
		public static const PORTRAIT_LISTENER_SHOCKED:Class;
		[Embed(source = 'assets/cutscenes/portraits/storyteller.png')]
		public static const PORTRAIT_STORYTELLER:Class;
		[Embed(source = 'assets/cutscenes/portraits/storyteller_manic.png')]
		public static const PORTRAIT_STORYTELLER_MANIC:Class;
		
		
		[Embed(source = 'assets/cutscenes/portraits/muon_portrait.png')]
		public static const PORTRAIT_MUON:Class;
		[Embed(source = 'assets/cutscenes/portraits/tau_portrait.png')]
		public static const PORTRAIT_TAU:Class;
		
		
		[Embed(source = 'assets/cutscenes/portraits/guey_portrait.png')]
		public static const PORTRAIT_GUEY:Class;
		
		
		[Embed(source = 'assets/cutscenes/ContinueArrow.png')]
		public static const CONTINUE:Class;
		
		//HERO GRAPHICS
		/////////////////
		
		// HUD
		//////////
		[Embed(source = 'assets/hero/hud/Controls.png')]
		public static const HUD_CONTROLS:Class;
		[Embed(source = 'assets/hero/hud/MenuControls.png')]
		public static const HUD_CONTROLS_MENU:Class;
		
		[Embed(source = 'assets/hero/hud/HUD_Imagination.png')]
		public static const HUD_IMAGINATION:Class;
		[Embed(source = 'assets/hero/hud/HUD_Reality.png')]
		public static const HUD_REALITY:Class;
		
		[Embed(source = 'assets/hero/hud/HealthBar_Imagination.png')]
		public static const HP_IMAGINATION:Class;
		[Embed(source = 'assets/hero/hud/HealthBar_Reality.png')]
		public static const HP_REALITY:Class;
		
		[Embed(source = 'assets/hero/hud/WeaponBar_Imagination.png')]
		public static const WBAR_IMAGINATION:Class;
		[Embed(source = 'assets/hero/hud/WeaponBar_Reality.png')]
		public static const WBAR_REALITY:Class;
		[Embed(source = 'assets/hero/hud/WeaponsHUD_Imagination.png')]
		public static const WEAPON_IMAGINATION:Class;
		[Embed(source = 'assets/hero/hud/WeaponsHUD_Reality.png')]
		public static const WEAPON_REALITY:Class;
		
		[Embed(source = 'assets/hero/hud/ScoreHUD_Imagination.png')]
		public static const SCORE_IMAGINATION:Class;
		[Embed(source = 'assets/hero/hud/ScoreHUD_Reality.png')]
		public static const SCORE_REALITY:Class;
		
		[Embed(source = 'assets/hero/hud/Crack.jpg')]
		public static const CRACK:Class;
		[Embed(source = 'assets/hero/hud/Crack_Alpha.jpg')]
		public static const CRACK_ALPHA:Class;
			//CRACK JPG
			public static var crack:BitmapData;
		
		//COIN
		[Embed(source = 'assets/hero/Coin_strip7.png')]
		public static const REALCOIN:Class;
		[Embed(source = 'assets/hero/Coin_Imagstrip7.png')]
		public static const IMAGCOIN:Class;
		
		[Embed(source = 'assets/hero/Listener_Avatar.png')]
		public static const PLAYER_AVATAR:Class;
		
		[Embed(source = 'assets/hero/Listener_Perspective.png')]
		public static const PLAYER:Class;
		[Embed(source = 'assets/hero/Listener_BankRight.png')]
		public static const PLAYER_RIGHT:Class;
		[Embed(source = 'assets/hero/Listener_BankLeft.png')]
		public static const PLAYER_LEFT:Class;
		
		[Embed(source = 'assets/hero/White.png')]
		public static const WHITESPACE:Class;
		
		
		//REALITY FIELD IMAGES
		[Embed(source = 'assets/hero/Listener_BankLeft_Real.png')]
		public static const PLAYER_LEFT_REAL:Class;
		[Embed(source = 'assets/hero/Listener_BankRight_Real.png')]
		public static const PLAYER_RIGHT_REAL:Class;
		[Embed(source = 'assets/hero/Listener_Real.png')]
		public static const PLAYER_REAL:Class;
		
		//SPIDER RECHARGE IMAGES
		[Embed(source = 'assets/hero/Listener_Spider.png')]
		public static const PLAYER_SPIDER:Class;
		[Embed(source = 'assets/hero/Listener_Spider_Right.png')]
		public static const PLAYER_RIGHT_SPIDER:Class;
		[Embed(source = 'assets/hero/Listener_Spider_Left.png')]
		public static const PLAYER_LEFT_SPIDER:Class;
		
		[Embed(source = 'assets/hero/Listener_Man.png')]
		public static const PLAYER_MAN:Class;
		
		//SHADOW IMAGE
		[Embed(source = 'assets/hero/Listener_Shadow.png')]
		public static const PLAYER_SHADOW:Class;
		
		//TEST IMAGE
		[Embed(source = 'assets/hero/inv.png')]
		public static const INVINC:Class;
		
		//BULLETS
		[Embed(source = 'assets/hero/Bullet_Imagination_Single.png')]
		public static const BULLETI:Class;
		[Embed(source = 'assets/hero/Bullet_Imagination.png')]
		public static const TITLEBULLET:Class;
		[Embed(source = 'assets/hero/Bullet_Reality_Single.png')]
		public static const BULLETR:Class;
		
		[Embed(source = 'assets/hero/Spider.png')]
		public static const SPIDER:Class;
		[Embed(source = 'assets/hero/Laser_anim2_strip8.png')]
		public static const LASER:Class;
		
		
		//SPECIAL EFFECTS
		[Embed(source = 'assets/effects/InkRing.png')]
		public static const EXPLODE_IMG:Class;
		[Embed(source = 'assets/effects/InkSplode.png')]
		public static const EXPLODE_IMG_AFTEREFFECTS:Class;
		
		[Embed(source = 'assets/effects/Explosion.jpg')]
		public static const EXPLODE:Class;
		[Embed(source = 'assets/effects/Explosion_Alpha.jpg')]
		public static const EXPLODE_ALPHA:Class;
		
			public static var explodeReal:BitmapData;
			
			[Embed(source = 'assets/effects/Explosion_blue.jpg')]
			public static const EXPLODE_BLUE:Class;
			[Embed(source = 'assets/effects/Explosion_Alpha.jpg')]
			public static const EXPLODE_BLUE_ALPHA:Class;
			
			public static var explodeBlue:BitmapData;
			
		[Embed(source = 'assets/effects/Lightfire.jpg')]
		public static const FIRE:Class;
		[Embed(source = 'assets/effects/Lightfire_Alpha.jpg')]
		public static const FIRE_ALPHA:Class;
		
			public static var fireAnim:BitmapData;
		
		//ENEMY BULLETS
		[Embed(source = 'assets/enemies/bullets/AniRealBullet_green.png')]
		public static const BULLET_ANIGREEN:Class;
		[Embed(source = 'assets/enemies/bullets/AniRealBullet_red.png')]
		public static const BULLET_ANIRED:Class;
		[Embed(source = 'assets/enemies/bullets/SimpleBullet_strip8.png')]
		public static const BULLET_ANIBLACK:Class;
		[Embed(source = 'assets/enemies/bullets/AniRealBullet_blue.png')]
		public static const BULLET_ANIBLUE:Class;
			
		[Embed(source = 'assets/enemies/bullets/Bullet_Real.png')]
		public static const BULLET_REAL:Class;
		[Embed(source = 'assets/enemies/bullets/BlueBullet.png')]
		public static const BULLET_BWAVE_IMAG:Class;
		[Embed(source = 'assets/enemies/bullets/BlueBulletReal.png')]
		public static const BULLET_BWAVE_REAL:Class;
		[Embed(source = 'assets/enemies/bullets/GreenBullet.png')]
		public static const BULLET_GSTAR_IMAG:Class;
		[Embed(source = 'assets/enemies/bullets/GreenBulletReal.png')]
		public static const BULLET_GSTAR_REAL:Class;
		[Embed(source = 'assets/enemies/bullets/GreyBullet.png')]
		public static const BULLET_GREY_IMAG:Class;
		[Embed(source = 'assets/enemies/bullets/GreyBulletReal.png')]
		public static const BULLET_GREY_REAL:Class;
		[Embed(source = 'assets/enemies/bullets/SimpleBlueBullet.png')]
		public static const BULLET_BLUE_IMAG:Class;
		[Embed(source = 'assets/enemies/bullets/SimpleBlueReal.png')]
		public static const BULLET_BLUE_REAL:Class;
		[Embed(source = 'assets/enemies/bullets/SimpleGreenBullet.png')]
		public static const BULLET_GREEN_IMAG:Class;
		[Embed(source = 'assets/enemies/bullets/SimpleGreenReal.png')]
		public static const BULLET_GREEN_REAL:Class;
		[Embed(source = 'assets/enemies/bullets/SimpleRedBullet.png')]
		public static const BULLET_RED_IMAG:Class;
		[Embed(source = 'assets/enemies/bullets/SimpleRedReal.png')]
		public static const BULLET_RED_REAL:Class;
		[Embed(source = 'assets/enemies/bullets/WaveBullet.png')]
		public static const BULLET_WAVE:Class;
		
		[Embed(source = 'assets/enemies/bullets/boss/muonbullet_imag.png')]
		public static const MUONBULLET_IMAG:Class;
		[Embed(source = 'assets/enemies/bullets/boss/muonbullet_real.png')]
		public static const MUONBULLET_REAL:Class;
		[Embed(source = 'assets/enemies/bullets/boss/taubullet_imag.png')]
		public static const TAUBULLET_IMAG:Class;
		[Embed(source = 'assets/enemies/bullets/boss/taubullet_real.png')]
		public static const TAUBULLET_REAL:Class;
		[Embed(source = 'assets/enemies/bullets/boss/lungbullet_imag.png')]
		public static const LUNGBULLET_IMAG:Class;
		[Embed(source = 'assets/enemies/bullets/boss/lungbullet_real.png')]
		public static const LUNGBULLET_REAL:Class;
		
		[Embed(source = 'assets/enemies/bullets/boss/gueybullet1_imag.png')]
		public static const GUEYBULLET1_IMAG:Class;
		[Embed(source = 'assets/enemies/bullets/boss/gueybullet1_real.png')]
		public static const GUEYBULLET1_REAL:Class;
		[Embed(source = 'assets/enemies/bullets/boss/gueybullet2_imag.png')]
		public static const GUEYBULLET2_IMAG:Class;
		[Embed(source = 'assets/enemies/bullets/boss/gueybullet2_real.png')]
		public static const GUEYBULLET2_REAL:Class;
		[Embed(source = 'assets/enemies/bullets/boss/herobullet1_imag.png')]
		public static const HEROBULLET1_IMAG:Class;
		[Embed(source = 'assets/enemies/bullets/boss/herobullet1_real.png')]
		public static const HEROBULLET1_REAL:Class;
		[Embed(source = 'assets/enemies/bullets/boss/herobullet2_imag.png')]
		public static const HEROBULLET2_IMAG:Class;
		[Embed(source = 'assets/enemies/bullets/boss/herobullet2_real.png')]
		public static const HEROBULLET2_REAL:Class;
		[Embed(source = 'assets/enemies/bullets/boss/herobullet3_imag.png')]
		public static const HEROBULLET3_IMAG:Class;
		[Embed(source = 'assets/enemies/bullets/boss/herobullet3_real.png')]
		public static const HEROBULLET3_REAL:Class;
			
		//MOUNTAIN ENEMIES
		[Embed(source = 'assets/enemies/mountain/Body_Dragon_Real.png')]
		public static const M_BODY_DRAGON_REAL:Class;
		[Embed(source = 'assets/enemies/mountain/Body_Dragon.png')]
		public static const M_BODY_DRAGON_IMAG:Class;
		[Embed(source = 'assets/enemies/mountain/Head_Dragon_Real.png')]
		public static const M_HEAD_DRAGON_REAL:Class;
		[Embed(source = 'assets/enemies/mountain/Head_Dragon.png')]
		public static const M_HEAD_DRAGON_IMAG:Class;
		[Embed(source = 'assets/enemies/mountain/Enemy_DragonFly_Real.png')]
		public static const M_DFLY_REAL:Class;
		[Embed(source = 'assets/enemies/mountain/Enemy_DragonFly.png')]
		public static const M_DFLY_IMAG:Class;
		[Embed(source = 'assets/enemies/mountain/Enemy_MinibossReal.png')]
		public static const M_MBOSS_REAL:Class;
		[Embed(source = 'assets/enemies/mountain/Enemy_Miniboss.png')]
		public static const M_MBOSS_IMAG:Class;
		[Embed(source = 'assets/enemies/mountain/Enemy_SpearThrush_Real.png')]
		public static const M_SPTHRUSH_REAL:Class;
		[Embed(source = 'assets/enemies/mountain/Enemy_SpearThrush.png')]
		public static const M_SPTHRUSH_IMAG:Class;
		[Embed(source = 'assets/enemies/mountain/Enemy_StarReal.png')]
		public static const M_STAR_REAL:Class;
		[Embed(source = 'assets/enemies/mountain/Enemy_Star.png')]
		public static const M_STAR_IMAG:Class;
		
		//MIX ENEMIES - NATIVE MOUNTAIN
		[Embed(source = 'assets/enemies/mountain/Enemy_bird_real.png')]
		public static const MX_BIRD_REAL:Class;
		[Embed(source = 'assets/enemies/mountain/Enemy_bird_stop.png')]
		public static const MX_BIRD_IMAG:Class;
		
		[Embed(source = 'assets/enemies/mountain/Enemy_ThrushReal.png')]
		public static const MX_THRUSH_REAL:Class;
		[Embed(source = 'assets/enemies/mountain/Enemy_Thrush.png')]
		public static const MX_THRUSH_IMAG:Class;
		
		[Embed(source = 'assets/enemies/mountain/Enemy_Wing_Real.png')]
		public static const MX_WING_REAL:Class;
		[Embed(source = 'assets/enemies/mountain/Enemy_Wing.png')]
		public static const MX_WING_IMAG:Class;
		
		//LUNG
		[Embed(source = 'assets/enemies/mountain/boss/DragonBoss_Imag_strip4.jpg')]
		public static const LUNGIMAG:Class;
		[Embed(source = 'assets/enemies/mountain/boss/DragonBoss_strip4.jpg')]
		public static const LUNGREAL:Class;
		[Embed(source = 'assets/enemies/mountain/boss/DragonBoss_Imag_Alpha.jpg')]
		public static const LUNGIMAG_ALPHA:Class;
		[Embed(source = 'assets/enemies/mountain/boss/DragonBoss_Alpha.jpg')]
		public static const LUNGREAL_ALPHA:Class;
		
			//LUNG JPG
			public static var lungImag:BitmapData;
			public static var lungReal:BitmapData;
		
		//RIVER ENEMIES
		[Embed(source = 'assets/enemies/river/Cannonball.png')]
		public static const R_CANNONBALL:Class;
		[Embed(source = 'assets/enemies/river/Enemy_FlyingFish_Real.png')]
		public static const R_FLYINGFISH_REAL:Class;
		[Embed(source = 'assets/enemies/river/Enemy_FlyingFish.png')]
		public static const R_FLYINGFISH_IMAG:Class;
		[Embed(source = 'assets/enemies/river/Enemy_Ladybird_Real.png')]
		public static const R_LADY_REAL:Class;
		[Embed(source = 'assets/enemies/river/Enemy_Ladybird.png')]
		public static const R_LADY_IMAG:Class;
		[Embed(source = 'assets/enemies/river/Enemy_Pillbug.png')]
		public static const R_PILLBUG_IMAG:Class;
		[Embed(source = 'assets/enemies/river/Enemy_Roundthrush_Real.png')]
		public static const R_RTHRUSH_REAL:Class;
		[Embed(source = 'assets/enemies/river/Enemy_Roundthrush.png')]
		public static const R_RTHRUSH_IMAG:Class;
		[Embed(source = 'assets/enemies/river/Enemy_Turtle_Real.png')]
		public static const R_TURTLE_REAL:Class;
		[Embed(source = 'assets/enemies/river/Enemy_Turtle.png')]
		public static const R_TURTLE_IMAG:Class;
		[Embed(source = 'assets/enemies/river/Lilypad_Ice.png')]
		public static const R_LPAD_REAL:Class;
		[Embed(source = 'assets/enemies/river/Lilypad.png')]
		public static const R_LPAD_IMAG:Class;
		[Embed(source = 'assets/enemies/river/Ship_Real.png')]
		public static const R_SHIP_REAL:Class;
		[Embed(source = 'assets/enemies/river/Ship_Real_Turret.png')]
		public static const R_SHIP_TURRET:Class;
		[Embed(source = 'assets/enemies/river/TriEnemy_Real.png')]
		public static const R_TRI_REAL:Class;
		[Embed(source = 'assets/enemies/river/TriEnemy.png')]
		public static const R_TRI_IMAG:Class;
		
		//GUEY
		[Embed(source = 'assets/enemies/river/Boss/HeadD.png')]
		public static const GUEY_HEAD_IMAG_DOWN:Class;
		[Embed(source = 'assets/enemies/river/Boss/HeadU.png')]
		public static const GUEY_HEAD_IMAG_UP:Class;
		
		[Embed(source = 'assets/enemies/river/Boss/HeadD_Real.png')]
		public static const GUEY_HEAD_REAL_DOWN:Class;
		[Embed(source = 'assets/enemies/river/Boss/HeadU_Real.png')]
		public static const GUEY_HEAD_REAL_UP:Class;
		
		[Embed(source = 'assets/enemies/river/Boss/UpperD.png')]
		public static const GUEY_UPPER_IMAG_DOWN:Class;
		[Embed(source = 'assets/enemies/river/Boss/UpperU.png')]
		public static const GUEY_UPPER_IMAG_UP:Class;
		
		[Embed(source = 'assets/enemies/river/Boss/UpperD_Real.png')]
		public static const GUEY_UPPER_REAL_DOWN:Class;
		[Embed(source = 'assets/enemies/river/Boss/UpperU_Real.png')]
		public static const GUEY_UPPER_REAL_UP:Class;
		
		[Embed(source = 'assets/enemies/river/Boss/LowerD.png')]
		public static const GUEY_LOWER_IMAG_DOWN:Class;
		[Embed(source = 'assets/enemies/river/Boss/LowerU.png')]
		public static const GUEY_LOWER_IMAG_UP:Class;
		
		[Embed(source = 'assets/enemies/river/Boss/LowerD_Real.png')]
		public static const GUEY_LOWER_REAL_DOWN:Class;
		[Embed(source = 'assets/enemies/river/Boss/LowerU_Real.png')]
		public static const GUEY_LOWER_REAL_UP:Class;
		
		[Embed(source = 'assets/enemies/river/Boss/TailD.png')]
		public static const GUEY_TAIL_IMAG_DOWN:Class;
		[Embed(source = 'assets/enemies/river/Boss/TailU.png')]
		public static const GUEY_TAIL_IMAG_UP:Class;
		
		[Embed(source = 'assets/enemies/river/Boss/TailD_Real.png')]
		public static const GUEY_TAIL_REAL_DOWN:Class;
		[Embed(source = 'assets/enemies/river/Boss/TailU_Real.png')]
		public static const GUEY_TAIL_REAL_UP:Class;
			
		//FLOWER ENEMIES
		[Embed(source = 'assets/enemies/flower/Hummingbird_I.png')]
		public static const B_HBIRD_IMAG:Class;
		[Embed(source = 'assets/enemies/flower/Hummingbird_R.png')]
		public static const B_HBIRD_REAL:Class;
		[Embed(source = 'assets/enemies/flower/Jet.png')]
		public static const B_JET_IMAG:Class;
		[Embed(source = 'assets/enemies/flower/JetReal.png')]
		public static const B_JET_REAL:Class;
		[Embed(source = 'assets/enemies/flower/PointThrush.png')]
		public static const B_PTHRUSH_IMAG:Class;
		[Embed(source = 'assets/enemies/flower/PointThrush_Real.png')]
		public static const B_PTHRUSH_REAL:Class;
		[Embed(source = 'assets/enemies/flower/ThreeFlower.png')]
		public static const B_FLOWER_IMAG:Class;
		[Embed(source = 'assets/enemies/flower/ThreeFlower_Real.png')]
		public static const B_FLOWER_REAL:Class
		[Embed(source = 'assets/enemies/flower/TwoBeam.png')]
		public static const B_BEAM_IMAG:Class;
		[Embed(source = 'assets/enemies/flower/TwoBeamReal.png')]
		public static const B_BEAM_REAL:Class;
		[Embed(source = 'assets/enemies/flower/FlowerBoss.png')]
		public static const B_FLOWERBOSS:Class;
		
		[Embed(source = 'assets/enemies/flower/boss/huImag.png')]
		public static const B_HU_IMAG:Class;
		[Embed(source = 'assets/enemies/flower/boss/huReal.png')]
		public static const B_HU_REAL:Class;
		
		//FOREST
		[Embed(source = 'assets/enemies/forest/Stick.png')]
		public static const F_STICK_IMAG:Class;
		[Embed(source = 'assets/enemies/forest/Monkey.png')]
		public static const F_MONKEY_IMAG:Class;
		[Embed(source = 'assets/enemies/forest/Monkey_Real.png')]
		public static const F_MONKEY_REAL:Class;
		[Embed(source = 'assets/enemies/forest/ant.png')]
		public static const F_ANT_IMAG:Class;
		[Embed(source = 'assets/enemies/forest/ant_real.png')]
		public static const F_ANT_REAL:Class;
		[Embed(source = 'assets/enemies/forest/scarab.png')]
		public static const F_SCARAB_IMAG:Class;
		[Embed(source = 'assets/enemies/forest/scarab_real.png')]
		public static const F_SCARAB_REAL:Class;
		[Embed(source = 'assets/enemies/forest/Spider_Imag.png')]
		public static const F_SPIDER_IMAG:Class;
		[Embed(source = 'assets/enemies/forest/Spider_Real.png')]
		public static const F_SPIDER_REAL:Class;
		[Embed(source = 'assets/enemies/forest/Enemy_Round.png')]
		public static const F_ROUND_IMAG:Class;
		[Embed(source = 'assets/enemies/forest/Enemy_Round_Real.png')]
		public static const F_ROUND_REAL:Class;
		[Embed(source = 'assets/enemies/forest/thrush_imag.png')]
		public static const F_THRUSH_IMAG:Class;
		[Embed(source = 'assets/enemies/forest/thrush_real.png')]
		public static const F_THRUSH_REAL:Class;
		
		//BOSSES
		[Embed(source = 'assets/enemies/forest/boss/Muon_Strip.png')]
		public static const F_MUON_IMAG:Class;
		[Embed(source = 'assets/enemies/forest/boss/Muon_Strip_Real.png')]
		public static const F_MUON_REAL:Class;
		
		[Embed(source = 'assets/enemies/forest/boss/Tau_Strip.png')]
		public static const F_TAU_IMAG:Class;
		[Embed(source = 'assets/enemies/forest/boss/Tau_Strip_Real.png')]
		public static const F_TAU_REAL:Class;
		
		//CASTLE
		[Embed(source = 'assets/enemies/castle/BowImag.png')]
		public static const C_BOW_IMAG:Class;
		[Embed(source = 'assets/enemies/castle/BowReal.png')]
		public static const C_BOW_REAL:Class;
		
		//BOSS
		[Embed(source = 'assets/enemies/castle/boss/Hero_Strip.png')]
		public static const C_HERO_IMAG:Class;
		[Embed(source = 'assets/enemies/castle/boss/Hero_Strip_real.png')]
		public static const C_HERO_REAL:Class;
		
		[Embed(source = 'assets/enemies/castle/boss/Hero_Hand.png')]
		public static const C_HEROHAND_IMAG:Class;
		[Embed(source = 'assets/enemies/castle/boss/Hero_Hand_real.png')]
		public static const C_HEROHAND_REAL:Class;
		
		//VOID
		
		//BOSS
		[Embed(source = 'assets/enemies/void/boss/Tree_Black.png')]
		public static const V_TREE_IMAG:Class;
		[Embed(source = 'assets/enemies/void/boss/Tree_Color.png')]
		public static const V_TREE_REAL:Class;
		[Embed(source = 'assets/enemies/void/boss/Storyteller_Imag.png')]
		public static const V_STORYTELLER_IMAG:Class;
		[Embed(source = 'assets/enemies/void/boss/Storyteller_Real.png')]
		public static const V_STORYTELLER_REAL:Class;
		[Embed(source = 'assets/enemies/void/boss/Bulb.png')]
		public static const V_BULB:Class;
		[Embed(source = 'assets/enemies/void/boss/gueyfade.png')]
		public static const V_GUEYFADE:Class;
		[Embed(source = 'assets/enemies/void/boss/knife_imag.png')]
		public static const V_KNIFE_IMAG:Class;
		[Embed(source = 'assets/enemies/void/boss/knife_real.png')]
		public static const V_KNIFE_REAL:Class;
		
		// CUTSCENES
		[Embed(source = 'assets/hero/White.png')]
		public static const BOSSFRAME:Class;
		[Embed(source = 'assets/cutscenes/BossFrame.jpg')]
		public static const BOSSFRAME_ALPHA:Class;
		[Embed(source = 'assets/cutscenes/finalFrame.jpg')]
		public static const FINALFRAME:Class;
		[Embed(source = 'assets/cutscenes/finalFrameAlpha.jpg')]
		public static const FINALFRAME_ALPHA:Class;
			public static var bossFrame:BitmapData;
			public static var finalFrame:BitmapData;
		
		[Embed(source = 'assets/cutscenes/EncounterLung.jpg')]
		public static const ENCOUNTERLUNG:Class;
		[Embed(source = 'assets/cutscenes/EncounterGuey.jpg')]
		public static const ENCOUNTERGUEY:Class;
		[Embed(source = 'assets/cutscenes/EncounterMuon.jpg')]
		public static const ENCOUNTERMUON:Class;
		[Embed(source = 'assets/cutscenes/EncounterHu.jpg')]
		public static const ENCOUNTERHU:Class;
		[Embed(source = 'assets/cutscenes/EncounterHero.jpg')]
		public static const ENCOUNTERHERO:Class;
		[Embed(source = 'assets/cutscenes/WorldView.jpg')]
		public static const ENCOUNTERVOID1:Class;
		[Embed(source = 'assets/cutscenes/EncounterVoid2.jpg')]
		public static const ENCOUNTERVOID2:Class;
		
		[Embed(source = 'assets/cutscenes/ClearMountain.jpg')]
		public static const CLEARMOUNTAIN:Class;
		[Embed(source = 'assets/cutscenes/ClearRiver.jpg')]
		public static const CLEARRIVER:Class;
		[Embed(source = 'assets/cutscenes/ClearForest.jpg')]
		public static const CLEARFOREST:Class;
		[Embed(source = 'assets/cutscenes/ClearFlower.jpg')]
		public static const CLEARFLOWER:Class;
		
		[Embed(source = 'assets/cutscenes/IntotheVoid.jpg')]
		public static const CLEARCASTLE:Class;
		
		[Embed(source = 'assets/cutscenes/MuonPlush.jpg')]
		public static const MUONPLUSH:Class;
		[Embed(source = 'assets/cutscenes/TauPlush.jpg')]
		public static const TAUPLUSH:Class;
		[Embed(source = 'assets/cutscenes/LungPlush.jpg')]
		public static const LUNGPLUSH:Class;
		[Embed(source = 'assets/cutscenes/GueyPlush.jpg')]
		public static const GUEYPLUSH:Class;
		[Embed(source = 'assets/cutscenes/HeroPlush.jpg')]
		public static const HEROPLUSH:Class;
		
		[Embed(source = 'assets/cutscenes/Prologue.jpg')]
		public static const PROLOGUE:Class;
		[Embed(source = 'assets/cutscenes/Prologue2.jpg')]
		public static const PROLOGUE2:Class;
		[Embed(source = 'assets/cutscenes/Instructions.jpg')]
		public static const INSTRUCTIONS:Class;
		[Embed(source = 'assets/cutscenes/WorldMapscene.jpg')]
		public static const WMAPSCENE:Class;
		
		
		// WORLDS
		//////////////
		[Embed(source = 'assets/world/Fog.png')]
		public static const FOG:Class;
		[Embed(source = 'assets/world/focusScreen.jpg')]
		public static const FOCUS:Class;
		[Embed(source = 'assets/world/focusScreen2.jpg')]
		public static const FOCUS2:Class;
		[Embed(source = 'assets/world/Shine.jpg')]
		public static const GLARE:Class;
		[Embed(source = 'assets/world/Shine_Alpha.jpg')]
		public static const GLARE_ALPHA:Class;
		
			public static var glare:BitmapData;
		
		//TITLE
		[Embed(source = 'assets/world/title/WorldMap.jpg')]
		public static const WORLDMAP:Class;
		[Embed(source = 'assets/world/title/TitleBack.jpg')]
		public static const TITLE_BACK:Class;
		[Embed(source = 'assets/world/title/DarkBack.jpg')]
		public static const DARK_BACK:Class;
		[Embed(source = 'assets/world/title/Title2.png')]
		public static const TITLE:Class;
		
		[Embed(source = 'assets/world/title/TitleWave00.png')]
		public static const TW00:Class;
		[Embed(source = 'assets/world/title/TitleWave01.png')]
		public static const TW01:Class;
		[Embed(source = 'assets/world/title/TitleWave02.png')]
		public static const TW02:Class;
		[Embed(source = 'assets/world/title/TitleWave03.png')]
		public static const TW03:Class;
		[Embed(source = 'assets/world/title/TitleWave04.png')]
		public static const TW04:Class;
		
			//CASTLE
		[Embed(source = 'assets/world/castle/Castle_Back_Imag.jpg')]
		public static const CASTLE_IMG:Class;
		[Embed(source = 'assets/world/castle/Castle_Back_Real.jpg')]
		public static const CASTLE_REAL:Class;
		[Embed(source = 'assets/world/castle/Castle2.jpg')]
		public static const CASTLE2_IMG:Class;
		[Embed(source = 'assets/world/castle/Castle2_Back_Real.jpg')]
		public static const CASTLE2_REAL:Class;
		
		[Embed(source = 'assets/world/castle/CastleBridge.png')]
		public static const CASTLE_BRIDGE:Class;
		
			//FOREST
		[Embed(source = 'assets/world/forest/Forest_Back.jpg')]
		public static const FOREST_IMG:Class;
		[Embed(source = 'assets/world/forest/Forest_Real.jpg')]
		public static const FOREST_REAL:Class;
		[Embed(source = 'assets/world/forest/Forest_Night.png')]
		public static const FOREST_NIGHT:Class;
	
			//FLOWER
		[Embed(source = 'assets/world/flower/Flower_Bed_Imag.jpg')]
		public static const FLOWERBED_IMG:Class;
		[Embed(source = 'assets/world/flower/Flower_Bed.jpg')]
		public static const FLOWERBED_REAL:Class;
		[Embed(source = 'assets/world/flower/Burned.jpg')]
		public static const BURNED:Class;
		[Embed(source = 'assets/world/flower/Burn_Overlay.png')]
		public static const BURN_OVERLAY:Class;
		
			//RIVER
		[Embed(source = 'assets/world/river/River_Imag_NoIce.jpg')]
		public static const RIVER_IMG:Class;
		[Embed(source = 'assets/world/river/River_Real.jpg')]
		public static const RIVER_REAL:Class;
		[Embed(source = 'assets/world/river/River_Imagination.jpg')]
		public static const RIVER_IMG_ICE:Class;
		[Embed(source = 'assets/world/river/River_Real_Iced.jpg')]
		public static const RIVER_REAL_ICE:Class;
		[Embed(source = 'assets/world/river/River_Ice_Alpha.jpg')]
		public static const RIVER_ICE:Class;
		[Embed(source = 'assets/world/river/River_Ice_Alpha.jpg')]
		public static const RIVER_ICE_ALPHA:Class;
		
		public static var riverIce:BitmapData;
		
			//MOUNTAIN
		[Embed(source = 'assets/world/mountain/Mountains_Back.jpg')]
		public static const MOUNTAINS_IMG:Class;
		[Embed(source = 'assets/world/mountain/Mountains_Back_Colored.jpg')]
		public static const MOUNTAINS_REAL:Class;
		
		[Embed(source = 'assets/world/mountain/EnterCave.jpg')]
		public static const CAVE:Class;
		[Embed(source = 'assets/world/mountain/EnterCave_Alpha.jpg')]
		public static const CAVE_ALPHA:Class;
			
			public static var cave:BitmapData;
			
		[Embed(source = 'assets/world/mountain/Cave.jpg')]
		public static const INSIDECAVE_REAL:Class;
		[Embed(source = 'assets/world/mountain/CaveImagination.jpg')]
		public static const INSIDECAVE_IMAG:Class;
		[Embed(source = 'assets/world/mountain/Cave_Alpha.jpg')]
		public static const INSIDECAVE_REAL_ALPHA:Class;
		[Embed(source = 'assets/world/mountain/Cave_Alpha.jpg')]
		public static const INSIDECAVE_IMAG_ALPHA:Class;
		
			public static var insideCaveReal:BitmapData;
			public static var insideCaveImag:BitmapData;
		
		[Embed(source = 'assets/world/mountain/Sunset-Imagination.jpg')]
		public static const SUNSET:Class;
		[Embed(source = 'assets/world/mountain/Sunset-Reality.jpg')]
		public static const SUNSETR:Class;
		[Embed(source = 'assets/world/Transition.jpg')]
		public static const TRANS:Class;
		[Embed(source = 'assets/world/TransitionAlpha.jpg')]
		public static const TRANSALPHA:Class;
		
			public static var transition:BitmapData;
			
		//ENDING / CREDITS
		[Embed(source = 'assets/world/credits/1.png')]
		public static const CREDITS1:Class;
		[Embed(source = 'assets/world/credits/credits.png')]
		public static const CREDITS2:Class;
		[Embed(source = 'assets/cutscenes/Ending1.jpg')]
		public static const END1:Class;
		[Embed(source = 'assets/cutscenes/Ending2.jpg')]
		public static const END2:Class;
		[Embed(source = 'assets/cutscenes/Fin.jpg')]
		public static const END3:Class;
		
		public function Assets()
		{
			
		}
		
		public static function init():void
		{
			crack = Assets.merge(Assets.CRACK, Assets.CRACK_ALPHA);
			
			lungImag = Assets.merge(Assets.LUNGIMAG, Assets.LUNGIMAG_ALPHA);
			lungReal = Assets.merge(Assets.LUNGREAL, Assets.LUNGREAL_ALPHA);
			
			bossFrame = Assets.merge(Assets.BOSSFRAME, Assets.BOSSFRAME_ALPHA);
			finalFrame = Assets.merge(Assets.FINALFRAME, 
				Assets.FINALFRAME_ALPHA);
			
			glare = Assets.merge(Assets.GLARE, Assets.GLARE_ALPHA);
			fireAnim = Assets.merge(Assets.FIRE, Assets.FIRE_ALPHA);
			explodeReal = Assets.merge(Assets.EXPLODE, Assets.EXPLODE_ALPHA);
			explodeBlue = Assets.merge(Assets.EXPLODE_BLUE, 
				Assets.EXPLODE_BLUE_ALPHA);
			
			cave = Assets.merge(Assets.CAVE, Assets.CAVE_ALPHA);
			
			insideCaveReal = Assets.merge(Assets.INSIDECAVE_REAL, 
				Assets.INSIDECAVE_REAL_ALPHA);
			insideCaveImag = Assets.merge(Assets.INSIDECAVE_IMAG, 
				Assets.INSIDECAVE_IMAG_ALPHA);
			
			transition = Assets.merge(Assets.TRANS, Assets.TRANSALPHA);
			
			riverIce = Assets.merge(Assets.RIVER_ICE, Assets.RIVER_ICE_ALPHA);
		}
		
		/**
		 * Transforms two jpg classes (one solid, one alpha) into a 
		 * BitmapData with transparency.
		 * @param	s	The embedded solid image class
		 * @param	a	the embedded alpha mask class
		 * @return	BitmapData that is the simluated png
		 */
		public static function merge(s:Class, a:Class):BitmapData
		{
			var solid:BitmapData = FP.getBitmap(s);
			var alpha:BitmapData = FP.getBitmap(a);
			var destPoint:Point = new Point(0, 0);
			var mergeBmp:BitmapData = 
				new BitmapData(solid.width, solid.height, true, 0);
			
			mergeBmp.copyChannel(alpha, alpha.rect, destPoint, 
				BitmapDataChannel.BLUE, BitmapDataChannel.ALPHA);
			mergeBmp.merge(solid, solid.rect, destPoint, 255, 255, 255, 0);
			
			solid.dispose();
			alpha.dispose();

			return mergeBmp;
		}
	}
}