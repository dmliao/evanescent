package DryErase.Cutscenes
{
	import DryErase.Cutscenes.scenes.B_AfterLevelScene;
	import DryErase.Cutscenes.scenes.C_AfterLevelScene;
	import DryErase.Cutscenes.scenes.F_AfterLevelScene;
	import DryErase.Cutscenes.scenes.M_AfterLevelScene;
	import DryErase.Cutscenes.scenes.R_AfterLevelScene;
	
	import Worlds.GameWorld;
	import Worlds.classes.CutsceneWorld;
	import Worlds.classes.Title.TitleWorld;
	import Worlds.classes.Title.WorldMap;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class ArcadeLevelTally extends Entity
	{
		public var sceneNumber:Number = 0;
		
		//1st: Level Score
		//2nd: Enemies Killed (x10 each)
		//3rd: Longest Streak (x20)
		//4th: Times Lost (-1000 each, +2000 if zero)
		//5th: Final Score
		//6th: Rank (Excellent Good Clear Fail)
		
		private var enKilledScore:Number = 0;
		private var streakScore:Number = 0;
		private var shipsLost:Number = 0;
		
		private var rawScoreText:FadeText;
		private var streakText:FadeText;
		private var shipsLostText:FadeText;
		private var bossDefeatedText:FadeText;
		private var finalScoreText:FadeText;
		private var rankText:FadeText;
		private var newHighScore:FadeText;
		
		private var clickText:FadeText;
		
		private var timer:Number = 0.5;
		
		private var newHighScoreFlag:Boolean = false;
		
		public function ArcadeLevelTally()
		{
			var titleText:Text = new Text("Level Results", 320, 100);
			titleText.font = "mainFont";
			titleText.size = 24;
			titleText.color = 0x000000;
			titleText.centerOO();
			graphic = titleText;
			
			
		}
		
		override public function update():void
		{
			
			timer -= FP.elapsed;
			if (timer <= 0)
			{
				timer = 1;
				switch (sceneNumber)
				{
					case 0:
					{
						clickText = new FadeText("Press " + Key.name(Input.keys("confirm")[0]) + " or " + Key.name(Input.keys("confirm")[1]) + " to continue",true,320,520,false);
						rawScoreText = new FadeText("Level Score: " + String(Main.currentScore), false, 320,200, false);
						FP.world.add(rawScoreText);
						rawScoreText.fadeIn();
						
					}break;
					case 1:
					{
						streakScore = 50*GameWorld.killStreak;
						streakText = new FadeText("Longest Streak: " + String(GameWorld.highestStreak) + " -> +" + streakScore + " points",false,320,240,false);
						FP.world.add(streakText);
						streakText.fadeIn();
						
					}break;
					case 2:
					{
						shipsLost = 1000*GameWorld.timesDied;
						shipsLostText = new FadeText("Times Died: " + String(GameWorld.timesDied) + " -> -" + shipsLost + " points", false, 320,280,false);
						FP.world.add(shipsLostText);
						shipsLostText.fadeIn();
					}break;
					case 3:
					{
						Main.currentScore += streakScore;
						Main.currentScore -= shipsLost;
						finalScoreText = new FadeText("Final Score: " + String(Main.currentScore), false, 320, 320, false);
						FP.world.add(finalScoreText);
						
						finalScoreText.fadeIn();
						
						this.calcHighScore();
						if (newHighScoreFlag == true)
						{
							newHighScore = new FadeText("New High Score!", false, 320, 480, false);
							FP.world.add(newHighScore);
							newHighScore.fadeIn();
						}
					}break;
					case 4:
					{
						if (Main.currentScore < 1000)
						{
							rankText = new FadeText("Ranking: Failure", false, 320, 360, false);
						}
						else if (Main.currentScore < 10000)
						{
							rankText = new FadeText("Ranking: Pass", false, 320, 360, false);
						}
						else if (Main.currentScore < 50000)
						{
							rankText = new FadeText("Ranking: Great", false, 320, 360, false);
						}
						else
						{
							rankText = new FadeText("Ranking: Excellent", false, 320, 360, false);
						}
						FP.world.add(rankText);
						rankText.fadeIn();
					}break;
					case 5:
					{
						if (!clickText.deleted)
						{
							clickText.fadeIn();
						}
						FP.world.add(clickText);
					}break;
					case 6:
					{
						
						finishTally();
					}break;
				}
				if (sceneNumber < 5 || clickText.deleted)
				{
					sceneNumber +=1;
					if (clickText.deleted)
					{
						clickText.deleteOut();
						clickText.fadeOut();
						rankText.fadeOut();
						shipsLostText.fadeOut();
						streakText.fadeOut();
						finalScoreText.fadeOut();
						rawScoreText.fadeOut();
						newHighScore.fadeOut();
					}
				}
			}
			
		}
		
		public function calcHighScore():void
		{
			switch (Main.currentLevel)
			{
				case "mountain":
				{
					if (Main.mountainScore < Main.currentScore)
					{
						//	Main.mountainScore = Main.currentScore;
						newHighScoreFlag = true;
					}
				}break;
				case "endless":
				{
					if (Main.endlessScore < Main.currentScore)
					{
						//	Main.mountainScore = Main.currentScore;
						newHighScoreFlag = true;
					}
				}break;
				case "river":
				{
					if (Main.riverScore < Main.currentScore)
					{
						//	Main.riverScore = Main.currentScore;
						newHighScoreFlag = true;
					}
				}break;	
				case "forest":
				{
					if (Main.forestScore < Main.currentScore)
					{
						//	Main.riverScore = Main.currentScore;
						newHighScoreFlag = true;
					}
				}break;
				case "flower":
				{
					if (Main.flowerScore < Main.currentScore)
					{
						//	Main.riverScore = Main.currentScore;
						newHighScoreFlag = true;
					}
				}break;
				case "castle":
				{
					if (Main.castleScore < Main.currentScore)
					{
						//	Main.riverScore = Main.currentScore;
						newHighScoreFlag = true;
					}
				}break;
				case "void":
				{
					if (Main.emptyScore < Main.currentScore)
					{
						//	Main.riverScore = Main.currentScore;
						newHighScoreFlag = true;
					}
				}break;
			}
		}
		public function finishTally():void
		{
			if (Main.currentLevel == "mountain")
			{
				if (Main.mountainScore < Main.currentScore)
				{
					Main.mountainScore = Main.currentScore;
					newHighScoreFlag = true;
					FP.world = new WorldMap();
					Main.saveGame();
				}
				else
				{
					FP.world = new WorldMap();
				}
				
				
				
			}
			else if (Main.currentLevel == "river")
			{
				if (Main.riverScore < Main.currentScore)
				{
					Main.riverScore = Main.currentScore;
					newHighScoreFlag = true;
					FP.world = new WorldMap();
					Main.saveGame();
				}
				else
				{
					FP.world = new WorldMap();
				}
			}
				
			else if (Main.currentLevel == "forest")
			{
				if (Main.forestScore < Main.currentScore)
				{
					Main.forestScore = Main.currentScore;
					newHighScoreFlag = true;
					FP.world = new WorldMap();
					Main.saveGame();
				}
				else
				{
					FP.world = new WorldMap();
				}
			}
				
			else if (Main.currentLevel == "flower")
			{
				if (Main.flowerScore < Main.currentScore)
				{
					Main.flowerScore = Main.currentScore;
					newHighScoreFlag = true;
					FP.world = new WorldMap();
					Main.saveGame();
				}
				else
				{
					FP.world = new WorldMap();
				}
			}
			else if (Main.currentLevel == "castle")
			{
				if (Main.castleScore < Main.currentScore)
				{
					Main.castleScore = Main.currentScore;
					newHighScoreFlag = true;
					FP.world = new WorldMap();
					Main.saveGame();
				}
				else
				{
					FP.world = new WorldMap();
				}
			}
			else if (Main.currentLevel == "void")
			{
				if (Main.emptyScore < Main.currentScore)
				{
					Main.emptyScore = Main.currentScore;
					newHighScoreFlag = true;
					FP.world = new WorldMap();
					Main.saveGame();
				}
				else
				{
					FP.world = new WorldMap();
				}
			}
			
			else
			{
				FP.world.removeAll();
				FP.world = new WorldMap();
			}
			
			
		}
	}
}