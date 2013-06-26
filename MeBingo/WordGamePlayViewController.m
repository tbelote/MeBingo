//
//  WordGamePlayViewController.m
//  MeBingo
//
//  Created by Anthony Yanto on 3/10/13.
//  Copyright (c) 2013 Anthony Yanto. All rights reserved.
//

#import "WordGamePlayViewController.h"
#import "SelectGamePlayViewController.h"

@interface WordGamePlayViewController (){
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

@implementation WordGamePlayViewController

@synthesize language;

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

    [self getBNumbers];
    [self getINumbers];
    [self getNNumbers];
    [self getGNumbers];
    [self getONumbers];

    shouldRestartGame = NO;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma IBOutlet Methods

-(void)resetGame {
    [super resetGame];
    [self getBNumbers];
    [self getINumbers];
    [self getNNumbers];
    [self getGNumbers];
    [self getONumbers];
    
}


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
            UIButton *button = nil;
            NSString *buttonTitle = [wordsArray objectAtIndex:generatedNumber];
            if (i==1){ button = self.i1Button; i1ButtonText = buttonTitle; }
            if (i==2){ button = self.i2Button; i2ButtonText = buttonTitle; }
            if (i==3){ button = self.i3Button; i3ButtonText = buttonTitle; }
            if (i==4){ button = self.i4Button; i4ButtonText = buttonTitle; }
            if (i==5){ button = self.i5Button; i5ButtonText = buttonTitle; }
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
            UIButton *button = nil;
            NSString *buttonTitle = [wordsArray objectAtIndex:generatedNumber];
            if (i==1){ button = self.n1Button; n1ButtonText = buttonTitle; }
            if (i==2){ button = self.n2Button; n2ButtonText = buttonTitle; }
            if (i==3){ button = self.n3Button; n3ButtonText = buttonTitle; }
            if (i==4){ button = self.n4Button; n4ButtonText = buttonTitle; }
            if (i==5){ button = self.n5Button; n5ButtonText = buttonTitle; }
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
            UIButton *button = nil;
            NSString *buttonTitle = [wordsArray objectAtIndex:generatedNumber];
            if (i==1){ button = self.g1Button; g1ButtonText = buttonTitle; }
            if (i==2){ button = self.g2Button; g2ButtonText = buttonTitle; }
            if (i==3){ button = self.g3Button; g3ButtonText = buttonTitle; }
            if (i==4){ button = self.g4Button; g4ButtonText = buttonTitle; }
            if (i==5){ button = self.g5Button; g5ButtonText = buttonTitle; }
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
            UIButton *button = nil;
            NSString *buttonTitle = [wordsArray objectAtIndex:generatedNumber];
            if (i==1){ button = self.o1Button; o1ButtonText = buttonTitle; }
            if (i==2){ button = self.o2Button; o2ButtonText = buttonTitle; }
            if (i==3){ button = self.o3Button; o3ButtonText = buttonTitle; }
            if (i==4){ button = self.o4Button; o4ButtonText = buttonTitle; }
            if (i==5){ button = self.o5Button; o5ButtonText = buttonTitle; }
            [button setTitle:buttonTitle forState:UIControlStateNormal];
            [button setTag:generatedNumber];
            [button setBackgroundColor:[UIColor lightGrayColor]];
            i++;
        }
    }
}

-(void) populateButtonTitleAfterRotation{
//
//    self.displayLabel.text = displayText;
//
//    [self.b1Button setTitle:b1ButtonText forState:UIControlStateNormal];
//    [self.b2Button setTitle:b2ButtonText forState:UIControlStateNormal];
//    [self.b3Button setTitle:b3ButtonText forState:UIControlStateNormal];
//    [self.b4Button setTitle:b4ButtonText forState:UIControlStateNormal];
//    [self.b5Button setTitle:b5ButtonText forState:UIControlStateNormal];
//
//    [self.i1Button setTitle:i1ButtonText forState:UIControlStateNormal];
//    [self.i2Button setTitle:i2ButtonText forState:UIControlStateNormal];
//    [self.i3Button setTitle:i3ButtonText forState:UIControlStateNormal];
//    [self.i4Button setTitle:i4ButtonText forState:UIControlStateNormal];
//    [self.i5Button setTitle:i5ButtonText forState:UIControlStateNormal];
//
//    [self.n1Button setTitle:n1ButtonText forState:UIControlStateNormal];
//    [self.n2Button setTitle:n2ButtonText forState:UIControlStateNormal];
//    [self.n3Button setTitle:n3ButtonText forState:UIControlStateNormal];
//    [self.n4Button setTitle:n4ButtonText forState:UIControlStateNormal];
//    [self.n5Button setTitle:n5ButtonText forState:UIControlStateNormal];
//
//    [self.g1Button setTitle:g1ButtonText forState:UIControlStateNormal];
//    [self.g2Button setTitle:g2ButtonText forState:UIControlStateNormal];
//    [self.g3Button setTitle:g3ButtonText forState:UIControlStateNormal];
//    [self.g4Button setTitle:g4ButtonText forState:UIControlStateNormal];
//    [self.g5Button setTitle:g5ButtonText forState:UIControlStateNormal];
//
//    [self.o1Button setTitle:o1ButtonText forState:UIControlStateNormal];
//    [self.o2Button setTitle:o2ButtonText forState:UIControlStateNormal];
//    [self.o3Button setTitle:o3ButtonText forState:UIControlStateNormal];
//    [self.o4Button setTitle:o4ButtonText forState:UIControlStateNormal];
//    [self.o5Button setTitle:o5ButtonText forState:UIControlStateNormal];

}






@end
