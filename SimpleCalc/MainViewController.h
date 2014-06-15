//
//  MainViewController.h
//  SimpleCalc
//
//  Created by Admin on 15.06.14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainView.h"
#import "DividingByZero.h"

@interface MainViewController : UIViewController

@property (nonatomic) MainView *mainCalcView;

@property (nonatomic) int firstNumber;
@property (nonatomic) int secondNumber;
@property (nonatomic) BOOL isEnterFirstNumber;
@property (nonatomic) BOOL isResult;
@property (nonatomic) NSString *mathOperator;

@end
