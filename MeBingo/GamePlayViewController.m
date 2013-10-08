//
//  GamePlayViewController.m
//  MeBingo
//
//  Created by Anthony Yanto on 3/3/13.
//  Copyright (c) 2013 Thomas Belote. Attribution-ShareAlike 3.0 http://creativecommons.org/licenses/by-sa/3.0/
//

#import "GamePlayViewController.h"

@interface GamePlayViewController (){

    NSTimer *timer;

    bool shouldRestartGame;
}

@end

@implementation GamePlayViewController

@synthesize bingo;
@synthesize resultWord;
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


    if ([UIScreen mainScreen].bounds.size.height < 961.0) {
        self.displayLabel.font = [UIFont boldSystemFontOfSize:74.0];
        self.displayLabel.minimumScaleFactor = 0.4;
    } else {
        self.displayLabel.font = [UIFont boldSystemFontOfSize:80.0];
        self.displayLabel.minimumScaleFactor = 0.1;
    }
    self.displayLabel.adjustsFontSizeToFitWidth = YES;

    self.resultWord = [[NSMutableArray alloc] init];
    bNumbers = [[NSMutableArray alloc] init];
    iNumbers = [[NSMutableArray alloc] init];
    nNumbers = [[NSMutableArray alloc] init];
    gNumbers = [[NSMutableArray alloc] init];
    oNumbers = [[NSMutableArray alloc] init];


    shouldRestartGame = FALSE;
    
    self.navigationItem.leftBarButtonItem.title = @"Back";
}

