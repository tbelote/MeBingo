//
//  ViewController.h
//  MeBingo
//
//  Created by Anthony Yanto on 3/3/13.
//  Copyright (c) 2013 Thomas Belote. Attribution-ShareAlike 3.0 http://creativecommons.org/licenses/by-sa/3.0/
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>
#import "WhiteButton.h"

@interface ViewController : UIViewController<UIActionSheetDelegate>{
}

@property (nonatomic, strong) IBOutlet UIButton *playGameButton;
- (IBAction)playGameIsClicked:(id)sender;
- (IBAction)printCard:(id)sender;

@end
