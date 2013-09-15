//
//  SelectLanguageViewController.m
//  MeBingo
//
//  Created by Anthony Yanto on 3/10/13.
//  Copyright (c) 2013 Thomas Belote. Attribution-ShareAlike 3.0 http://creativecommons.org/licenses/by-sa/3.0/
//

#import "SelectLanguageViewController.h"
#import "WordGamePlayViewController.h"


@interface SelectLanguageViewController ()

@end

@implementation SelectLanguageViewController



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

    self.navigationItem.title = @"Select Language";
    self.navigationItem.leftBarButtonItem.title = @"Back";

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


-(IBAction)languageButtonIsClicked:(id)sender{
    NSString *lang;

    switch ([sender tag]) {
        case 1:
            lang = @"english";
            break;
        case 2:
            lang = @"tagalog";
            break;
        case 3:
            lang = @"spanish";
            break;
        case 4:
            lang = @"french";
            break;
        case 5:
            lang = @"chinese";
            break;
        case 6:
            lang = @"italian";
            break;
    }

    WordGamePlayViewController *wordGamePlay = [[WordGamePlayViewController alloc] initWithNibName:@"GamePlayViewController" bundle:nil];
    wordGamePlay.language = lang;
    [self.navigationController pushViewController:wordGamePlay animated:YES];
}



#pragma mark Methods that handle rotation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
}

-(void) viewWillAppear:(BOOL)animated{

    self.navigationController.navigationBar.hidden=NO;
}

@end
