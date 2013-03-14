//
//  WordGamePlayViewController.h
//  MeBingo
//
//  Created by Anthony Yanto on 3/10/13.
//  Copyright (c) 2013 Anthony Yanto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WordGamePlayViewController : UIViewController{
    NSString *language;
}

@property(nonatomic, strong) NSString *language;

@property (nonatomic, strong) IBOutlet UILabel *displayLabel;
@property (nonatomic, strong) IBOutlet UIButton *playButton, *pauseButton, *bingoButton;
@property (nonatomic, strong) IBOutlet UIButton *b1Button, *b2Button, *b3Button, *b4Button, *b5Button;
@property (nonatomic, strong) IBOutlet UIButton *i1Button, *i2Button, *i3Button, *i4Button, *i5Button;
@property (nonatomic, strong) IBOutlet UIButton *n1Button, *n2Button, *n3Button, *n4Button, *n5Button;
@property (nonatomic, strong) IBOutlet UIButton *g1Button, *g2Button, *g3Button, *g4Button, *g5Button;
@property (nonatomic, strong) IBOutlet UIButton *o1Button, *o2Button, *o3Button, *o4Button, *o5Button;

@end
