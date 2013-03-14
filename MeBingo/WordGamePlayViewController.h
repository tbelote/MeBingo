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

@property(nonatomic, retain) NSString *language;

@property (nonatomic, retain) IBOutlet UILabel *displayLabel;
@property (nonatomic, retain) IBOutlet UIButton *playButton, *pauseButton, *bingoButton;
@property (nonatomic, retain) IBOutlet UIButton *b1Button, *b2Button, *b3Button, *b4Button, *b5Button;
@property (nonatomic, retain) IBOutlet UIButton *i1Button, *i2Button, *i3Button, *i4Button, *i5Button;
@property (nonatomic, retain) IBOutlet UIButton *n1Button, *n2Button, *n3Button, *n4Button, *n5Button;
@property (nonatomic, retain) IBOutlet UIButton *g1Button, *g2Button, *g3Button, *g4Button, *g5Button;
@property (nonatomic, retain) IBOutlet UIButton *o1Button, *o2Button, *o3Button, *o4Button, *o5Button;

@end
