//
// Created by Shaokang Zhao on 15/1/12.
// Copyright (c) 2015 Shaokang Zhao. All rights reserved.
//

#import "MBTagButton.h"
#import "MBTag.h"
#import "UIColor+ImageColor.h"

@implementation MBTagButton

+ (instancetype)buttonWithTag:(MBTag *)tag
{
	MBTagButton *btn = [super buttonWithType:UIButtonTypeCustom];
	
	if (tag.attributedText) {
		[btn setAttributedTitle:tag.attributedText forState:UIControlStateNormal];
	} else {
		[btn setTitle:tag.text forState:UIControlStateNormal];
		[btn setTitleColor:tag.textColor forState:UIControlStateNormal];
        [btn setTitleColor:tag.selectedTextColor forState:UIControlStateSelected];
        [btn setTitleColor:tag.selectedTextColor forState:UIControlStateHighlighted];
		btn.titleLabel.font = tag.font ?: [UIFont systemFontOfSize:tag.fontSize];
	}
	
	btn.backgroundColor = tag.bgColor;
	btn.contentEdgeInsets = tag.padding;
	btn.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
	
    if (tag.bgImg) {
        [btn setBackgroundImage:tag.bgImg forState:UIControlStateNormal];
    }
    
    if (tag.selectedbackgroundColor) {
        [btn setBackgroundImage:[UIColor imageWithColor:tag.selectedbackgroundColor] forState:UIControlStateHighlighted];
        [btn setBackgroundImage:[UIColor imageWithColor:tag.selectedbackgroundColor] forState:UIControlStateSelected];
    }
    
    if (tag.borderColor) {
        btn.layer.borderColor = tag.borderColor.CGColor;
    }
    
    if (tag.borderWidth) {
        btn.layer.borderWidth = tag.borderWidth;
    }
    
    btn.userInteractionEnabled = tag.enable;
    btn.layer.cornerRadius = tag.cornerRadius;
    btn.layer.masksToBounds = YES;
    btn.selectable = tag.selectable;
    btn.animatable = tag.animatable;
    
    return btn;
}

@end
