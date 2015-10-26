//
// Created by Shaokang Zhao on 15/1/12.
// Copyright (c) 2015 Shaokang Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class MBTag;

@interface MBTagButton : UIButton

@property (nonatomic) BOOL selectable;
@property (nonatomic) BOOL animable;
@property (nonatomic, strong) UIColor *selectedbackgroundColor;

+ (instancetype)buttonWithTag:(MBTag *)tag;

- (void)setBackgroundImages;

@end