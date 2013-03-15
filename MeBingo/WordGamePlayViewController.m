//
//  WordGamePlayViewController.m
//  MeBingo
//
//  Created by Anthony Yanto on 3/10/13.
//  Copyright (c) 2013 Anthony Yanto. All rights reserved.
//

#import "WordGamePlayViewController.h"

@interface WordGamePlayViewController (){
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

@implementation WordGamePlayViewController

@synthesize language;
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
        // height = 568 width = 300
    }
    return self;
} 

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self callAppropriateXIB:self.interfaceOrientation];
    
    allEnglishWord = [[NSArray alloc] initWithObjects:@"null", @"ant", @"airplane", @"animal", @"bag", @"bird", @"ball", @"car", @"cat", @"cake", @"dog", @"doll", @"eight", @"egg", @"eye", @"ear", @"four", @"fish", @"fire", @"feet", @"gate", @"gift", @"guitar", @"hat", @"hand", @"hair", @"house", @"ice", @"island", @"jar", @"jump", @"key", @"king", @"leaf", @"lemon", @"lion", @"milk", @"man", @"nail", @"net", @"nose", @"nest", @"nine", @"one", @"onion", @"orange", @"pen", @"pig", @"pin", @"pail", @"pan", @"queen", @"row", @"rabbit", @"rose", @"ring", @"rain", @"rat", @"six", @"seven", @"seal", @"two", @"tent", @"three", @"tooth", @"tomato", @"umbrella", @"vest",  @"vowel", @"world", @"wheel", @"woman", @"yacht", @"yam", @"yell", @"zebra", nil];

    //Except for numbers
    remainingWords = [NSMutableArray arrayWithArray:allEnglishWord];
    
    if ([language isEqual:@"english"]) {
        wordsArray = [[NSArray alloc] initWithObjects:@"null", @"ant", @"airplane", @"animal", @"bag", @"bird", @"ball", @"car", @"cat", @"cake", @"dog", @"doll", @"eight", @"egg", @"eye", @"ear", @"four", @"fish", @"fire", @"feet", @"gate", @"gift", @"guitar", @"hat", @"hand", @"hair", @"house", @"ice", @"island", @"jar", @"jump", @"key", @"king", @"leaf", @"lemon", @"lion", @"milk", @"man", @"nail", @"net", @"nose", @"nest", @"nine", @"one", @"onion", @"orange", @"pen", @"pig", @"pin", @"pail", @"pan", @"queen", @"row", @"rabbit", @"rose", @"ring", @"rain", @"rat", @"six", @"seven", @"seal", @"two", @"tent", @"three", @"tooth", @"tomato", @"umbrella", @"vest",  @"vowel", @"world", @"wheel", @"woman", @"yacht", @"yam", @"yell", @"zebra", nil];
    }
    else if ([language isEqual:@"tagalog"]) {
        wordsArray = [[NSArray alloc] initWithObjects:@"null", @"langgam", @"eruplano", @"hayop", @"supot", @"ibon", @"bola", @"kotse", @"pusa", @"keyk", @"aso", @"manika", @"walo", @"itlog", @"mata", @"tainga", @"apat", @"isda", @"sunog", @"paa", @"gate", @"regalo", @"gitara", @"sombrero", @"kamay", @"buhok", @"bahay", @"yelo", @"isla", @"garapon", @"tumalon", @"susi", @"hari", @"dahon", @"limon", @"leon", @"gatas", @"tao", @"kuko", @"lambat", @"ilong", @"pugad", @"siyam", @"isa", @"sibuyas", @"kahel", @"panulat", @"baboy", @"pin", @"timba", @"kawali", @"reyna", @"hilera", @"kuneho", @"rosas", @"singsing", @"ulan", @"daga", @"anim", @"pito", @"selyo", @"dalawa", @"tent", @"tatlo", @"ngipin", @"kamatis", @"payong", @"damtan", @"patinig", @"mundo", @"gulong", @"babae", @"yate", @"nami", @"sumigaw", @"sebra", nil];
    }
    else if ([language isEqual:@"spanish"]) {
        wordsArray = [[NSArray alloc] initWithObjects:@"null", @"hormiga", @"avión", @"animal", @"bolsa", @"pájaro", @"bola", @"coche", @"gato", @"pastel", @"perro", @"muñeca", @"ocho", @"huevo", @"ojo", @"oído", @"cuatro", @"pescado", @"fuego", @"pies", @"puerta", @"regalo", @"guitarra", @"sombrero", @"mano", @"cabello", @"casa", @"hielo", @"isla", @"tarro", @"saltar", @"clave", @"rey", @"hoja", @"limón", @"león", @"leche", @"hombre", @"clavo", @"neto", @"nariz", @"nido", @"nueve", @"uno", @"cebolla", @"naranja", @"pluma", @"cerdo", @"pin", @"cubo", @"pan", @"reina", @"fila", @"conejo", @"rosa", @"anillo", @"lluvia", @"rata", @"seis", @"siete", @"sellar", @"dos", @"tienda", @"tres", @"diente", @"tomate", @"paraguas", @"chaleco", @"vocal", @"mundo", @"rueda", @"mujer", @"yate", @"ñame", @"gritar", @"cebra", nil];
    }
    else if ([language isEqual:@"french"]) {
        wordsArray = [[NSArray alloc] initWithObjects:@"null", @"fourmi", @"avion", @"animal", @"sac", @"oiseau", @"balle", @"voiture", @"chat", @"gâteau", @"chien", @"poupée", @"huit", @"œuf", @"œil", @"oreille", @"quatre", @"poisson", @"feu", @"pieds", @"porte", @"cadeau", @"guitare", @"chapeau", @"main", @"cheveux", @"maison", @"glace", @"île", @"bocal", @"sauter", @"clé", @"roi", @"feuille", @"citron", @"lion", @"lait", @"homme", @"clouer", @"net", @"nez", @"nid", @"neuf", @"un", @"oignon", @"orange", @"stylo", @"porc", @"broche", @"seau", @"casserole", @"reine", @"rangée", @"lapin", @"rose", @"anneau", @"pluie", @"rat", @"six", @"sept", @"sceller", @"deux", @"tente", @"trois", @"dent", @"tomate", @"parapluie", @"gilet", @"voyelle", @"monde", @"roue", @"femme", @"yacht", @"igname", @"crier", @"zèbre", nil];
    }
    else if ([language isEqual:@"chinese"]) {
        wordsArray = [[NSArray alloc] initWithObjects:@"null", @"蚂蚁", @"飞机", @"动物", @"袋", @"鸟", @"球", @"汽车", @"猫", @"蛋糕", @"狗", @"娃娃", @"八", @"鸡蛋", @"眼", @"耳", @"四", @"鱼", @"火", @"脚", @"门", @"礼物", @"吉他", @"帽子", @"手", @"头发", @"房子", @"冰", @"岛", @"罐", @"跳", @"关键", @"王", @"叶", @"柠檬", @"狮子", @"牛奶", @"人", @"钉", @"净", @"鼻子", @"巢", @"九", @"一", @"洋葱", @"橙", @"笔", @"猪", @"针", @"桶", @"锅", @"女王", @"行", @"兔", @"玫瑰", @"环", @"雨", @"鼠", @"六", @"七", @"密封", @"二", @"帐篷", @"三", @"牙齿", @"西红柿", @"伞", @"背心", @"元音", @"世界", @"轮", @"女人", @"游艇", @"薯", @"喊叫", @"斑马", nil];
    }
    else if ([language isEqual:@"italian"]) {
        wordsArray = [[NSArray alloc] initWithObjects:@"null", @"formica", @"aereo", @"animale", @"borsa", @"uccello", @"palla", @"auto", @"gatto", @"torta", @"cane", @"bambola", @"otto", @"uovo", @"occhio", @"orecchio", @"quattro", @"pesce", @"fuoco", @"piedi", @"gate", @"regalo", @"chitarra", @"cappello", @"mano", @"capelli", @"casa", @"ghiaccio", @"isola", @"vaso", @"saltare", @"chiave", @"re", @"foglia", @"limone", @"leone", @"latte", @"uomo", @"chiodo", @"netto", @"naso", @"nido", @"nove", @"uno", @"cipolla", @"arancione", @"penna", @"maiale", @"pin", @"secchio", @"padella", @"regina", @"fila", @"coniglio", @"rosa", @"anello", @"pioggia", @"ratto", @"sei", @"sette", @"sigillare", @"due", @"tenda", @"tre", @"dente", @"pomodoro", @"ombrello", @"gilet", @"vocale", @"mondo", @"ruota", @"donna", @"yacht", @"batata", @"urlare", @"zebra", nil];
    }
    else if ([language isEqual:@"numbers"]){
        wordsArray = [[NSArray alloc] initWithObjects:@"null", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20", @"21", @"22", @"23", @"24", @"25", @"26", @"27", @"28", @"29", @"30", @"31", @"32", @"33", @"34", @"35", @"36", @"37", @"38", @"39", @"40", @"41", @"42", @"43", @"44", @"45", @"46", @"47", @"48", @"49", @"50", @"51", @"52", @"53", @"54", @"55", @"56", @"57", @"58", @"59", @"60", @"61", @"62", @"63", @"64", @"65", @"66", @"67", @"68", @"69", @"70", @"71", @"72", @"73", @"74", @"75", nil];
        
        allEnglishWord = [[NSArray alloc] initWithArray:wordsArray];
        remainingWords = [NSMutableArray arrayWithArray:allEnglishWord];

    }
    
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) dealloc {
    [timer invalidate];
}