-(void) back{
    [timer invalidate];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma IBOutlet Methods

-(void)resetGame {
    displayLabel.text = @"";
    [self.resultWord removeAllObjects];
    [bNumbers removeAllObjects];
    [iNumbers removeAllObjects];
    [nNumbers removeAllObjects];
    [gNumbers removeAllObjects];
    [oNumbers removeAllObjects];

}

-(IBAction)playButtonIsClicked:(id)sender{
    UIButton * button = sender;
    if (timer && [timer isValid]) {
        [timer invalidate];
        if(!ISIPAD)
            [button setImage:[UIImage imageNamed:@"Button_Play.png"] forState:UIControlStateNormal];
        else
            [button setImage:[UIImage imageNamed:@"Button_Play@2x.png"] forState:UIControlStateNormal];
    } else {
        if(!ISIPAD)
            [button setImage:[UIImage imageNamed:@"Button_Pause.png"] forState:UIControlStateNormal];
        else
            [button setImage:[UIImage imageNamed:@"Button_Pause@2x.png"] forState:UIControlStateNormal];
        
        if (shouldRestartGame) {
            [self resetGame];
        }
        [self updateTime];
        timer=  [NSTimer scheduledTimerWithTimeInterval:4.5 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    }
}

-(void) pauseGame {
    if (timer && [timer isValid]) {
        [timer invalidate];
    }
}

- (IBAction)checkButtonWithGeneratedNumber:(id)sender{

    UIButton *button = sender;
    if ([self.resultWord containsObject:[NSNumber numberWithInt:button.tag]]) {
        button.enabled = NO;
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
    if ([self.resultWord containsObject:[bNumbers objectAtIndex:0]] &&
        [self.resultWord containsObject:[iNumbers objectAtIndex:0]] &&
        [self.resultWord containsObject:[nNumbers objectAtIndex:0]] &&
        [self.resultWord containsObject:[gNumbers objectAtIndex:0]] &&
        [self.resultWord containsObject:[oNumbers objectAtIndex:0]]) {
        hasNoError = TRUE;
    }

    if ([self.resultWord containsObject:[bNumbers objectAtIndex:1]] &&
        [self.resultWord containsObject:[iNumbers objectAtIndex:1]] &&
        [self.resultWord containsObject:[nNumbers objectAtIndex:1]] &&
        [self.resultWord containsObject:[gNumbers objectAtIndex:1]] &&
        [self.resultWord containsObject:[oNumbers objectAtIndex:1]]) {
        hasNoError = TRUE;
    }

    if ([self.resultWord containsObject:[bNumbers objectAtIndex:2]] &&
        [self.resultWord containsObject:[iNumbers objectAtIndex:2]] &&
        [self.resultWord containsObject:[gNumbers objectAtIndex:2]] &&
        [self.resultWord containsObject:[oNumbers objectAtIndex:2]]) {
        hasNoError = TRUE;
    }

    if ([self.resultWord containsObject:[bNumbers objectAtIndex:3]] &&
        [self.resultWord containsObject:[iNumbers objectAtIndex:3]] &&
        [self.resultWord containsObject:[nNumbers objectAtIndex:3]] &&
        [self.resultWord containsObject:[gNumbers objectAtIndex:3]] &&
        [self.resultWord containsObject:[oNumbers objectAtIndex:3]]) {
        hasNoError = TRUE;
    }

    if ([self.resultWord containsObject:[bNumbers objectAtIndex:4]] &&
        [self.resultWord containsObject:[iNumbers objectAtIndex:4]] &&
        [self.resultWord containsObject:[nNumbers objectAtIndex:4]] &&
        [self.resultWord containsObject:[gNumbers objectAtIndex:4]] &&
        [self.resultWord containsObject:[oNumbers objectAtIndex:4]]) {
        hasNoError = TRUE;
    }

    //vertical
    if ([self.resultWord containsObject:[bNumbers objectAtIndex:0]] &&
        [self.resultWord containsObject:[bNumbers objectAtIndex:1]] &&
        [self.resultWord containsObject:[bNumbers objectAtIndex:2]] &&
        [self.resultWord containsObject:[bNumbers objectAtIndex:3]] &&
        [self.resultWord containsObject:[bNumbers objectAtIndex:4]]) {
        hasNoError = TRUE;
    }

    if ([self.resultWord containsObject:[iNumbers objectAtIndex:0]] &&
        [self.resultWord containsObject:[iNumbers objectAtIndex:1]] &&
        [self.resultWord containsObject:[iNumbers objectAtIndex:2]] &&
        [self.resultWord containsObject:[iNumbers objectAtIndex:3]] &&
        [self.resultWord containsObject:[iNumbers objectAtIndex:4]]) {
        hasNoError = TRUE;
    }

    if ([self.resultWord containsObject:[nNumbers objectAtIndex:0]] &&
        [self.resultWord containsObject:[nNumbers objectAtIndex:1]] &&
        [self.resultWord containsObject:[nNumbers objectAtIndex:3]] &&
        [self.resultWord containsObject:[nNumbers objectAtIndex:4]]) {
        hasNoError = TRUE;
    }

    if ([self.resultWord containsObject:[gNumbers objectAtIndex:0]] &&
        [self.resultWord containsObject:[gNumbers objectAtIndex:1]] &&
        [self.resultWord containsObject:[gNumbers objectAtIndex:2]] &&
        [self.resultWord containsObject:[gNumbers objectAtIndex:3]] &&
        [self.resultWord containsObject:[gNumbers objectAtIndex:4]]) {
        hasNoError = TRUE;
    }

    if ([self.resultWord containsObject:[oNumbers objectAtIndex:0]] &&
        [self.resultWord containsObject:[oNumbers objectAtIndex:1]] &&
        [self.resultWord containsObject:[oNumbers objectAtIndex:2]] &&
        [self.resultWord containsObject:[oNumbers objectAtIndex:3]] &&
        [self.resultWord containsObject:[oNumbers objectAtIndex:4]]) {
        hasNoError = TRUE;
    }

    //diagonal
    if ([self.resultWord containsObject:[bNumbers objectAtIndex:0]] &&
        [self.resultWord containsObject:[iNumbers objectAtIndex:1]] &&
        [self.resultWord containsObject:[gNumbers objectAtIndex:3]] &&
        [self.resultWord containsObject:[oNumbers objectAtIndex:4]]) {
        hasNoError = TRUE;
    }

    if ([self.resultWord containsObject:[bNumbers objectAtIndex:4]] &&
        [self.resultWord containsObject:[iNumbers objectAtIndex:3]] &&
        [self.resultWord containsObject:[gNumbers objectAtIndex:1]] &&
        [self.resultWord containsObject:[oNumbers objectAtIndex:0]]) {
        hasNoError = TRUE;
    }

    if (hasNoError) {
        [timer invalidate];

        shouldRestartGame = TRUE;

        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulations, You WON!"
                                                        message:@"Thank you for playing BINGO!"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }else{
        [self pauseGame];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry"
                                                        message:@"You don't have enough numbers in your card for BINGO!"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }

}

-(void)formatButton:(UIButton*)button {
    [button setTitleColor:[ UIColor colorWithRed: 0.200 green: 0.200 blue: 0.200 alpha: 1.000 ] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:30];
    button.titleLabel.minimumScaleFactor = 0.01;
    button.titleLabel.numberOfLines = 1;
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    button.titleLabel.lineBreakMode = NSLineBreakByClipping;
    [button setBackgroundColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.6]];

}
- (void)updateTime{

}

- (void) dealloc {
    [timer invalidate];
}
#pragma Private Methods



-(int) getRandomNumberBetweenMin:(int)min andMax:(int)max
{
	return ( (arc4random() % (max-min+1)) + min );
}

-(NSString *) appendBINGOLetterWithNumber:(int)num{
    NSString *returnString = @"";
    if(num>= 1 && num<=15) returnString = [NSString stringWithFormat:@"B %i", num];
    if(num>=16 && num<=30) returnString = [NSString stringWithFormat:@"I %i", num];
    if(num>=31 && num<=45) returnString = [NSString stringWithFormat:@"N %i", num];
    if(num>=46 && num<=60) returnString = [NSString stringWithFormat:@"G %i", num];
    if(num>=61 && num<=75) returnString = [NSString stringWithFormat:@"O %i", num];
    return returnString;
}

#pragma mark Methods that handle rotation
-(void) populateButtonTitleAfterRotation{


}

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
