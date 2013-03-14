//
//  SelectLanguageViewController.m
//  MeBingo
//
//  Created by Anthony Yanto on 3/10/13.
//  Copyright (c) 2013 Anthony Yanto. All rights reserved.
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
    
    [self callAppropriateXIB:self.interfaceOrientation];
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
    
    WordGamePlayViewController *wordGamePlay = [[WordGamePlayViewController alloc] initWithNibName:@"WordGamePlayViewController" bundle:nil];
    wordGamePlay.language = lang;
    [self.navigationController pushViewController:wordGamePlay animated:YES];
}


#pragma mark Methods that handle rotation

-(void) callAppropriateXIB:(UIInterfaceOrientation)toInterfaceOrientation{
    
    if( UIInterfaceOrientationIsLandscape(toInterfaceOrientation) )
    {
        [[NSBundle mainBundle] loadNibNamed: [NSString stringWithFormat:@"%@-landscape", NSStringFromClass([self class])]
                                          owner: self
                                        options: nil];
    }
    else
    {
        [[NSBundle mainBundle] loadNibNamed: [NSString stringWithFormat:@"%@", NSStringFromClass([self class])]
                                          owner: self
                                        options: nil];
    }
}

#pragma mark Methods that handle rotation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    [self callAppropriateXIB:interfaceOrientation];
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self callAppropriateXIB:toInterfaceOrientation];
}

@end
