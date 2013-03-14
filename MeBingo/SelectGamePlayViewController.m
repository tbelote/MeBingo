//
//  SelectGamePlayViewController.m
//  MeBingo
//
//  Created by Anthony Yanto on 3/10/13.
//  Copyright (c) 2013 Anthony Yanto. All rights reserved.
//

#import "SelectGamePlayViewController.h"
#import "WordGamePlayViewController.h"
#import "SelectLanguageViewController.h"

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Select Game";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark IBOUtlet Method


-(IBAction)oldTimeBingoGameIsClicked:(id)sender{
    /*GamePlayViewController *gamePlay = [[[GamePlayViewController alloc] initWithNibName:@"GamePlayViewController" bundle:nil] autorelease];
    [self.navigationController pushViewController:gamePlay animated:YES];*/
    
    WordGamePlayViewController *wordGamePlay = [[WordGamePlayViewController alloc] initWithNibName:@"WordGamePlayViewController" bundle:nil];
    wordGamePlay.language = @"numbers";
    [self.navigationController pushViewController:wordGamePlay animated:YES];
}

-(IBAction)wordBingoGameIsClicked:(id)sender{
    SelectLanguageViewController *selectLanguage = [[SelectLanguageViewController alloc] initWithNibName:@"SelectLanguageViewController" bundle:nil];
    [self.navigationController pushViewController:selectLanguage animated:YES];
}

@end
