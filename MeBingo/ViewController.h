//
//  ViewController.h
//  MeBingo
//
//  Created by Anthony Yanto on 3/3/13.
//  Copyright (c) 2013 Anthony Yanto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>
#import "GameCenterManager.h"
#import "AppSpecificValues.h"

@interface ViewController : UIViewController<UIActionSheetDelegate,GKLeaderboardViewControllerDelegate, GKAchievementViewControllerDelegate, GameCenterManagerDelegate>{
    
    GameCenterManager *gameCenterManager;
	int64_t  currentScore;
	NSString* currentLeaderBoard;
	IBOutlet UILabel *currentScoreLabel;
}

@property(nonatomic, strong) IBOutlet UIButton *playGameButton;
@property (nonatomic, retain) GameCenterManager *gameCenterManager;
@property (nonatomic, assign) int64_t currentScore;
@property (nonatomic, retain) NSString* currentLeaderBoard;
@property (nonatomic, retain) UILabel *currentScoreLabel;
- (IBAction) reset;
- (IBAction) showLeaderboard;
- (IBAction) showAchievements;
- (IBAction) submitScore;
- (IBAction) increaseScore;
- (void) checkAchievements;

@end
