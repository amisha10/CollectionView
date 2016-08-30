//
//  CVCell.m
//  CollectionViewTableControl
//
//  Created by Amisha Goyal on 8/29/16.
//  Copyright © 2016 Amisha Goyal. All rights reserved.
//

#import "CVCell.h"
#import "UIView+FLKAutoLayout.h"

static NSString * const kEqualZero = @"0@750";
static NSString * const kEqualZeroLow = @"0@250";
static NSString * const kEqualZeroHigh = @"0@850";
static NSString * const kLessThanZero = @"<=0@750";
static NSString * const kGreaterThanZero = @">=0@750";

@interface CVCell ()
@property (nonatomic, strong) UIView *containerView;

@end

@implementation CVCell


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUpView];
    }
    return self;

}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setUpView];
    }
    return self;

}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)setUpView {

    UIView *containerView = [UIView new];
    containerView.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:containerView];
    [containerView alignTop:kEqualZero leading:kEqualZero bottom:kEqualZero trailing:kLessThanZero toView:self.contentView];

    self.containerView = containerView;
    UILabel *titleLabel = [UILabel new];
    titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    titleLabel.numberOfLines = 0;
    titleLabel.tag = 100;
    [titleLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    [titleLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical];
    [titleLabel setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical];

    [self.containerView addSubview:titleLabel];
    [titleLabel alignTop:kEqualZero leading:@"10@750" bottom:kEqualZero trailing:@"-10@750" toView:self.containerView];


//    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:titleLabel
//                                                                    attribute:NSLayoutAttributeTop
//                                                                    relatedBy:NSLayoutRelationEqual
//                                                                       toItem:self.contentView
//                                                                    attribute:NSLayoutAttributeTop
//                                                                   multiplier:1
//                                                                     constant:0.0];
//    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:titleLabel
//                                                                    attribute:NSLayoutAttributeLeading
//                                                                    relatedBy:NSLayoutRelationEqual
//                                                                       toItem:self.contentView
//                                                                    attribute:NSLayoutAttributeLeading
//                                                                   multiplier:1
//                                                                     constant:0.0];
//    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:titleLabel
//                                                                    attribute:NSLayoutAttributeTrailing
//                                                                    relatedBy:NSLayoutRelationLessThanOrEqual
//                                                                       toItem:self.contentView
//                                                                    attribute:NSLayoutAttributeTrailing
//                                                                   multiplier:1
//                                                                     constant:0.0];
//    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:titleLabel
//                                                                    attribute:NSLayoutAttributeBottom
//                                                                    relatedBy:NSLayoutRelationLessThanOrEqual
//                                                                       toItem:self.contentView
//                                                                    attribute:NSLayoutAttributeBottom
//                                                                   multiplier:1
//                                                                     constant:0.0];
//
//    NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:titleLabel
//                                                                       attribute:NSLayoutAttributeCenterX
//                                                                       relatedBy:NSLayoutRelationEqual
//                                                                          toItem:self.contentView
//                                                                       attribute:NSLayoutAttributeCenterX
//                                                                      multiplier:1
//                                                                        constant:0.0];
//    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:titleLabel
//                                                                        attribute:NSLayoutAttributeCenterY
//                                                                        relatedBy:NSLayoutRelationLessThanOrEqual
//                                                                           toItem:self.contentView
//                                                                        attribute:NSLayoutAttributeCenterY
//                                                                       multiplier:1
//                                                                         constant:0.0];
//
//    [self.contentView addConstraint:topConstraint];
//    [self.contentView addConstraint:leftConstraint];
//    [self.contentView addConstraint:rightConstraint];
//    [self.contentView addConstraint:bottomConstraint];
////    [self.contentView addConstraint:centerXConstraint];
////    [self.contentView addConstraint:centerYConstraint];
//
    self.titleLabel = titleLabel;

}
@end
