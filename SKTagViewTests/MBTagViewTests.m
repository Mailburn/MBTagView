//
//  MBTagViewTests.m
//  MBTagViewTests
//
//  Created by Akram Hussein on 18/04/2015.
//  Copyright (c) 2015 shiweifu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "MBTagView.h"
#import "MBTag.h"

@interface MBTagViewTests : XCTestCase

@property (strong, nonatomic) MBTagView *tagView;

@end

@interface MBTagView ()

@property (nonatomic, strong) NSMutableArray *tags;

@end

@implementation MBTagViewTests

- (void)setUp {
    [super setUp];

    self.tagView = [[MBTagView alloc] initWithFrame: CGRectZero];
}

- (void)tearDown {
    [super tearDown];
}

// MARK: - Test Properties

- (void)testTagViewInitWithFrame {
    XCTAssertNotNil(self.tagView);
    XCTAssertTrue(CGRectEqualToRect(self.tagView.frame, CGRectZero));
}

- (void)testTagViewSetPadding {
    self.tagView.padding = UIEdgeInsetsMake(1, 1, 1, 1);
    XCTAssertTrue(UIEdgeInsetsEqualToEdgeInsets(self.tagView.padding, UIEdgeInsetsMake(1, 1, 1, 1)));
}

- (void)testTagViewSetLineSpace {
    self.tagView.lineSpace = 10;
    XCTAssertEqual(self.tagView.lineSpace, 10);
}

- (void)testTagViewSetInsets {
    
    self.tagView.insets = 10;
    XCTAssertEqual(self.tagView.insets, 10);
}

- (void)testTagViewPreferredMaxLayoutWidth {
    MBTagView *tagView = [[MBTagView alloc] initWithFrame: CGRectZero];
    
    tagView.preferredMaxLayoutWidth = 10;
    XCTAssertEqual(tagView.preferredMaxLayoutWidth, 10);
}

- (void)testTagViewSingleLine {
    
    self.tagView.singleLine = true;
    XCTAssertTrue(self.tagView.singleLine);

    self.tagView.singleLine = false;
    XCTAssertFalse(self.tagView.singleLine);
}

// MARK: - Test Public Methods

- (void)testTagViewAddTag {
    MBTag *tag = [MBTag tagWithText:@"Test Tag"];
    
    [self.tagView addTag:tag];
    
    XCTAssertEqual(self.tagView.tags.count, 1);
}

- (void)testTagViewRemoveTag {
    MBTag *tag = [MBTag tagWithText:@"Test Tag"];
    
    [self.tagView addTag:tag];
    [self.tagView removeTag: tag];
    
    XCTAssertEqual(self.tagView.tags.count, 0);
}

- (void)testTagViewRemoveSameTagTwice {
    MBTag *tag = [MBTag tagWithText:@"Test Tag"];
    
    [self.tagView addTag:tag];
    [self.tagView removeTag: tag];
    [self.tagView removeTag: tag];
    
    XCTAssertEqual(self.tagView.tags.count, 0);
}

- (void) testTagViewInsertTagAtIndex {
    MBTag *tag = [MBTag tagWithText:@"Test Tag"];
    
    [self.tagView insertTag:tag atIndex:0];
    
    XCTAssertEqual(self.tagView.tags.count, 1);
    XCTAssertEqualObjects([self.tagView.tags objectAtIndex:0], tag);
}

- (void) testTagViewInsertMultipleTagsAtIndex {
    MBTag *tag1 = [MBTag tagWithText:@"Test Tag 1"];
    MBTag *tag2 = [MBTag tagWithText:@"Test Tag 2"];
    
    [self.tagView insertTag:tag1 atIndex:0];
    [self.tagView insertTag:tag2 atIndex:1];
    
    XCTAssertEqual(self.tagView.tags.count, 2);
    XCTAssertEqualObjects([self.tagView.tags objectAtIndex:0], tag1);
    XCTAssertEqualObjects([self.tagView.tags objectAtIndex:1], tag2);
}

- (void) testTagViewInsertAndRemoveTagAtIndex {
    MBTag *tag = [MBTag tagWithText:@"Test Tag"];
    
    [self.tagView insertTag:tag atIndex:0];
    [self.tagView removeTagAtIndex:0];
    
    XCTAssertEqual(self.tagView.tags.count, 0);
}

- (void) testTagViewRemoveAllTags {
    MBTag *tag1 = [MBTag tagWithText:@"Test Tag 1"];
    MBTag *tag2 = [MBTag tagWithText:@"Test Tag 2"];
    MBTag *tag3 = [MBTag tagWithText:@"Test Tag 3"];
    
    [self.tagView insertTag:tag1 atIndex:0];
    [self.tagView insertTag:tag2 atIndex:1];
    [self.tagView insertTag:tag3 atIndex:2];
    
    XCTAssertEqual(self.tagView.tags.count, 3);
    
    [self.tagView removeAllTags];
    
    XCTAssertEqual(self.tagView.tags.count, 0);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
