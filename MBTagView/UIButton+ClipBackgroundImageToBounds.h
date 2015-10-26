//
//  UIButton+ClipBackgroundImageToBounds.h
//  MBTagView
//
//  Created by Kirill Kunst on 26.10.15.
//  Copyright © 2015 shiweifu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ClipBackgroundImageToBounds)

- (void)setBackgroundImageClippedToBounds:(UIImage *)image forState:(UIControlState)state;

@end
