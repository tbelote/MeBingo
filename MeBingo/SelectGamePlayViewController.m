//
//  SelectGamePlayViewController.m
//  MeBingo
//
//  Created by Anthony Yanto on 3/10/13.
//  Copyright (c) 2013 Thomas Belote. Attribution-ShareAlike 3.0 http://creativecommons.org/licenses/by-sa/3.0/
//

#import "SelectGamePlayViewController.h"
#import "WordGamePlayViewController.h"
#import "SelectLanguageViewController.h"
#import "PictureBingoGameViewController.h"
#import "ViewController.h"

@interface SelectGamePlayViewController ()

@end

@implementation SelectGamePlayViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void) viewWillAppear:(BOOL)animated{

    self.navigationController.navigationBar.hidden=NO;
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.title = @"Select Game";

}

-(void) back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark IBOUtlet Method


-(IBAction)oldTimeBingoGameIsClicked:(id)sender{
    WordGamePlayViewController *wordGamePlay;
    
    if (!ISIPAD) {
        wordGamePlay = [[WordGamePlayViewController alloc] initWithNibName:@"GamePlayViewController" bundle:nil];
    }else{
        wordGamePlay = [[WordGamePlayViewController alloc] initWithNibName:@"GamePlayViewController_iPad" bundle:nil];
    }
    wordGamePlay.language = @"numbers";
    [self.navigationController pushViewController:wordGamePlay animated:YES];
}

-(IBAction)wordBingoGameIsClicked:(id)sender{
    SelectLanguageViewController *selectLanguage;
    
     if (!ISIPAD) {
         selectLanguage = [[SelectLanguageViewController alloc] initWithNibName:@"SelectLanguageViewController" bundle:nil];
     }else{
          selectLanguage = [[SelectLanguageViewController alloc] initWithNibName:@"SelectLanguageViewController_iPad" bundle:nil];
     }
    [self.navigationController pushViewController:selectLanguage animated:YES];
}

-(IBAction)pictureBingoIsClicked:(id)sender{
    
    PictureBingoGameViewController *pictureBingoGame;
    
    if (!ISIPAD) {
        pictureBingoGame = [[PictureBingoGameViewController alloc] initWithNibName:@"GamePlayViewController" bundle:nil];
    }else{
         pictureBingoGame = [[PictureBingoGameViewController alloc] initWithNibName:@"GamePlayViewController_iPad" bundle:nil];
    }
    [self.navigationController pushViewController:pictureBingoGame animated:YES];
}



#pragma mark Methods that handle rotation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
}

@end