#pragma IBOutlet Methods

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
            [button setTitle:buttonTitle forState:UIControlStateNormal];
            [button setTag:generatedNumber];
            [button setBackgroundColor:[UIColor lightGrayColor]];
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
            [button setTitle:buttonTitle forState:UIControlStateNormal];
            [button setTag:generatedNumber];
            [button setBackgroundColor:[UIColor lightGrayColor]];
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
            [button setTitle:buttonTitle forState:UIControlStateNormal];
            [button setTag:generatedNumber];
            [button setBackgroundColor:[UIColor lightGrayColor]];
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
            [button setTitle:buttonTitle forState:UIControlStateNormal];
            [button setTag:generatedNumber];
            [button setBackgroundColor:[UIColor lightGrayColor]];
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
            [button setTitle:buttonTitle forState:UIControlStateNormal];
            [button setTag:generatedNumber];
            [button setBackgroundColor:[UIColor lightGrayColor]];
            i++;
        }
    }
}

-(void) populateButtonTitleAfterRotation{
    
    displayLabel.text = displayText;
    
    [b1Button setTitle:b1ButtonText forState:UIControlStateNormal];
    [b2Button setTitle:b2ButtonText forState:UIControlStateNormal];
    [b3Button setTitle:b3ButtonText forState:UIControlStateNormal];
    [b4Button setTitle:b4ButtonText forState:UIControlStateNormal];
    [b5Button setTitle:b5ButtonText forState:UIControlStateNormal];
    
    [i1Button setTitle:i1ButtonText forState:UIControlStateNormal];
    [i2Button setTitle:i2ButtonText forState:UIControlStateNormal];
    [i3Button setTitle:i3ButtonText forState:UIControlStateNormal];
    [i4Button setTitle:i4ButtonText forState:UIControlStateNormal];
    [i5Button setTitle:i5ButtonText forState:UIControlStateNormal];
    
    [n1Button setTitle:n1ButtonText forState:UIControlStateNormal];
    [n2Button setTitle:n2ButtonText forState:UIControlStateNormal];
    [n3Button setTitle:n3ButtonText forState:UIControlStateNormal];
    [n4Button setTitle:n4ButtonText forState:UIControlStateNormal];
    [n5Button setTitle:n5ButtonText forState:UIControlStateNormal];
    
    [g1Button setTitle:g1ButtonText forState:UIControlStateNormal];
    [g2Button setTitle:g2ButtonText forState:UIControlStateNormal];
    [g3Button setTitle:g3ButtonText forState:UIControlStateNormal];
    [g4Button setTitle:g4ButtonText forState:UIControlStateNormal];
    [g5Button setTitle:g5ButtonText forState:UIControlStateNormal];
    
    [o1Button setTitle:o1ButtonText forState:UIControlStateNormal];
    [o2Button setTitle:o2ButtonText forState:UIControlStateNormal];
    [o3Button setTitle:o3ButtonText forState:UIControlStateNormal];
    [o4Button setTitle:o4ButtonText forState:UIControlStateNormal];
    [o5Button setTitle:o5ButtonText forState:UIControlStateNormal];
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



@end
