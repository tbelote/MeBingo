//
//  PictureBingoGameViewController.m
//  MeBingo
//
//  Created by Charisse on 6/21/13.
//  Copyright (c) 2013 Anthony Yanto. All rights reserved.
//

#import "PictureBingoGameViewController.h"

@interface PictureBingoGameViewController (){
    
    NSMutableArray *bNumbers, *iNumbers, *nNumbers, *gNumbers, *oNumbers;
    NSMutableArray *remainingWords, *resultWord;
    
    NSArray *wordsArray, *allEnglishWord;
    
    NSTimer *timer;
    
    NSString *displayText;
    NSString *b1ButtonText, *b2ButtonText, *b3ButtonText, *b4ButtonText, *b5ButtonText;
    NSString *i1ButtonText, *i2ButtonText, *i3ButtonText, *i4ButtonText, *i5ButtonText;
    NSString *n1ButtonText, *n2ButtonText, *n3ButtonText, *n4ButtonText, *n5ButtonText;
    NSString *g1ButtonText, *g2ButtonText, *g3ButtonText, *g4ButtonText, *g5ButtonText;
    NSString *o1ButtonText, *o2ButtonText, *o3ButtonText, *o4ButtonText, *o5ButtonText;
    
    bool shouldRestartGame;

}

@end

@implementation PictureBingoGameViewController

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
    // Do any additional setup after loading the view from its nib.
    
    [self callAppropriateXIB:self.interfaceOrientation];
    
    allEnglishWord = [[NSArray alloc] initWithObjects:@"null", @"ant", @"airplane", @"animal", @"bag", @"bird", @"ball", @"car", @"cat", @"cake", @"dog", @"doll", @"eight", @"egg", @"eye", @"ear", @"four", @"fish", @"fire", @"feet", @"gate", @"gift", @"guitar", @"hat", @"hand", @"hair", @"house", @"ice", @"island", @"jar", @"jump", @"key", @"king", @"leaf", @"lemon", @"lion", @"milk", @"man", @"nail", @"net", @"nose", @"nest", @"nine", @"one", @"onion", @"orange", @"pen", @"pig", @"pin", @"pail", @"pan", @"queen", @"row", @"rabbit", @"rose", @"ring", @"rain", @"rat", @"six", @"seven", @"seal", @"two", @"tent", @"three", @"tooth", @"tomato", @"umbrella", @"vest",  @"vowel", @"world", @"wheel", @"woman", @"yacht", @"yam", @"yell", @"zebra", nil];
    
    wordsArray = [[NSArray alloc] initWithObjects:@"null", @"ant", @"airplane", @"animal", @"bag", @"bird", @"ball", @"car", @"cat", @"cake", @"dog", @"doll", @"eight", @"egg", @"eye", @"ear", @"four", @"fish", @"fire", @"feet", @"gate", @"gift", @"guitar", @"hat", @"hand", @"hair", @"house", @"ice", @"island", @"jar", @"jump", @"key", @"king", @"leaf", @"lemon", @"lion", @"milk", @"man", @"nail", @"net", @"nose", @"nest", @"nine", @"one", @"onion", @"orange", @"pen", @"pig", @"pin", @"pail", @"pan", @"queen", @"row", @"rabbit", @"rose", @"ring", @"rain", @"rat", @"six", @"seven", @"seal", @"two", @"tent", @"three", @"tooth", @"tomato", @"umbrella", @"vest",  @"vowel", @"world", @"wheel", @"woman", @"yacht", @"yam", @"yell", @"zebra", nil];
    
    allEnglishWord = [[NSArray alloc] initWithArray:wordsArray];
    remainingWords = [NSMutableArray arrayWithArray:allEnglishWord];
    
    resultWord = [[NSMutableArray alloc] init];
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
    
    //[self populateButtonTitleAfterRotation];
}

