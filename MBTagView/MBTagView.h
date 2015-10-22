//
//  MBTagView.h
//
//  Created by Shaokang Zhao on 15/1/12.
//  Copyright (c) 2015 Shaokang Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBTag.h"

@interface MBTagView : UIView

@property (nonatomic) UIEdgeInsets padding;
@property (nonatomic) int lineSpace;
@property (nonatomic) CGFloat insets;
@property (nonatomic) CGFloat preferredMaxLayoutWidth;
@property (nonatomic) BOOL singleLine;

- (void)addTag:(MBTag *)tag;
- (void)insertTag:(MBTag *)tag atIndex:(NSUInteger)index;
- (void)removeTag:(MBTag *)tag;
- (void)removeTagAtIndex:(NSUInteger)index;
- (void)removeAllTags;
- (void)selectTagAtIndex:(NSInteger)index;
- (void)deselectTagAtIndex:(NSInteger)index;

- (void)selectAll;
- (void)deselectAll;

@property (nonatomic, copy) void (^didClickTagAtIndex)(NSUInteger index);
@property (nonatomic, copy) void (^animateBlockForEachView)(UIView *btn);

@end

