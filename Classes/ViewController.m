//
//  ViewController.m
//  WrapViewWithAutolayout
//
//  Created by shiweifu on 12/9/14.
//  Copyright (c) 2014 shiweifu. All rights reserved.
//

#import "ViewController.h"
#import "MBTagView.h"
#import <Masonry/Masonry.h>
#import <HexColors/HexColor.h>

@interface ViewController ()
@property (strong, nonatomic) MBTagView *tagView;
@property (nonatomic, strong) NSArray *colorPool;

@property (weak, nonatomic) IBOutlet UITextField *index;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.colorPool = @[@"#7ecef4", @"#84ccc9", @"#88abda",@"#7dc1dd",@"#b6b8de", ];
    
    [self setupTagView];
}

- (void)setupTagView
{
    self.tagView = ({
        MBTagView *view = [MBTagView new];
        view.backgroundColor = [UIColor colorWithHexString:@"#EAEAEA"];
        view.padding    = UIEdgeInsetsMake(10, 10, 10, 10);
        view.insets    = 10;
        view.lineSpace = 10;
        __weak MBTagView *weakView = view;
        weakView.didClickTagAtIndex = ^(NSUInteger index)  {
            
        };
        weakView.animateBlockForEachView = ^(UIView *v) {
            CGAffineTransform transform = v.transform;
            [UIView animateWithDuration:0.1f delay:0.0f options: UIViewAnimationOptionAutoreverse| UIViewAnimationOptionCurveLinear animations:^{
                v.transform = CGAffineTransformScale(transform, 0.95, 0.95);
            } completion:^(BOOL finished) {
                if (finished) {
                    v.transform = CGAffineTransformScale(transform, 1, 1);
                }
            }];
        };
        view;
    });
    [self.view addSubview:self.tagView];
    
    [self.tagView mas_makeConstraints:^(MASConstraintMaker *make) {
        UIView *superView = self.view;
        make.top.equalTo(superView).offset(40);
        make.leading.equalTo(superView.mas_leading);
        make.trailing.equalTo(superView.mas_trailing);
    }];
    
    [@[@"Sent", @"Attachments", @"Today", @"Conversations", @"Archieve",@"Trash", @"Others", @"Newsletters"] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
     {
         MBTag *tag = [MBTag tagWithText:obj];
         tag.textColor = [UIColor whiteColor];
         tag.bgColor = [UIColor colorWithHexString:self.colorPool[arc4random() % self.colorPool.count]];;
         tag.selectedbackgroundColor = [UIColor colorWithHexString:@"#A0E07C"];
         tag.selectable = YES;
         tag.cornerRadius = 13;
         tag.animable = YES;
         tag.fontSize = 15;
         tag.padding = UIEdgeInsetsMake(5, 12, 5, 12);
         
         [self.tagView addTag:tag];
     }];
}



#pragma mark - User interactions
- (IBAction)onAdd:(id)sender
{
    MBTag *tag = [MBTag tagWithText:@"New Filter tag"];
    tag.textColor = [UIColor whiteColor];
    tag.bgColor = [UIColor colorWithHexString:self.colorPool[arc4random() % self.colorPool.count]];;
    tag.selectedbackgroundColor = [UIColor colorWithHexString:@"#A0E07C"];
    tag.selectable = YES;
    tag.cornerRadius = 13;
    tag.animable = YES;
    tag.fontSize = 15;
    tag.padding = UIEdgeInsetsMake(5, 12, 5, 12);
    
    [self.tagView addTag:tag];
}

- (IBAction)onInsert:(id)sender
{
    MBTag *tag = [MBTag tagWithText:[NSString stringWithFormat:@"Insert Tag(%ld)",(long)self.index.text.integerValue]];
    tag.textColor = [UIColor whiteColor];
    tag.bgColor = [UIColor colorWithHexString:self.colorPool[arc4random() % self.colorPool.count]];;
    tag.selectedbackgroundColor = [UIColor colorWithHexString:@"#A0E07C"];
    tag.selectable = YES;
    tag.cornerRadius = 13;
    tag.animable = YES;
    tag.fontSize = 15;
    tag.padding = UIEdgeInsetsMake(5, 12, 5, 12);
    
    [self.tagView insertTag:tag atIndex:self.index.text.integerValue];
}

- (IBAction)onRemove:(id)sender
{
    [self.tagView removeTagAtIndex:self.index.text.integerValue];
}

- (IBAction)onRemoveAll:(id)sender
{
    [self.tagView removeAllTags];
}

- (IBAction)onTapBg:(id)sender
{
    [self.view endEditing:YES];
}

@end
