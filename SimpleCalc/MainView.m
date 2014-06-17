//
//  MainView.m
//  SimpleCalc
//
//  Created by Admin on 15.06.14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "MainView.h"

@implementation MainView

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        [self allocViews];
        
        _digitButtons = [[NSArray alloc ]initWithObjects:_digitButtonZero, _digitButtonOne, _digitButtonTwo,
                         _digitButtonThree, _digitButtonFour, _digitButtonFive, _digitButtonSix,
                         _digitButtonSeven, _digitButtonEight, _digitButtonNine, nil];
        _otherButtons = [[NSArray alloc]initWithObjects:_mathOperationSum, _mathOperationDiff,
                         _mathOperationMultiple, _mathOperationDivide, _actionEqual, _actionReset, nil];
        
        [self initPropertiesOfViews];
        
        [self addSubviews];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self subviewsFramesWithFirstX:20 FirstY:30 DistanceBetween:24 AndButtonSize:52];
}

- (void)subviewsFramesWithFirstX:(int)firstX FirstY:(int)firstY DistanceBetween:(int)distanceBetween
                   AndButtonSize:(int)buttonSize {
    int currentX = firstX;
    int currentY = firstY;
    int index;
    
    _mainTextField.frame = CGRectMake(currentX, currentY, 270, buttonSize);
    _infoTextField.frame = CGRectMake(currentX + 270, currentY, 10, buttonSize);
    currentY += buttonSize + distanceBetween;
    
    
    for (int i = 0; i < 3; i++) {
        index = 1 + i * 3;
        for (int j = 0; j < 3; j++) {
            UIButton *button = _digitButtons[index];
        
            button.frame = CGRectMake(currentX, currentY, buttonSize, buttonSize);
        
            currentX += buttonSize + distanceBetween;
            index += 1;
        }
        currentY += buttonSize + distanceBetween;
        currentX = firstX;
    }
    
    [_digitButtons[0] setFrame:CGRectMake(currentX, currentY, buttonSize, buttonSize)];
    currentX += buttonSize + distanceBetween;
    [_otherButtons[5] setFrame:CGRectMake(currentX, currentY, buttonSize, buttonSize)];
    
    currentX += buttonSize + distanceBetween;
    [_otherButtons[4] setFrame:CGRectMake(currentX, currentY, buttonSize, buttonSize)];
    ((UIButton *)_otherButtons[4]).contentEdgeInsets = UIEdgeInsetsMake(0, 3, 6, 0);
    currentX = firstX + 3 * buttonSize + 3 * distanceBetween;
    currentY = firstY + buttonSize + distanceBetween;
    
    for (int i = 0; i < 4; i++) {
        [_otherButtons[i] setFrame:CGRectMake(currentX, currentY, buttonSize, buttonSize)];
        
        currentY += buttonSize + distanceBetween;
    }
   // _mathOperationSum.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
}

- (void)initDigitButton:(UIButton*)button WithTitleInt:(int)value {
    button.backgroundColor = [UIColor blackColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
    [button setTitle:[NSString stringWithFormat:@"%i", value] forState:UIControlStateNormal];
    button.contentEdgeInsets = UIEdgeInsetsMake(0, 2.25, 2, 0);
}

- (void)initButton:(UIButton*)button WithTitle:(NSString*)title {
    button.backgroundColor = [UIColor blackColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
    [button setTitle:title forState:UIControlStateNormal];
}

- (void)allocViews {
    _mainTextField = [UITextField new];
    _infoTextField = [UITextField new];
    
    _digitButtonOne = [UIButton new];
    _digitButtonTwo = [UIButton new];
    _digitButtonThree = [UIButton new];
    _digitButtonFour = [UIButton new];
    _digitButtonFive = [UIButton new];
    _digitButtonSix = [UIButton new];
    _digitButtonSeven = [UIButton new];
    _digitButtonEight = [UIButton new];
    _digitButtonNine = [UIButton new];
    _digitButtonZero = [UIButton new];
    
    _mathOperationSum = [UIButton new];
    _mathOperationDiff = [UIButton new];
    _mathOperationMultiple = [UIButton new];
    _mathOperationDivide = [UIButton new];
    
    _actionEqual = [UIButton new];
    _actionReset = [UIButton new];
}

- (void)initPropertiesOfViews {
    _mainTextField.backgroundColor = [UIColor blueColor];
    [_mainTextField setTextColor:[UIColor whiteColor]];
    [_mainTextField setTextAlignment:NSTextAlignmentRight];
    _mainTextField.text = @"0";
    _mainTextField.userInteractionEnabled = NO;
    [_mainTextField setFont:[UIFont systemFontOfSize:32]];
    
    _infoTextField.backgroundColor = [UIColor blueColor];
    [_infoTextField setTextColor:[UIColor redColor]];
    _infoTextField.text = @"";
    _infoTextField.userInteractionEnabled = NO;
    [_infoTextField setFont:[UIFont systemFontOfSize:12]];
    
    for (int i = 0; i < _digitButtons.count; i++) {
        [self initDigitButton:_digitButtons[i] WithTitleInt:i];
    }
    
    [self initButton:_mathOperationSum      WithTitle:@"+"];
    [_mathOperationSum.titleLabel setFont:[UIFont boldSystemFontOfSize:32]];
    _mathOperationSum.contentEdgeInsets = UIEdgeInsetsMake(0, 3, 6, 0);
    
    [self initButton:_mathOperationDiff     WithTitle:@"-"];
    [_mathOperationDiff.titleLabel setFont:[UIFont boldSystemFontOfSize:32]];
    _mathOperationDiff.contentEdgeInsets = UIEdgeInsetsMake(0, 3, 5, 0);
    
    [self initButton:_mathOperationMultiple WithTitle:@"x"];
    [_mathOperationMultiple.titleLabel setFont:[UIFont boldSystemFontOfSize:32]];
    _mathOperationMultiple.contentEdgeInsets = UIEdgeInsetsMake(0, 3, 6, 0);
    
    [self initButton:_mathOperationDivide   WithTitle:@"/"];
    [_mathOperationDivide.titleLabel setFont:[UIFont boldSystemFontOfSize:32]];
    _mathOperationDivide.contentEdgeInsets = UIEdgeInsetsMake(0, 3, 1, 0);
    
    [self initButton:_actionEqual WithTitle:@" = "];
    [_actionEqual.titleLabel setFont:[UIFont boldSystemFontOfSize:42]];
    [self initButton:_actionReset WithTitle:@" C "];
    [_actionReset.titleLabel setFont:[UIFont boldSystemFontOfSize:42]];
    _actionReset.backgroundColor = [UIColor redColor];
}

- (void)addSubviews {
    for (int i = 0; i < _digitButtons.count; i++) {
        [self addSubview:_digitButtons[i]];
    }
    for (int i = 0; i < _otherButtons.count; i++) {
        [self addSubview:_otherButtons[i]];
    }
    [self addSubview:_mainTextField];
    [self addSubview:_infoTextField];
}


@end
