//
//  GamePlayViewController.m
//  MeBingo
//
//  Created by Anthony Yanto on 3/3/13.
//  Copyright (c) 2013 Anthony Yanto. All rights reserved.
//

#import "GamePlayViewController.h"

@interface GamePlayViewController (){
    NSMutableArray *bNumbers, *iNumbers, *nNumbers, *gNumbers, *oNumbers;
    NSMutableArray *resultNumber;
    
    NSTimer *timer;
    
    bool shouldRestartGame;
}

@end

@implementation GamePlayViewController

@synthesize displayLabel;
@synthesize b1Button, b2Button, b3Button, b4Button, b5Button;
@synthesize i1Button, i2Button, i3Button, i4Button, i5Button;
@synthesize n1Button, n2Button, n3Button, n4Button, n5Button;
@synthesize g1Button, g2Button, g3Button, g4Button, g5Button;
@synthesize o1Button, o2Button, o3Button, o4Button, o5Button;

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
    
    resultNumber = [[NSMutableArray alloc] init];
    bNumbers = [[NSMutableArray alloc] init];
    iNumbers = [[NSMutableArray alloc] init];
    nNumbers = [[NSMutableArray alloc] init];
    gNumbers = [[NSMutableArray alloc] init];
    oNumbers = [[NSMutableArray alloc] init];
    
    [self getBNumbers];
    [self getINumbers];
    [self getNNumbers];
    [self getGNumbers];
    [self getONumbers];
    
    shouldRestartGame = FALSE;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma IBOutlet Methods