-(IBAction)playButtonIsClicked:(id)sender{
    
    if (shouldRestartGame) {
        displayLabel.text = @"";
        
        [resultWord removeAllObjects];
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
    
    if ([resultWord containsObject:[NSNumber numberWithInt:button.tag]]) {
        [button setImage:[UIImage imageNamed:@"correct.jpg"] forState:UIControlStateNormal];
       // button.backgroundColor = [UIColor yellowColor];
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
    if ([resultWord containsObject:[bNumbers objectAtIndex:0]] &&
        [resultWord containsObject:[iNumbers objectAtIndex:0]] &&
        [resultWord containsObject:[nNumbers objectAtIndex:0]] &&
        [resultWord containsObject:[gNumbers objectAtIndex:0]] &&
        [resultWord containsObject:[oNumbers objectAtIndex:0]]) {
        hasNoError = TRUE;
    }
    
    if ([resultWord containsObject:[bNumbers objectAtIndex:1]] &&
        [resultWord containsObject:[iNumbers objectAtIndex:1]] &&
        [resultWord containsObject:[nNumbers objectAtIndex:1]] &&
        [resultWord containsObject:[gNumbers objectAtIndex:1]] &&
        [resultWord containsObject:[oNumbers objectAtIndex:1]]) {
        hasNoError = TRUE;
    }
    
    if ([resultWord containsObject:[bNumbers objectAtIndex:2]] &&
        [resultWord containsObject:[iNumbers objectAtIndex:2]] &&
        [resultWord containsObject:[gNumbers objectAtIndex:2]] &&
        [resultWord containsObject:[oNumbers objectAtIndex:2]]) {
        hasNoError = TRUE;
    }
    
    if ([resultWord containsObject:[bNumbers objectAtIndex:3]] &&
        [resultWord containsObject:[iNumbers objectAtIndex:3]] &&
        [resultWord containsObject:[nNumbers objectAtIndex:3]] &&
        [resultWord containsObject:[gNumbers objectAtIndex:3]] &&
        [resultWord containsObject:[oNumbers objectAtIndex:3]]) {
        hasNoError = TRUE;
    }
    
    if ([resultWord containsObject:[bNumbers objectAtIndex:4]] &&
        [resultWord containsObject:[iNumbers objectAtIndex:4]] &&
        [resultWord containsObject:[nNumbers objectAtIndex:4]] &&
        [resultWord containsObject:[gNumbers objectAtIndex:4]] &&
        [resultWord containsObject:[oNumbers objectAtIndex:4]]) {
        hasNoError = TRUE;
    }
    
    //vertical
    if ([resultWord containsObject:[bNumbers objectAtIndex:0]] &&
        [resultWord containsObject:[bNumbers objectAtIndex:1]] &&
        [resultWord containsObject:[bNumbers objectAtIndex:2]] &&
        [resultWord containsObject:[bNumbers objectAtIndex:3]] &&
        [resultWord containsObject:[bNumbers objectAtIndex:4]]) {
        hasNoError = TRUE;
    }
    
    if ([resultWord containsObject:[iNumbers objectAtIndex:0]] &&
        [resultWord containsObject:[iNumbers objectAtIndex:1]] &&
        [resultWord containsObject:[iNumbers objectAtIndex:2]] &&
        [resultWord containsObject:[iNumbers objectAtIndex:3]] &&
        [resultWord containsObject:[iNumbers objectAtIndex:4]]) {
        hasNoError = TRUE;
    }
    
    if ([resultWord containsObject:[nNumbers objectAtIndex:0]] &&
        [resultWord containsObject:[nNumbers objectAtIndex:1]] &&
        [resultWord containsObject:[nNumbers objectAtIndex:3]] &&
        [resultWord containsObject:[nNumbers objectAtIndex:4]]) {
        hasNoError = TRUE;
    }
    
    if ([resultWord containsObject:[gNumbers objectAtIndex:0]] &&
        [resultWord containsObject:[gNumbers objectAtIndex:1]] &&
        [resultWord containsObject:[gNumbers objectAtIndex:2]] &&
        [resultWord containsObject:[gNumbers objectAtIndex:3]] &&
        [resultWord containsObject:[gNumbers objectAtIndex:4]]) {
        hasNoError = TRUE;
    }
    
    if ([resultWord containsObject:[oNumbers objectAtIndex:0]] &&
        [resultWord containsObject:[oNumbers objectAtIndex:1]] &&
        [resultWord containsObject:[oNumbers objectAtIndex:2]] &&
        [resultWord containsObject:[oNumbers objectAtIndex:3]] &&
        [resultWord containsObject:[oNumbers objectAtIndex:4]]) {
        hasNoError = TRUE;
    }
    
    //diagonal
    if ([resultWord containsObject:[bNumbers objectAtIndex:0]] &&
        [resultWord containsObject:[iNumbers objectAtIndex:1]] &&
        [resultWord containsObject:[gNumbers objectAtIndex:3]] &&
        [resultWord containsObject:[oNumbers objectAtIndex:4]]) {
        hasNoError = TRUE;
    }
    
    if ([resultWord containsObject:[bNumbers objectAtIndex:4]] &&
        [resultWord containsObject:[iNumbers objectAtIndex:3]] &&
        [resultWord containsObject:[gNumbers objectAtIndex:1]] &&
        [resultWord containsObject:[oNumbers objectAtIndex:0]]) {
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
    if (([remainingWords count]) <= 0) {
        return;
    }
    int generatedNumber = [self getRandomNumberBetweenMin:1 andMax:([remainingWords count]-1)];
    
    int indexOfWord = [allEnglishWord indexOfObject:[remainingWords objectAtIndex:generatedNumber]];
    
    NSLog(@"generatedNumber, indexOfWord: %i, %i", generatedNumber, indexOfWord);
    [resultWord addObject:[NSNumber numberWithInt:indexOfWord]];
    
    displayLabel.text = [self appendBINGOLetterWithNumber:indexOfWord];
    [remainingWords removeObjectAtIndex:generatedNumber];
}

-(int) getRandomNumberBetweenMin:(int)min andMax:(int)max
{
	return ( (arc4random() % (max-min+1)) + min );
}

-(NSString *) appendBINGOLetterWithNumber:(int)num{
    NSString *returnString = @"";
    if(num>=1 && num<=15) returnString = [NSString stringWithFormat:@"B %@", [allEnglishWord objectAtIndex:num]];
    if(num>=16 && num<=30) returnString = [NSString stringWithFormat:@"I %@", [allEnglishWord objectAtIndex:num]];
    if(num>=31 && num<=45) returnString = [NSString stringWithFormat:@"N %@", [allEnglishWord objectAtIndex:num]];
    if(num>=46 && num<=60) returnString = [NSString stringWithFormat:@"G %@", [allEnglishWord objectAtIndex:num]];
    if(num>=61 && num<=75) returnString = [NSString stringWithFormat:@"O %@", [allEnglishWord objectAtIndex:num]];
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
            NSString *buttonTitle = [wordsArray objectAtIndex:generatedNumber];
            if (i==1){ button = b1Button; b1ButtonText = buttonTitle; }
            if (i==2){ button = b2Button; b2ButtonText = buttonTitle; }
            if (i==3){ button = b3Button; b3ButtonText = buttonTitle; }
            if (i==4){ button = b4Button; b4ButtonText = buttonTitle; }
            if (i==5){ button = b5Button; b5ButtonText = buttonTitle; }
            //[button setTitle:buttonTitle forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",buttonTitle]] forState:UIControlStateNormal];
            [button setTag:generatedNumber];
            //[button setBackgroundColor:[UIColor lightGrayColor]];
            i++;
        }
    }
}

- (void) getINumbers{
    int i = 1;
    while(i<6){
        int generatedNumber = [self getRandomNumberBetweenMin:16 andMax:30];
        if (![iNumbers containsObject:[NSNumber numberWithInt:generatedNumber]]) {
            [iNumbers addObject:[NSNumber numberWithInt:generatedNumber]];
            UIButton *button = [[UIButton alloc] init];
            NSString *buttonTitle = [wordsArray objectAtIndex:generatedNumber];
            if (i==1){ button = i1Button; i1ButtonText = buttonTitle; }
            if (i==2){ button = i2Button; i2ButtonText = buttonTitle; }
            if (i==3){ button = i3Button; i3ButtonText = buttonTitle; }
            if (i==4){ button = i4Button; i4ButtonText = buttonTitle; }
            if (i==5){ button = i5Button; i5ButtonText = buttonTitle; }
            //[button setTitle:buttonTitle forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",buttonTitle]] forState:UIControlStateNormal];
            [button setTag:generatedNumber];
            //[button setBackgroundColor:[UIColor lightGrayColor]];
            i++;
        }
    }
}

- (void) getNNumbers{
    int i = 1;
    while(i<6){
        int generatedNumber = [self getRandomNumberBetweenMin:31 andMax:45];
        if (![nNumbers containsObject:[NSNumber numberWithInt:generatedNumber]]) {
            [nNumbers addObject:[NSNumber numberWithInt:generatedNumber]];
            UIButton *button = [[UIButton alloc] init];
            NSString *buttonTitle = [wordsArray objectAtIndex:generatedNumber];
            if (i==1){ button = n1Button; n1ButtonText = buttonTitle; }
            if (i==2){ button = n2Button; n2ButtonText = buttonTitle; }
            if (i==3){ button = n3Button; n3ButtonText = buttonTitle; }
            if (i==4){ button = n4Button; n4ButtonText = buttonTitle; }
            if (i==5){ button = n5Button; n5ButtonText = buttonTitle; }
            //[button setTitle:buttonTitle forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",buttonTitle]] forState:UIControlStateNormal];
            [button setTag:generatedNumber];
            //[button setBackgroundColor:[UIColor lightGrayColor]];
            i++;
        }
    }
}

- (void) getGNumbers{
    int i = 1;
    while(i<6){
        int generatedNumber = [self getRandomNumberBetweenMin:46 andMax:60];
        if (![gNumbers containsObject:[NSNumber numberWithInt:generatedNumber]]) {
            [gNumbers addObject:[NSNumber numberWithInt:generatedNumber]];
            UIButton *button = [[UIButton alloc] init];
            NSString *buttonTitle = [wordsArray objectAtIndex:generatedNumber];
            if (i==1){ button = g1Button; g1ButtonText = buttonTitle; }
            if (i==2){ button = g2Button; g2ButtonText = buttonTitle; }
            if (i==3){ button = g3Button; g3ButtonText = buttonTitle; }
            if (i==4){ button = g4Button; g4ButtonText = buttonTitle; }
            if (i==5){ button = g5Button; g5ButtonText = buttonTitle; }
            //[button setTitle:buttonTitle forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",buttonTitle]] forState:UIControlStateNormal];
            [button setTag:generatedNumber];
            //[button setBackgroundColor:[UIColor lightGrayColor]];
            i++;
        }
    }
}

- (void) getONumbers{
    int i = 1;
    while(i<6){
        int generatedNumber = [self getRandomNumberBetweenMin:61 andMax:75];
        if (![oNumbers containsObject:[NSNumber numberWithInt:generatedNumber]]) {
            [oNumbers addObject:[NSNumber numberWithInt:generatedNumber]];
            UIButton *button = [[UIButton alloc] init];
            NSString *buttonTitle = [wordsArray objectAtIndex:generatedNumber];
            if (i==1){ button = o1Button; o1ButtonText = buttonTitle; }
            if (i==2){ button = o2Button; o2ButtonText = buttonTitle; }
            if (i==3){ button = o3Button; o3ButtonText = buttonTitle; }
            if (i==4){ button = o4Button; o4ButtonText = buttonTitle; }
            if (i==5){ button = o5Button; o5ButtonText = buttonTitle; }
            [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",buttonTitle]] forState:UIControlStateNormal];
            //[button setTitle:buttonTitle forState:UIControlStateNormal];
            [button setTag:generatedNumber];
            //[button setBackgroundColor:[UIColor lightGrayColor]];
            i++;
        }
    }
}
-(void) populateButtonTitleAfterRotation{
    
    displayLabel.text = displayText;
    
    [b1Button setImage:[UIImage imageNamed:b1ButtonText] forState:UIControlStateNormal];
    [b2Button setImage:[UIImage imageNamed:b2ButtonText] forState:UIControlStateNormal];
    [b3Button setImage:[UIImage imageNamed:b3ButtonText] forState:UIControlStateNormal];
    [b4Button setImage:[UIImage imageNamed:b4ButtonText] forState:UIControlStateNormal];
    [b5Button setImage:[UIImage imageNamed:b5ButtonText] forState:UIControlStateNormal];
    
    [i1Button setImage:[UIImage imageNamed:i1ButtonText] forState:UIControlStateNormal];
    [i2Button setImage:[UIImage imageNamed:i2ButtonText] forState:UIControlStateNormal];
    [i3Button setImage:[UIImage imageNamed:i3ButtonText] forState:UIControlStateNormal];
    [i4Button setImage:[UIImage imageNamed:i4ButtonText] forState:UIControlStateNormal];
    [i5Button setImage:[UIImage imageNamed:i5ButtonText] forState:UIControlStateNormal];
    
    [n1Button setImage:[UIImage imageNamed:n1ButtonText] forState:UIControlStateNormal];
    [n2Button setImage:[UIImage imageNamed:n2ButtonText] forState:UIControlStateNormal];
    [n3Button setImage:[UIImage imageNamed:n3ButtonText] forState:UIControlStateNormal];
    [n4Button setImage:[UIImage imageNamed:n4ButtonText] forState:UIControlStateNormal];
    [n5Button setImage:[UIImage imageNamed:n5ButtonText] forState:UIControlStateNormal];
    
    [g1Button setImage:[UIImage imageNamed:g1ButtonText] forState:UIControlStateNormal];
    [g2Button setImage:[UIImage imageNamed:g2ButtonText] forState:UIControlStateNormal];
    [g3Button setImage:[UIImage imageNamed:g3ButtonText] forState:UIControlStateNormal];
    [g4Button setImage:[UIImage imageNamed:g4ButtonText] forState:UIControlStateNormal];
    [g5Button setImage:[UIImage imageNamed:g5ButtonText] forState:UIControlStateNormal];
    
    [o1Button setImage:[UIImage imageNamed:o1ButtonText] forState:UIControlStateNormal];
    [o2Button setImage:[UIImage imageNamed:o2ButtonText] forState:UIControlStateNormal];
    [o3Button setImage:[UIImage imageNamed:o3ButtonText] forState:UIControlStateNormal];
    [o4Button setImage:[UIImage imageNamed:o4ButtonText] forState:UIControlStateNormal];
    [o5Button setImage:[UIImage imageNamed:o5ButtonText] forState:UIControlStateNormal];
}

-(void) callAppropriateXIB:(UIInterfaceOrientation)toInterfaceOrientation{
    
    NSString *iphone5text = @"Iphone5";
    
    if( UIInterfaceOrientationIsLandscape(toInterfaceOrientation) )
    {
        if ([UIScreen mainScreen].bounds.size.height == 568.0) {
            [[NSBundle mainBundle] loadNibNamed: [NSString stringWithFormat:@"%@-landscape%@", NSStringFromClass([self class]), iphone5text]
                                          owner: self
                                        options: nil];
            
        }else{
            [[NSBundle mainBundle] loadNibNamed: [NSString stringWithFormat:@"%@-landscape", NSStringFromClass([self class])]
                                          owner: self
                                        options: nil];
        }
    }
    else
    {
        if ([UIScreen mainScreen].bounds.size.height == 568.0) {
            [[NSBundle mainBundle] loadNibNamed: [NSString stringWithFormat:@"%@%@", NSStringFromClass([self class]), iphone5text]
                                          owner: self
                                        options: nil];
            
        }else{
            [[NSBundle mainBundle] loadNibNamed: [NSString stringWithFormat:@"%@", NSStringFromClass([self class])]
                                          owner: self
                                        options: nil];
            
        }
        
    }
}
#pragma mark Methods that handle rotation

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self callAppropriateXIB:toInterfaceOrientation];
    [self populateButtonTitleAfterRotation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) dealloc {
    [timer invalidate];
}

@end
