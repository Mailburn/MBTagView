//
//  UIButton+ClipBackgroundImageToBounds.m
//  MBTagView
//
//  Created by Kirill Kunst on 26.10.15.
//  Copyright © 2015 shiweifu. All rights reserved.
//

#import "UIButton+ClipBackgroundImageToBounds.h"

@implementation UIButton (ClipBackgroundImageToBounds)

- (void)setBackgroundImageClippedToBounds:(UIImage *)image forState:(UIControlState)state
{
    if (!( ! self.clipsToBounds && self.layer.cornerRadius != 0.0f )) {
        [self setBackgroundImage:image forState:state];
        return;
    }
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 1.0);
    [[UIBezierPath bezierPathWithRoundedRect:self.bounds
                                cornerRadius:self.layer.cornerRadius] addClip];
    [image drawInRect:self.bounds];
    UIImage* clippedBackgroundImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self setBackgroundImage:clippedBackgroundImage forState:state];
}

@end
