//
//  UIImage+ImageColor.m
//  MBTagView
//
//  Created by Kirill Kunst on 06.10.15.
//  Copyright © 2015 shiweifu. All rights reserved.
//

#import "UIColor+ImageColor.h"

@implementation UIColor (ImageColor)

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
