//
//  ViewController.m
//  MeBingo
//
//  Created by Anthony Yanto on 3/3/13.
//  Copyright (c) 2013 Anthony Yanto. All rights reserved.
//

#import "ViewController.h"
#import "SelectGamePlayViewController.h"
#import "AppDelegate.h"
#import "PrintPhotoViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize playGameButton,gameCenterManager,currentLeaderBoard,currentScore,currentScoreLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma IBOutlet Method

-(IBAction)playGameIsClicked:(id)sender{
    SelectGamePlayViewController *selectGamePlay = [[SelectGamePlayViewController alloc] initWithNibName:@"SelectGamePlayViewController" bundle:nil];
    [self.navigationController pushViewController:selectGamePlay animated:YES];
}

-(IBAction)gamecenter:(id)sender{
    
    self.currentLeaderBoard = kEasyLeaderboardID;
    self.currentScore = 0;
    if ([GameCenterManager isGameCenterAvailable]) {
        self.gameCenterManager = [[GameCenterManager alloc] init];
        [self.gameCenterManager setDelegate:self];
        [self.gameCenterManager authenticateLocalUser];
    } else {
        // The current device does not support Game Center.
    }
}

- (IBAction) showLeaderboard
{
    GKLeaderboardViewController *leaderboardController = [[GKLeaderboardViewController alloc] init];
    if (leaderboardController != NULL)
    {
        leaderboardController.category = self.currentLeaderBoard;
        leaderboardController.timeScope = GKLeaderboardTimeScopeWeek;
        leaderboardController.leaderboardDelegate = self;
        [self presentViewController: leaderboardController animated: YES completion:nil];
    }
}
- (void)leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction) showAchievements
{
    GKAchievementViewController *achievements = [[GKAchievementViewController alloc] init];
    if (achievements != NULL)
    {
        achievements.achievementDelegate = self;
        [self presentViewController: achievements animated: YES completion:nil];
    }
}
- (void)achievementViewControllerDidFinish:(GKAchievementViewController *)viewController;
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction) increaseScore
{
    self.currentScore = self.currentScore + 1;
    currentScoreLabel.text = [NSString stringWithFormat: @"%lld", self.currentScore];
    [self checkAchievements];
}

- (void) checkAchievements
{
    NSString* identifier = NULL;
    double percentComplete = 0;
    switch(self.currentScore)
    {
        case 1:
        {
            identifier= kAchievementGotOneTap;
            percentComplete= 100.0;
            break;
        }
        case 5:
        {
            identifier= kAchievementGotOneTap;
            percentComplete= 25.0;
            break;
        }
        case 10:
        {
            identifier= kAchievementGotOneTap;
            percentComplete= 50.0;
            break;
        }
        case 15:
        {
            identifier= kAchievementGotOneTap;
            percentComplete= 75.0;
            break;
        }
        case 20:
        {
            identifier= kAchievementGotOneTap;
            percentComplete= 100.0;
            break;
        }
    }
    if(identifier!= NULL)
    {
        [self.gameCenterManager submitAchievement: identifier percentComplete: percentComplete];
    }
}

- (IBAction) submitScore
{
    if(self.currentScore > 0)
    {
        [self.gameCenterManager reportScore: self.currentScore forCategory: self.currentLeaderBoard];
    }
}

- (IBAction) reset
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Are you sure you want to reset your score and achievements?"
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:@"Reset"
                                                    otherButtonTitles:nil];
    [actionSheet showInView:[self view]];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [gameCenterManager resetAchievements];
        self.currentScore = 0;
        currentScoreLabel.text = [NSString stringWithFormat: @"%lld", self.currentScore];
    }
}

- (void) achievementSubmitted: (GKAchievement*) ach error:(NSError*) error;
{
    if((error == NULL) && (ach != NULL))
    {
        if (ach.percentComplete == 100.0) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Achievement Earned!"
                                                            message:[NSString stringWithFormat:@"%@",ach.identifier]
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
    }
    else
    {
        // Achievement Submission Failed.
    }
}

-(void) viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden=YES;
}

-(IBAction)printCard:(id)sender{
    PrintPhotoViewController *printphoto = [[PrintPhotoViewController alloc] initWithNibName:@"PrintPhotoViewController" bundle:nil];
    [self.navigationController pushViewController:printphoto animated:YES];
}
@end
