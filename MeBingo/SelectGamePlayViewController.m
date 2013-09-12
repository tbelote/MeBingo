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

    WordGamePlayViewController *wordGamePlay = [[WordGamePlayViewController alloc] initWithNibName:@"GamePlayViewController" bundle:nil];
    wordGamePlay.language = @"numbers";
    [self.navigationController pushViewController:wordGamePlay animated:YES];
}

-(IBAction)wordBingoGameIsClicked:(id)sender{
    SelectLanguageViewController *selectLanguage = [[SelectLanguageViewController alloc] initWithNibName:@"SelectLanguageViewController" bundle:nil];
    [self.navigationController pushViewController:selectLanguage animated:YES];
}

-(IBAction)pictureBingoIsClicked:(id)sender{
    PictureBingoGameViewController *pictureBingoGame = [[PictureBingoGameViewController alloc] initWithNibName:@"GamePlayViewController" bundle:nil];
    [self.navigationController pushViewController:pictureBingoGame animated:YES];
}

-(void) callAppropriateXIB:(UIInterfaceOrientation)toInterfaceOrientation{
    //[[NSBundle mainBundle] loadNibNamed: [NSString stringWithFormat:@"%@", NSStringFromClass([self class])]
    //                                      owner: self
    //                                    options: nil];
}

#pragma mark Methods that handle rotation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    //[self callAppropriateXIB:toInterfaceOrientation];
    //[self populateButtonTitleAfterRotation];
}

@end
