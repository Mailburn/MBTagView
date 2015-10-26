//
// Created by Shaokang Zhao on 15/1/12.
// Copyright (c) 2015 Shaokang Zhao. All rights reserved.
//

#import "MBTagButton.h"
#import "MBTag.h"
#import "UIColor+ImageColor.h"
#import "UIButton+ClipBackgroundImageToBounds.h"

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
    
    
    if (tag.borderColor) {
        btn.layer.borderColor = tag.borderColor.CGColor;
    }
    
    if (tag.borderWidth) {
        btn.layer.borderWidth = tag.borderWidth;
    }
    
    btn.userInteractionEnabled = tag.enable;
    btn.layer.cornerRadius = tag.cornerRadius;
//    btn.layer.masksToBounds = YES;
    btn.selectable = tag.selectable;
    btn.animable = tag.animable;
    
    btn.layer.shadowColor = [UIColor blackColor].CGColor;
    btn.layer.shadowOffset = CGSizeMake(0, 0.5f);
    btn.layer.shadowOpacity = 0.3f;
    btn.layer.shadowRadius = 0.5f;
    
    btn.selectedbackgroundColor = tag.selectedbackgroundColor;
    
    return btn;
}

- (void)setBackgroundImages
{
    if (self.selectedbackgroundColor) {
        [self setBackgroundImageClippedToBounds:[UIColor imageWithColor:self.selectedbackgroundColor] forState:UIControlStateHighlighted];
        [self setBackgroundImageClippedToBounds:[UIColor imageWithColor:self.selectedbackgroundColor] forState:UIControlStateSelected];
    }
}

@end
