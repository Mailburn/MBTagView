## MBTagView


This library is derived from [SKTagView](https://github.com/zsk425/SKTagView).

### Installation with CocoaPods

```ruby
platform :ios, '7.0'
pod "MBTagView"
```

### Usage

#### Example
Check out the project. It contains the usages of normal way and in UITableViewCell.

#### Code
```objc
- (void)setupTagView
{
    self.tagView = ({
        MBTagView *view = [MBTagView new];
        view.backgroundColor = [UIColor colorWithHexString:@"#EAEAEA"];
        view.padding    = UIEdgeInsetsMake(10, 10, 10, 35);
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
         tag.textColor = [UIColor colorWithHexString:@"#9B9B9B"];
         tag.bgColor = UIColor.whiteColor;
         tag.selectedbackgroundColor = [UIColor colorWithHexString:@"#83D5F6"];
         tag.selectable = YES;
         tag.cornerRadius = 13;
         tag.animatable = YES;
         tag.fontSize = 15;
         tag.padding = UIEdgeInsetsMake(5, 12, 5, 12);

         [self.tagView addTag:tag];
     }];
}
```

### Tips
When uses with UITableViewCell in multi-line mode,it MUST be set preferredMaxLayoutWidth before invoking
```objc
[cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 1;
```

### Screenshots

![](https://raw.github.com/mailburn/MBTagView/master/Screenshots/example.png)

### License

MBTagView is available under the MIT license. See the LICENSE file for more info.
