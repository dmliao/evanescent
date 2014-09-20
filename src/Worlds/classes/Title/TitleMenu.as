package Worlds.classes.Title
{
	import DryErase.Cutscenes.FadeText;
	import DryErase.Cutscenes.scenes.PrologueScene;
	import DryErase.HUD.ControlsGUI;
	
	import Worlds.classes.CutsceneWorld;
	import Worlds.classes.Endless;
	import Worlds.classes.Tutorial;
	
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.BmpFont;
	import net.flashpunk.graphics.BmpText;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class TitleMenu extends Entity
	{
		
		static public var currentMenu:Number = 0;
			//0 is before start
			//1 is main menu
			//2 is options menu
				//3 is confirm erase menu

		
		public var currentSelected:Number = 0;
		
		public var worldMap:WorldMap = new WorldMap();
		
		public var endlessScore:Text = new Text("",0,0);
		
		//individual buttons
		
		//For menu 1
		public var playButton:MenuButton = new MenuButton("Story Mode");
		public var freeButton:MenuButton = new MenuButton("Arcade Mode");
		public var galleryButton:MenuButton = new MenuButton("Arcade Mode");
		public var optionsButton:MenuButton = new MenuButton("Options");
		
		//For menu 2
		public var editControlsButton:MenuButton = new MenuButton("Edit Controls");
		public var musicVolumeButton:MenuButton = new MenuButton("Music On");
		public var sfxVolumeButton:MenuButton = new MenuButton("Sound Effects On");
		public var deleteButton:MenuButton = new MenuButton("Delete Saved Data");
		
		//For menu 3
		public var deleteBlurb:FadeText = new FadeText("Are you sure you want to delete saved data?", false, 320, 240, false);
		
		public var cancelDeleteButton:MenuButton = new MenuButton("Cancel");
		public var confirmDeleteButton:MenuButton = new MenuButton("Confirm Delete");
		
		public var deletedBlurb:FadeText = new FadeText("Saved Data Deleted", false, 320,240,false);
		
		//Button position variables
		public var buttonsPosX:Number = 320;
		public var buttonsStartPos:Number = 256;
		public var buttonsSep:Number = 32;
		
		public var showSplash:Number = 0;
		
		//Menu variables
		public var menuTimer:Number = 0;
		public var restartTimer:Number = 0;
		
		//goto world flags
		public var worldmapFlag:Boolean = false;
		public var endlessFlag:Boolean = false;
		public var galleryFlag:Boolean = false;
		public var musicGalleryFlag:Boolean = false;
		public var controlsFlag:Boolean = false;
	
		//button visibilities
		static public var superVisible:Boolean = true;
		
		//start button
		public var startBlurb:FadeText;
		
		public var controlsGUI:ControlsGUI = new ControlsGUI();
		public var menuControls:MenuControls = new MenuControls();
		
		private var activate:Boolean = false;
		
		public var bCut:Tutorial = new Tutorial();
		public var cont:CutsceneWorld = new CutsceneWorld(new ControlsEditing(),false);
		public var gall:WorldMap = new WorldMap();
		public var end:Endless = new Endless();
		public function TitleMenu()
		{
			
			layer = 0;
			//Main.loadPreferences();
			if (SoundManager.volumeMusic == 0)
			{
				musicVolumeButton.text = "Music Off";
			}
			else
			{
				musicVolumeButton.text = "Music On";
			}
			if (SoundManager.volumeSound == 0)
			{
				sfxVolumeButton.text = "Sound Effects Off";
			}
			else
			{
				sfxVolumeButton.text = "Sound Effects On";
			}
			transImage.alpha = 0;
			endlessScore = new Text("");
			endlessScore.centerOO();
			
		}
		
		override public function update():void
		{
			if (activate == false)
			{
			//	FP.world.add(controlsGUI);
				FP.world.add(deleteBlurb);
				FP.world.add(deletedBlurb);
				FP.world.add(menuControls);
				activate = true;
				endlessScore = new Text("Endless Mode High Score: " + String(Main.endlessScore), 0, 0);
				endlessScore.color = 0x000000;
				endlessScore.size = 10;
				endlessScore.font = "mainFont";
				endlessScore.alpha = 0;
				endlessScore.align = "center";
				endlessScore.centerOO();
			}
			menuTimer -= FP.elapsed;
			restartTimer += FP.elapsed;
			
			showSplash += FP.elapsed;
			if (showSplash >= 2 && showSplash <= 5)
			{
				startBlurb = new FadeText("Press " + Key.name(Input.keys("start")[0]), false, 320, 360, true);
				FP.world.add(startBlurb);
				showSplash = 6;
			}
			
			if (restartTimer > 2)
			{
				//restart game
				
			}
			
			//update all the buttons
			playButton.update();
			freeButton.update();
			galleryButton.update();
			optionsButton.update();
			
			editControlsButton.update();
			musicVolumeButton.update();
			sfxVolumeButton.update();
			deleteButton.update();
			
			confirmDeleteButton.update();
			cancelDeleteButton.update();
			
			//GOTO WORLDS
			if (worldmapFlag == true)
			{
				if (Main.introPassed == false)
				{
					SoundManager.currentMusic = SoundManager.musicAwaken;
					transitionTo(bCut);
				}
				else
				{
					transitionTo(worldMap);
				}
			}
			if (endlessFlag == true)
			{
				SoundManager.currentMusic = SoundManager.musicDreams;
				transitionTo(end);
			}
			if (controlsFlag == true)
			{
				transitionTo(cont);
			}if (galleryFlag == true)
			{
				transitionTo(gall);
			}
			
			//Key button selection to the menu selection
			switch (currentSelected)
			{
				case 0:
				{
					playButton.selected = true;
					freeButton.selected = false;
					galleryButton.selected = false;
					optionsButton.selected = false;
					
					musicVolumeButton.selected = true;
					sfxVolumeButton.selected = false;
					editControlsButton.selected = false;
					deleteButton.selected = false;
					
					confirmDeleteButton.selected = false;
					cancelDeleteButton.selected = true;
					endlessScore.alpha = 0;
				}
				break;
				
				case 1:
				{
					playButton.selected = false;
					freeButton.selected = true;
					galleryButton.selected = false;
					optionsButton.selected = false;
					
					musicVolumeButton.selected = false;
					sfxVolumeButton.selected = true;
					editControlsButton.selected = false;
					deleteButton.selected = false;
					confirmDeleteButton.selected = true;
					cancelDeleteButton.selected = false;
					
					if (currentMenu == 1)
					{
						endlessScore.alpha = 1;
					}
				}
				break;
				
				case 2:
				{
					playButton.selected = false;
					freeButton.selected = false;
					optionsButton.selected = true;
					
					musicVolumeButton.selected = false;
					sfxVolumeButton.selected = false;
					editControlsButton.selected = true;
					deleteButton.selected = false;
					endlessScore.alpha = 0;
				}
				break;
				
				case 3:
				{
					playButton.selected = false;
					freeButton.selected = false;
					galleryButton.selected = false;
					optionsButton.selected = true;
					
					musicVolumeButton.selected = false;
					sfxVolumeButton.selected = false;
					editControlsButton.selected = false;
					deleteButton.selected = true;
					endlessScore.alpha = 0;
				}
				break;
			}
			
			//Move up and down the menus
			switch (currentMenu)
			{
				case 0:
				{
					controlsGUI.isOnScreen = true;
					menuControls.active2 = false;
					if (showSplash > 5)
					{
						startBlurb.fadeIn();
					}
					deleteBlurb.fadeOut();
					deletedBlurb.fadeOut(0.01);
				}break;
			
				case 1:
				{
					controlsGUI.isOnScreen = false;
					menuControls.active2 = true;
					if (showSplash > 5)
					{
						startBlurb.fadeOut();
					}
					deleteBlurb.fadeOut();
					deletedBlurb.fadeOut(0.01);
					if (Input.pressed("up") && !Input.pressed("down"))
					{
						selectUp(3);
					}
					if (Input.pressed("down") && !Input.pressed("up"))
					{
						selectDown(3);
					}
				}break;
				
				case 2:
				{
					controlsGUI.isOnScreen = false;
					menuControls.active2 = true;
					if (showSplash > 5)
					{
						startBlurb.fadeOut();
					}
					deleteBlurb.fadeOut();
					deletedBlurb.fadeOut(0.01);
					if (Input.pressed("up") && !Input.pressed("down"))
					{
						selectUp(4);
					}
					if (Input.pressed("down") && !Input.pressed("up"))
					{
						selectDown(4);
					}
				}break;
				case 3:
				{
					controlsGUI.isOnScreen = false;
					menuControls.active2 = true;
					if (showSplash > 5)
					{
						startBlurb.fadeOut();
					}
					deleteBlurb.fadeIn();
					if (Input.pressed("up") && !Input.pressed("down"))
					{
						selectUp(2);
					}
					if (Input.pressed("down") && !Input.pressed("up"))
					{
						selectDown(2);
					}
				}break;
			}
			
			//Handling confirmation key
			if (Input.pressed("confirm") && menuTimer < 0)
			{
				if (currentMenu!= 0 || Input.pressed("start"))
				{
				SoundManager.playSound(SoundManager.SFX_CONFIRM);
				}
				switch (currentMenu)
				{
					case 0:
					{
						//do nothing for the title screen...handled below
					}
					break;
					case 1:
					{
						if (playButton.selected == true)
						{
							Main.isArcade = false;
							//transition to game world
							if (Main.introPassed == false)
							{
								playButton = new MenuButton("Let the story begin...");
							}
							else
							{
								playButton = new MenuButton("Welcome back.");
							}
							playButton.centerOO();
							menuTimer = 5;
							worldmapFlag = true;
						}
						if (freeButton.selected == true)
						{
							freeButton = new MenuButton("Everlasting Dreams");
							freeButton.centerOO();
							menuTimer = 5;
							endlessFlag = true;
						}
						if (galleryButton.selected == true)
						{
							if (Main.storyCleared)
							{
								menuTimer = 5;
								galleryFlag = true;
								Main.isArcade = true;
							}
							else
							{
								menuTimer = 0.25;
								galleryButton = new MenuButton("Clear Story to Unlock");
							}
						}
						if (optionsButton.selected == true)
						{
							menuTimer = 0.5;
							currentSelected = 0;
							currentMenu = 2;
						}
					}break;
					case 2:
					{
						if (musicVolumeButton.selected == true)
						{
							menuTimer = 0.5;
							if (SoundManager.volumeMusic > 0)
							{
								SoundManager.volumeMusic = 0;
								SoundManager.currentMusic.volume = SoundManager.volumeMusic;
							}
							else
							{
								SoundManager.volumeMusic = 0.5;
								SoundManager.currentMusic.volume = SoundManager.volumeMusic;
							}
							if (SoundManager.volumeMusic == 0)
							{
								musicVolumeButton.text = "Music Off";
							}
							else
							{
								musicVolumeButton.text = "Music On";
							}
							Main.savePreferences();
						}
						if (sfxVolumeButton.selected == true)
						{
							menuTimer = 0.5;
							if (SoundManager.volumeSound > 0)
							{
								SoundManager.volumeSound = 0;
							}
							else
							{
								SoundManager.volumeSound = 0.5;
							}
							if (SoundManager.volumeSound == 0)
							{
								sfxVolumeButton.text = "Sound Effects Off";
							}
							else
							{
								sfxVolumeButton.text = "Sound Effects On";
							}
							Main.savePreferences();
						}
						if (editControlsButton.selected == true)
						{
							menuTimer = 5;
							controlsFlag = true;
						}
						if (deleteButton.selected == true)
						{
							menuTimer = 0.5;
							currentSelected = 0;
							currentMenu = 3;
						}
					}break;
					case 3:
					{
						if (cancelDeleteButton.selected == true)
						{
							menuTimer = 0.5;
							currentSelected = 0;
							currentMenu = 1;
						}
						if (confirmDeleteButton.selected == true)
						{
							menuTimer = 0.5;
							currentSelected = 0;
							currentMenu = 0;
							Main.deleteGame();
							deletedBlurb.fadeIn(1);
							Utils.flash.start(0xFFFFFF,1,1);
						}
					}break;
				}
			}
			
			//Handling back key
			if (Input.pressed("special") && menuTimer < 0)
			{
				switch (currentMenu)
				{
					case 0:
					{
						//do nothing
					}
						break;
					case 1:
					{
						currentMenu = 0;
						menuTimer =0.5;
					}
						break;
					case 2:
					{
						Main.savePreferences();
						currentMenu = 1;
						menuTimer = 0.5;
					}
						break;
					case 3:
					{
						currentMenu = 2;
						menuTimer = 0.5;
					}
						break;
				}
			}
			
			//Handling the very first screen
			if (Input.pressed("start") && menuTimer < 0)
			{
				if (currentMenu == 0)
				{
						SoundManager.playSound(SoundManager.SFX_CONFIRM);
						currentMenu = 1;
						menuTimer = 0.5;
				
				}
			}	
		}
			
		override public function render():void
		{
			switch (currentMenu)
			{
				case 0:
				{
					
				}break;
				case 1:
				{
					playButton.render(FP.buffer, new Point(buttonsPosX,buttonsStartPos), FP.camera);
					freeButton.render(FP.buffer, new Point(buttonsPosX,buttonsStartPos + buttonsSep), FP.camera);
				//	galleryButton.render(FP.buffer, new Point(buttonsPosX,buttonsStartPos + buttonsSep*2), FP.camera);
					optionsButton.render(FP.buffer, new Point(buttonsPosX,buttonsStartPos + buttonsSep*2),FP.camera);
					endlessScore.render(FP.buffer,new Point(320,462), FP.camera);
				}break;
				case 2:
				{
					musicVolumeButton.render(FP.buffer, new Point(buttonsPosX,buttonsStartPos), FP.camera);
					sfxVolumeButton.render(FP.buffer, new Point(buttonsPosX,buttonsStartPos + buttonsSep), FP.camera);
					editControlsButton.render(FP.buffer, new Point(buttonsPosX,buttonsStartPos + buttonsSep*2), FP.camera);
					deleteButton.render(FP.buffer, new Point(buttonsPosX,buttonsStartPos + buttonsSep*3),FP.camera);
				}break;
				case 3:
				{
					cancelDeleteButton.render(FP.buffer, new Point(buttonsPosX,buttonsStartPos+buttonsSep*2), FP.camera);
					confirmDeleteButton.render(FP.buffer, new Point(buttonsPosX,buttonsStartPos+buttonsSep*3), FP.camera);
				}
			}
			
			transImage.render(FP.buffer, new Point(0,0), FP.camera);
			
		}
		
		public function selectUp(NumberofChoices:Number):void
		{
			SoundManager.playSound(SoundManager.SFX_TEXTBOX);
			if (currentSelected == 0)
			{
				currentSelected = NumberofChoices - 1;
			}
			else
			{
				currentSelected -= 1;
			}
		}
		public function selectDown(NumberofChoices:Number):void
		{
			SoundManager.playSound(SoundManager.SFX_TEXTBOX);
			if (currentSelected == NumberofChoices - 1)
			{
				currentSelected = 0;
			}
			else
			{
				currentSelected += 1;
			}
		}
		
		public var transImage:Image = new Image(Assets.TITLE_BACK);
		
		public var spd:Number = 2;
		public var transFactor:Number = 2;
		public function transitionTo(worldTo:World):void
		{
			spd -= FP.elapsed;
			transImage.alpha = transFactor - spd;
			Title.titleImage.alpha = 1 - transImage.alpha;
			if (spd <= 0)
			{
				FP.world = worldTo;
			}
		}
	}
}