-(IBAction)playButtonIsClicked:(id)sender{
    
    if (shouldRestartGame) {
        displayLabel.text = @"";
        
        [resultNumber removeAllObjects];
        [bNumbers removeAllObjects];
        [iNumbers removeAllObjects];
        [nNumbers removeAllObjects];
        [gNumbers removeAllObjects];
        [oNumbers removeAllObjects];
        
        [self getBNumbers];
        [self getINumbers];
        [self getNNumbers];
        [self getGNumbers];
        [self getONumbers];
    }
    
    [self updateTime];
    timer=  [NSTimer scheduledTimerWithTimeInterval:4.0 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
}

-(IBAction)pauseButtonIsClicked:(id)sender{
    [timer invalidate];
}

- (IBAction)checkButtonWithGeneratedNumber:(id)sender{
    
    UIButton *button = sender;
    NSLog(@"%@", [button titleForState:UIControlStateNormal]);
    NSLog(@"%@", resultNumber);
    NSString  *buttonTitle = [button titleForState:UIControlStateNormal];
    if ([resultNumber containsObject:[NSNumber numberWithInt:[buttonTitle intValue]]]) {
        button.backgroundColor = [UIColor yellowColor];
    }else{
        [UIView animateWithDuration:1.0
                              delay:1.0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^ {
                             button.backgroundColor = [UIColor redColor];
                         }
                         completion:^(BOOL finished) {
                             button.backgroundColor = [UIColor lightGrayColor];
                         }];
    }
}

- (IBAction)bingoButtonIsClicked:(id)sender{
    
    bool hasNoError = FALSE;
    
    //check horizotal
    if ([resultNumber containsObject:[NSNumber numberWithInt:[[b1Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[i1Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[n1Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[g1Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[o1Button titleForState:UIControlStateNormal] intValue]]]) {
        hasNoError = TRUE;
    }
    
    if ([resultNumber containsObject:[NSNumber numberWithInt:[[b2Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[i2Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[n2Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[g2Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[o2Button titleForState:UIControlStateNormal] intValue]]]) {
        hasNoError = TRUE;
    }
    
    if ([resultNumber containsObject:[NSNumber numberWithInt:[[b3Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[i3Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[g3Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[o3Button titleForState:UIControlStateNormal] intValue]]]) {
        hasNoError = TRUE;
    }
    
    if ([resultNumber containsObject:[NSNumber numberWithInt:[[b4Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[i4Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[n4Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[g4Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[o4Button titleForState:UIControlStateNormal] intValue]]]) {
        hasNoError = TRUE;
    }
    
    if ([resultNumber containsObject:[NSNumber numberWithInt:[[b5Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[i5Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[n5Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[g5Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[o5Button titleForState:UIControlStateNormal] intValue]]]) {
        hasNoError = TRUE;
    }
    
    //vertical
    if ([resultNumber containsObject:[NSNumber numberWithInt:[[b1Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[b2Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[b3Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[b4Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[b5Button titleForState:UIControlStateNormal] intValue]]]) {
        hasNoError = TRUE;
    }
    
    if ([resultNumber containsObject:[NSNumber numberWithInt:[[i1Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[i2Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[i3Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[i4Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[i5Button titleForState:UIControlStateNormal] intValue]]]) {
        hasNoError = TRUE;
    }
    
    if ([resultNumber containsObject:[NSNumber numberWithInt:[[n1Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[n2Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[n4Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[n5Button titleForState:UIControlStateNormal] intValue]]]) {
        hasNoError = TRUE;
    }
    
    if ([resultNumber containsObject:[NSNumber numberWithInt:[[g1Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[g2Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[g3Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[g4Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[g5Button titleForState:UIControlStateNormal] intValue]]]) {
        hasNoError = TRUE;
    }
    
    //diagonal
    if ([resultNumber containsObject:[NSNumber numberWithInt:[[b1Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[i2Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[g4Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[o5Button titleForState:UIControlStateNormal] intValue]]]) {
        hasNoError = TRUE;
    }
    
    if ([resultNumber containsObject:[NSNumber numberWithInt:[[b5Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[i4Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[g2Button titleForState:UIControlStateNormal] intValue]]] &&
        [resultNumber containsObject:[NSNumber numberWithInt:[[o1Button titleForState:UIControlStateNormal] intValue]]]) {
        hasNoError = TRUE;
    }
    
    if (hasNoError) {
        [timer invalidate];
        
        shouldRestartGame = TRUE;
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulations!"
                                                        message:@"Thank you for playing BINGO!"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }else{
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry"
                                                        message:@"You didnt have enough numbers in your card for BINGO!"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
    
}

#pragma Private Methods

- (void)updateTime{
    int generatedNumber = [self getRandomNumberBetweenMin:1 andMax:75];
    if ([resultNumber count]!=75) {
        if (![resultNumber containsObject:[NSNumber numberWithInt:generatedNumber]]) {
            NSLog(@"generatedNumber: %i", generatedNumber);
            [resultNumber addObject:[NSNumber numberWithInt:generatedNumber]];
            
            displayLabel.text = [self appendBINGOLetterWithNumber:generatedNumber];
            
            /*[UIView animateWithDuration:3.0
             delay:1.0
             options:UIViewAnimationCurveEaseInOut
             animations:^ {
             displayLabel.text = [NSString stringWithFormat:@"%i", generatedNumber];
             displayLabel.alpha = 0.0;
             }
             completion:^(BOOL finished) {
             displayLabel.alpha = 1.0;
             }];*/
        }else{
            [self updateTime];
        }
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Done!"
                                                        message:@"All possible numbers are selected!"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
}

-(int) getRandomNumberBetweenMin:(int)min andMax:(int)max
{
	return ( (arc4random() % (max-min+1)) + min );
}

-(NSString *) appendBINGOLetterWithNumber:(int)num{
    NSString *returnString = @"";
    if(num>=1 && num<=15) returnString = [NSString stringWithFormat:@"B%i", num];
    if(num>=16 && num<=30) returnString = [NSString stringWithFormat:@"I%i", num];
    if(num>=31 && num<=45) returnString = [NSString stringWithFormat:@"N%i", num];
    if(num>=46 && num<=60) returnString = [NSString stringWithFormat:@"G%i", num];
    if(num>=61 && num<=75) returnString = [NSString stringWithFormat:@"O%i", num];
    return returnString;
}

#pragma Generate Numbers

- (void) getBNumbers{
    int i = 1;
    while(i<6){
        int generatedNumber = [self getRandomNumberBetweenMin:1 andMax:15];
        if (![bNumbers containsObject:[NSNumber numberWithInt:generatedNumber]]) {
            [bNumbers addObject:[NSNumber numberWithInt:generatedNumber]];
            UIButton *button = [[UIButton alloc] init];
            if (i==1) button = b1Button;
            if (i==2) button = b2Button;
            if (i==3) button = b3Button;
            if (i==4) button = b4Button;
            if (i==5) button = b5Button;
            [button setTitle:[NSString stringWithFormat:@"%i", generatedNumber] forState:UIControlStateNormal];
            [button setBackgroundColor:[UIColor lightGrayColor]];
            i++;
        }
    }
}

- (void) getINumbers{
    int i = 0;
    while(i<6){
        int generatedNumber = [self getRandomNumberBetweenMin:16 andMax:30];
        if (![iNumbers containsObject:[NSNumber numberWithInt:generatedNumber]]) {
            [iNumbers addObject:[NSNumber numberWithInt:generatedNumber]];
            UIButton *button = [[UIButton alloc] init];
            if (i==1) button = i1Button;
            if (i==2) button = i2Button;
            if (i==3) button = i3Button;
            if (i==4) button = i4Button;
            if (i==5) button = i5Button;
            [button setTitle:[NSString stringWithFormat:@"%i", generatedNumber] forState:UIControlStateNormal];
            [button setBackgroundColor:[UIColor lightGrayColor]];
            i++;
        }
    }
}

- (void) getNNumbers{
    int i = 0;
    while(i<6){
        int generatedNumber = [self getRandomNumberBetweenMin:31 andMax:45];
        if (![nNumbers containsObject:[NSNumber numberWithInt:generatedNumber]]) {
            [nNumbers addObject:[NSNumber numberWithInt:generatedNumber]];
            UIButton *button = [[UIButton alloc] init];
            if (i==1) button = n1Button;
            if (i==2) button = n2Button;
            if (i==3) button = n3Button;
            if (i==4) button = n4Button;
            if (i==5) button = n5Button;
            [button setTitle:[NSString stringWithFormat:@"%i", generatedNumber] forState:UIControlStateNormal];
            [button setBackgroundColor:[UIColor lightGrayColor]];
            i++;
        }
    }
}

- (void) getGNumbers{
    int i = 0;
    while(i<6){
        int generatedNumber = [self getRandomNumberBetweenMin:46 andMax:60];
        if (![gNumbers containsObject:[NSNumber numberWithInt:generatedNumber]]) {
            [gNumbers addObject:[NSNumber numberWithInt:generatedNumber]];
            UIButton *button = [[UIButton alloc] init];
            if (i==1) button = g1Button;
            if (i==2) button = g2Button;
            if (i==3) button = g3Button;
            if (i==4) button = g4Button;
            if (i==5) button = g5Button;
            [button setTitle:[NSString stringWithFormat:@"%i", generatedNumber] forState:UIControlStateNormal];
            [button setBackgroundColor:[UIColor lightGrayColor]];
            i++;
        }
    }
}

- (void) getONumbers{
    int i = 0;
    while(i<6){
        int generatedNumber = [self getRandomNumberBetweenMin:61 andMax:75];
        if (![oNumbers containsObject:[NSNumber numberWithInt:generatedNumber]]) {
            [oNumbers addObject:[NSNumber numberWithInt:generatedNumber]];
            UIButton *button = [[UIButton alloc] init];
            if (i==1) button = o1Button;
            if (i==2) button = o2Button;
            if (i==3) button = o3Button;
            if (i==4) button = o4Button;
            if (i==5) button = o5Button;
            [button setTitle:[NSString stringWithFormat:@"%i", generatedNumber] forState:UIControlStateNormal];
            [button setBackgroundColor:[UIColor lightGrayColor]];
            i++;
        }
    }
}

@end
