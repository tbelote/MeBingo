//
//  MeBingoTests.m
//  MeBingoTests
//
//  Created by Thomas Belote on 8/12/13.
//  Copyright (c) 2013 Thomas Belote. All rights reserved.
//

#import "MeBingoTests.h"

#import "ViewController.h"
#import "SelectGamePlayViewController.h"
#import "GamePlayViewController.h"
#import "WordGamePlayViewController.h"
#import "SelectLanguageViewController.h"
#import "PictureBingoGameViewController.h"
#import "PrintPhotoViewController.h"

@implementation MeBingoTests

- (void)setUp
{
    [super setUp];
    appDelegate = [[UIApplication sharedApplication] delegate];
    STAssertNotNil(appDelegate, @"Could not initialize app delegate");
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testHome
{
    ViewController *v = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    STAssertNotNil(v, @"HomeViewController nil");
    [v loadView];
    [v viewDidLoad];
    [v viewDidAppear:YES];
    [v playGameIsClicked:[v playGameButton]];
    [v printCard:nil];
}

@end
