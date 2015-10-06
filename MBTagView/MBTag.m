//
// Created by Shaokang Zhao on 15/1/12.
// Copyright (c) 2015 Shaokang Zhao. All rights reserved.
//

#import "MBTag.h"

@implementation MBTag

- (instancetype)initWithText:(NSString *)text
{
    self = [super init];
    if (self)
    {
        _text = text;
        _fontSize = 15;
        _textColor = [UIColor blackColor];
        _selectedTextColor = [UIColor whiteColor];
        _bgColor = [UIColor whiteColor];
        _enable = YES;
        _selectable = NO;
        _animable = NO;
    }
    
    return self;
}

+ (instancetype)tagWithText:(NSString *)text
{
    return [[self alloc] initWithText:text];
}

@end