//
//  CVSuppView.m
//  CollectionViewTableControl
//
//  Created by Amisha Goyal on 8/29/16.
//  Copyright © 2016 Amisha Goyal. All rights reserved.
//

#import "CVSuppView.h"
#import "UIView+FLKAutoLayout.h"

static NSString * const kEqualZero = @"0@750";
static NSString * const kEqualZeroLow = @"0@250";
static NSString * const kEqualZeroHigh = @"0@850";
static NSString * const kLessThanZero = @"<=0@750";
static NSString * const kGreaterThanZero = @">=0@750";


@interface CVSuppView ()

@property (nonatomic, strong) UIView *bgView;

@end

@implementation CVSuppView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    UIView *bgView = [UIView new];
    bgView.backgroundColor = [UIColor greenColor];
    [self addSubview:bgView];
    [bgView alignLeading:kEqualZero trailing:kEqualZero toView:self];
    [bgView alignTopEdgeWithView:self predicate:kEqualZero];
    [bgView constrainHeight:@"20.0@750"];
    self.bgView = bgView;

}
@end
