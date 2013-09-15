//
//  PictureBingoGameViewController.m
//  MeBingo
//
//  Created by Charisse on 6/21/13.
//  Copyright (c) 2013 Thomas Belote. Attribution-ShareAlike 3.0 http://creativecommons.org/licenses/by-sa/3.0/
//

#import "PictureBingoGameViewController.h"
#import "SelectGamePlayViewController.h"

@interface PictureBingoGameViewController (){

    NSMutableArray *remainingWords;

    NSArray *wordsArray, *allEnglishWord;

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


    allEnglishWord = [[NSArray alloc] initWithObjects:@"null", @"ant", @"airplane", @"animal", @"bag", @"bird", @"ball", @"car", @"cat", @"cake", @"dog", @"doll", @"eight", @"egg", @"eye", @"ear", @"four", @"fish", @"fire", @"feet", @"gate", @"gift", @"guitar", @"hat", @"hand", @"hair", @"house", @"ice", @"island", @"jar", @"jump", @"key", @"king", @"leaf", @"lemon", @"lion", @"milk", @"man", @"nail", @"net", @"nose", @"nest", @"nine", @"one", @"onion", @"orange", @"pen", @"pig", @"pin", @"pail", @"pan", @"queen", @"row", @"rabbit", @"rose", @"ring", @"rain", @"rat", @"six", @"seven", @"seal", @"two", @"tent", @"three", @"tooth", @"tomato", @"umbrella", @"vest",  @"vowel", @"world", @"wheel", @"woman", @"yacht", @"yam", @"yell", @"zebra", nil];

    wordsArray = [[NSArray alloc] initWithObjects:@"null", @"ant", @"airplane", @"animal", @"bag", @"bird", @"ball", @"car", @"cat", @"cake", @"dog", @"doll", @"eight", @"egg", @"eye", @"ear", @"four", @"fish", @"fire", @"feet", @"gate", @"gift", @"guitar", @"hat", @"hand", @"hair", @"house", @"ice", @"island", @"jar", @"jump", @"key", @"king", @"leaf", @"lemon", @"lion", @"milk", @"man", @"nail", @"net", @"nose", @"nest", @"nine", @"one", @"onion", @"orange", @"pen", @"pig", @"pin", @"pail", @"pan", @"queen", @"row", @"rabbit", @"rose", @"ring", @"rain", @"rat", @"six", @"seven", @"seal", @"two", @"tent", @"three", @"tooth", @"tomato", @"umbrella", @"vest",  @"vowel", @"world", @"wheel", @"woman", @"yacht", @"yam", @"yell", @"zebra", nil];

    allEnglishWord = [[NSArray alloc] initWithArray:wordsArray];
    remainingWords = [NSMutableArray arrayWithArray:allEnglishWord];


    [self getBNumbers];
    [self getINumbers];
    [self getNNumbers];
    [self getGNumbers];
    [self getONumbers];

    shouldRestartGame = NO;

}




#pragma Private Methods

- (void)updateTime{
    if (([remainingWords count]) <= 0) {
        return;
    }
    int generatedNumber = [self getRandomNumberBetweenMin:1 andMax:([remainingWords count]-1)];

    int indexOfWord = [allEnglishWord indexOfObject:[remainingWords objectAtIndex:generatedNumber]];

    NSLog(@"generatedNumber, indexOfWord: %i, %i", generatedNumber, indexOfWord);
    [self.resultWord addObject:[NSNumber numberWithInt:indexOfWord]];

    self.displayLabel.text = [self appendBINGOLetterWithNumber:indexOfWord];
    [remainingWords removeObjectAtIndex:generatedNumber];
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
            UIButton *button = nil;
            NSString *buttonTitle = [wordsArray objectAtIndex:generatedNumber];
            if (i==1){ button = self.b1Button; b1ButtonText = buttonTitle; }
            if (i==2){ button = self.b2Button; b2ButtonText = buttonTitle; }
            if (i==3){ button = self.b3Button; b3ButtonText = buttonTitle; }
            if (i==4){ button = self.b4Button; b4ButtonText = buttonTitle; }
            if (i==5){ button = self.b5Button; b5ButtonText = buttonTitle; }
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
            UIButton *button = nil;
            NSString *buttonTitle = [wordsArray objectAtIndex:generatedNumber];
            if (i==1){ button = self.i1Button; i1ButtonText = buttonTitle; }
            if (i==2){ button = self.i2Button; i2ButtonText = buttonTitle; }
            if (i==3){ button = self.i3Button; i3ButtonText = buttonTitle; }
            if (i==4){ button = self.i4Button; i4ButtonText = buttonTitle; }
            if (i==5){ button = self.i5Button; i5ButtonText = buttonTitle; }
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
            UIButton *button = nil;
            NSString *buttonTitle = [wordsArray objectAtIndex:generatedNumber];
            if (i==1){ button = self.n1Button; n1ButtonText = buttonTitle; }
            if (i==2){ button = self.n2Button; n2ButtonText = buttonTitle; }
            if (i==3){ button = self.n3Button; n3ButtonText = buttonTitle; }
            if (i==4){ button = self.n4Button; n4ButtonText = buttonTitle; }
            if (i==5){ button = self.n5Button; n5ButtonText = buttonTitle; }
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
            UIButton *button = nil;
            NSString *buttonTitle = [wordsArray objectAtIndex:generatedNumber];
            if (i==1){ button = self.g1Button; g1ButtonText = buttonTitle; }
            if (i==2){ button = self.g2Button; g2ButtonText = buttonTitle; }
            if (i==3){ button = self.g3Button; g3ButtonText = buttonTitle; }
            if (i==4){ button = self.g4Button; g4ButtonText = buttonTitle; }
            if (i==5){ button = self.g5Button; g5ButtonText = buttonTitle; }
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
            UIButton *button = nil;
            NSString *buttonTitle = [wordsArray objectAtIndex:generatedNumber];
            if (i==1){ button = self.o1Button; o1ButtonText = buttonTitle; }
            if (i==2){ button = self.o2Button; o2ButtonText = buttonTitle; }
            if (i==3){ button = self.o3Button; o3ButtonText = buttonTitle; }
            if (i==4){ button = self.o4Button; o4ButtonText = buttonTitle; }
            if (i==5){ button = self.o5Button; o5ButtonText = buttonTitle; }
            [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",buttonTitle]] forState:UIControlStateNormal];
            //[button setTitle:buttonTitle forState:UIControlStateNormal];
            [button setTag:generatedNumber];
            //[button setBackgroundColor:[UIColor lightGrayColor]];
            i++;
        }
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
