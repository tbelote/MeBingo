//
//  ViewController.m
//  MeBingo
//
//  Created by Anthony Yanto on 3/3/13.
//  Copyright (c) 2013 Thomas Belote. Attribution-ShareAlike 3.0 http://creativecommons.org/licenses/by-sa/3.0/
//

#import "ViewController.h"
#import "SelectGamePlayViewController.h"
#import "AppDelegate.h"
#import "PrintPhotoViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize playGameButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //haven't found the right shade of blue yet.
    //self.navigationController.navigationBar.barTintColor =[ UIColor colorWithRed: 0.090 green: 0.337 blue: 0.796 alpha: 1.000 ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma IBOutlet Method

-(IBAction)playGameIsClicked:(id)sender{
    
    SelectGamePlayViewController *selectGamePlay;
    
    if (!ISIPAD) {
        selectGamePlay = [[SelectGamePlayViewController alloc] initWithNibName:@"SelectGamePlayViewController" bundle:nil];
    }else{
        selectGamePlay = [[SelectGamePlayViewController alloc] initWithNibName:@"SelectGamePlayViewController_iPad" bundle:nil];
    }
    [self.navigationController pushViewController:selectGamePlay animated:YES];
}

-(void) viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden=YES;
}

-(IBAction)printCard:(id)sender{
    PrintPhotoViewController *printphoto;
    
    if (!ISIPAD) {
        printphoto = [[PrintPhotoViewController alloc] initWithNibName:@"PrintPhotoViewController" bundle:nil];
        
    }else{
        printphoto = [[PrintPhotoViewController alloc] initWithNibName:@"PrintPhotoViewController_iPad" bundle:nil];
    }
    [self.navigationController pushViewController:printphoto animated:YES];
}
@end
