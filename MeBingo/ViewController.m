//
//  ViewController.m
//  MeBingo
//
//  Created by Anthony Yanto on 3/3/13.
//  Copyright (c) 2013 Anthony Yanto. All rights reserved.
//

#import "ViewController.h"
#import "SelectGamePlayViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize playGameButton;

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

-(IBAction)playGameIsClciked:(id)sender{
    SelectGamePlayViewController *selectGamePlay = [[SelectGamePlayViewController alloc] initWithNibName:@"SelectGamePlayViewController" bundle:nil];
    [self.navigationController pushViewController:selectGamePlay animated:YES];
}


@end
