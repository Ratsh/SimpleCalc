//
//  MainViewController.m
//  SimpleCalc
//
//  Created by Admin on 15.06.14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

- (void)loadView {
    _mainCalcView = [MainView new];
    self.view = _mainCalcView;
}

- (void)viewDidLoad {
    _isEnterFirstNumber = NO;
    _isResult = NO;
    
    [super viewDidLoad];
    for (UIButton *btn in _mainCalcView.digitButtons) {
        [btn addTarget:self action:@selector(digitButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    [_mainCalcView.actionReset addTarget:self action:@selector(reset) forControlEvents:UIControlEventTouchUpInside];
    for (int i = 0; i < 4; i++) {
        [_mainCalcView.otherButtons[i] addTarget:self action:@selector(mathOperation:) forControlEvents:UIControlEventTouchUpInside];
    }
        [_mainCalcView.actionEqual addTarget:self action:@selector(equalOperation) forControlEvents:UIControlEventTouchUpInside];
}

- (void)mathOperation:(UIButton *)sender {
    if ([_mainCalcView.infoTextField.text isEqual:@"E"]) {
        return;
    }
    _firstNumber = [_mainCalcView.mainTextField.text intValue];
    _mathOperator = sender.titleLabel.text;
    _isEnterFirstNumber = YES;
    _mainCalcView.infoTextField.text = _mathOperator;
}

- (void)equalOperation {
    int result;
    
    if (_isEnterFirstNumber) {
        _secondNumber = [_mainCalcView.mainTextField.text intValue];
    
        if ([_mathOperator isEqual:@"+"]) {
            result = _firstNumber + _secondNumber;
        } else if ([_mathOperator isEqual:@"-"]) {
            result = _firstNumber - _secondNumber;
        } else if ([_mathOperator isEqual:@"x"]) {
            result = _firstNumber * _secondNumber;
        } else if ([_mathOperator isEqual:@"/"]) {
            if (_secondNumber == 0) {
                result = 0;
                _mainCalcView.infoTextField.text = @"E";
            } else {
                result = _firstNumber / _secondNumber;
            }
        }
        _mainCalcView.mainTextField.text = [NSString stringWithFormat:@"%i",result];
    }
    _isEnterFirstNumber = NO;
    if (![_mainCalcView.infoTextField.text isEqual:@"E"]) {
        _mainCalcView.infoTextField.text = @"";
    }
    _isResult = YES;
}

- (void)digitButtonPressed:(UIButton *)sender {
    if ([_mainCalcView.infoTextField.text isEqual:@"E"]) {
        return;
    }
    if ([_mainCalcView.mainTextField.text isEqual: @"0"] ||
        (_isEnterFirstNumber && [_mainCalcView.mainTextField.text isEqual:[NSString stringWithFormat:@"%i",_firstNumber]]) || _isResult) {
        
        _mainCalcView.mainTextField.text = sender.titleLabel.text;
        _isResult = NO;
    } else {
        _mainCalcView.mainTextField.text = [_mainCalcView.mainTextField.text stringByAppendingString:sender.titleLabel.text];
    }
}

- (void)reset {
    _mainCalcView.mainTextField.text = @"0";
    _isEnterFirstNumber = NO;
    _firstNumber = 0;
    _secondNumber = 0;
    _mathOperator = @"";
    _mainCalcView.infoTextField.text = @"";
}

@end
