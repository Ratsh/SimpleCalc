//
//  MainView.h
//  SimpleCalc
//
//  Created by Admin on 15.06.14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainView : UIView

@property (nonatomic, readonly) NSArray *digitButtons;
@property (nonatomic, readonly) NSArray *otherButtons;

@property (nonatomic) UITextField *mainTextField;
@property (nonatomic) UITextField *infoTextField;

@property (nonatomic) UIButton *digitButtonOne;
@property (nonatomic) UIButton *digitButtonTwo;
@property (nonatomic) UIButton *digitButtonThree;
@property (nonatomic) UIButton *digitButtonFour;
@property (nonatomic) UIButton *digitButtonFive;
@property (nonatomic) UIButton *digitButtonSix;
@property (nonatomic) UIButton *digitButtonSeven;
@property (nonatomic) UIButton *digitButtonEight;
@property (nonatomic) UIButton *digitButtonNine;
@property (nonatomic) UIButton *digitButtonZero;

@property (nonatomic) UIButton *mathOperationSum;
@property (nonatomic) UIButton *mathOperationDiff;
@property (nonatomic) UIButton *mathOperationMultiple;
@property (nonatomic) UIButton *mathOperationDivide;

@property (nonatomic) UIButton *actionEqual;
@property (nonatomic) UIButton *actionReset;

@end
