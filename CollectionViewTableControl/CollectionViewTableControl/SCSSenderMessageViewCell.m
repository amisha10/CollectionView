//
//  SCSSenderMessageCellView.m
//  CaseUI
//
//  Created by Amisha Goyal on 3/14/16.
//  Copyright © 2016 Salesforce.com. All rights reserved.
//

#import "SCSSenderMessageViewCell.h"
#import "UIView+FLKAutoLayout.h"

static NSString * const kEqualZero = @"0@750";
static NSString * const kEqualZeroLow = @"0@250";
static NSString * const kEqualZeroHigh = @"0@850";
static NSString * const kLessThanZero = @"<=0@750";
static NSString * const kGreaterThanZero = @">=0@750";

typedef enum : NSUInteger {
    SCSSenderMessageCellTagsCellAlignmentView = 1,
    SCSSenderMessageCellTagsTopAlignmentView,
    SCSSenderMessageCellTagsLeftAlignmentView,
    SCSSenderMessageCellTagsBottomAlignmentView,
    SCSSenderMessageCellTagsRightAlignmentView,
    SCSSenderMessageCellTagsCellContainerView,
    SCSSenderMessageCellTagsBackgroundImageContainerView,
    SCSSenderMessageCellTagsBackgroundImageView,
    SCSSenderMessageCellTagsStatusContainerView,
    SCSSenderMessageCellTagsStatusLabel,
    SCSSenderMessageCellTagsStatusImageView,
    SCSSenderMessageCellTagsStatusLabelContainerView,
    SCSSenderMessageCellTagsStatusImageViewContainerView,
    SCSSenderMessageCellTagsProgressViewContainerView,
    SCSSenderMessageCellTagsProgressView,
    SCSSenderMessageCellTagsMessageTextLabelContainerView,
    SCSSenderMessageCellTagsMessageTextLabel,
    SCSSenderMessageCellTagsTimeStampContainerView,
    SCSSenderMessageCellTagsTimeStampLabel,
} SCSTableViewCellTags;

@implementation SCSSenderMessageCellContainerView
@end

@implementation SCSSenderMessageBackgroundImageViewContainer
@end

@implementation SCSSenderMessageStatusContainerView;
@end

@implementation SCSSenderMessageStatusLabelContainerView;
@end

@implementation SCSSenderMessageStatusImageViewContainerView;
@end

@implementation SCSSenderMessageProgressViewContainerView;
@end

@implementation SCSSenderMessageTextLabelContainerView;
@end

@implementation SCSSenderMessageBackgroundView;
@end

@implementation SCSSenderMessageTimeStampContainerView
@end

@interface SCSSenderMessageViewCell ()  {
    CGFloat _minimumHeight;
    UIEdgeInsets _outerInsets;
    CGFloat _statusMessagePadding;
    UIEdgeInsets _progressBarInsets;
    UIEdgeInsets _labelInsets;
    CGFloat _progressViewHeight;
    UIEdgeInsets _imageCapInsets;
}

@property (nonatomic, weak) SCSSenderMessageCellContainerView *cellContainerView;
@property (nonatomic, weak, readwrite) UILabel *messageTextLabel;
@property (nonatomic, weak, readwrite) UIView *backgroundContainerView;
@property (nonatomic, weak, readwrite) UIImageView *backgroundImageView;
@property (nonatomic, weak, readwrite) UILabel *statusTextLabel;
@property (nonatomic, weak, readwrite) UIImageView *statusImageView;
@property (nonatomic, weak, readwrite) UIProgressView *progressView;
@property (nonatomic, weak, readwrite) UIView *statusContentView;;
@property (nonatomic, weak, readwrite) UILabel *timeStampLabel;

@property (nonatomic, strong) NSLayoutConstraint *topAlignmentConstraint;
@property (nonatomic, strong) NSLayoutConstraint *leftAlignmentConstraint;
@property (nonatomic, strong) NSLayoutConstraint *bottomAlignmentConstraint;
@property (nonatomic, strong) NSLayoutConstraint *rightAlignmentConstraint;
@property (nonatomic, strong) NSLayoutConstraint *minimumHeightConstraint;
@property (nonatomic, strong) NSLayoutConstraint *statusPaddingConstraint;
// Message label inset constraints.
@property (nonatomic, strong) NSLayoutConstraint *labelTopAlignmentConstraint;
@property (nonatomic, strong) NSLayoutConstraint *labelLeftAlignmentConstraint;
@property (nonatomic, strong) NSLayoutConstraint *labelBottomAlignmentConstraint;
@property (nonatomic, strong) NSLayoutConstraint *labelRightAlignmentConstraint;

// ProgressBar label inset constraints.
@property (nonatomic, strong) NSLayoutConstraint *progressViewTopAlignmentConstraint;
@property (nonatomic, strong) NSLayoutConstraint *progressViewLeftAlignmentConstraint;
@property (nonatomic, strong) NSLayoutConstraint *progressViewBottomAlignmentConstraint;
@property (nonatomic, strong) NSLayoutConstraint *progressViewRightAlignmentConstraint;
@property (nonatomic, strong) NSLayoutConstraint *progressViewHeightConstraint;

@end

@implementation SCSSenderMessageViewCell (UIAppearance)

- (UIEdgeInsets)outerInsets {
    return _outerInsets;
}

- (void)setOuterInsets:(UIEdgeInsets)outerInsets {
    if (!UIEdgeInsetsEqualToEdgeInsets(_outerInsets, outerInsets)) {
        _outerInsets = outerInsets;
        self.topAlignmentConstraint.constant = outerInsets.top;
        self.leftAlignmentConstraint.constant = outerInsets.left;
        self.bottomAlignmentConstraint.constant = outerInsets.bottom;
        self.rightAlignmentConstraint.constant = outerInsets.right;
    }
}

- (CGFloat)minimumHeight {
    return _minimumHeight;
}

- (void)setMinimumHeight:(CGFloat)minimumHeight {
    if (_minimumHeight != minimumHeight) {
        _minimumHeight = minimumHeight;
        self.minimumHeightConstraint.constant = minimumHeight;
    }
}

- (CGFloat)statusMessagePadding {
    return _statusMessagePadding;
}

- (void)setStatusMessagePadding:(CGFloat)statusMessagePadding {
    if (_statusMessagePadding != statusMessagePadding) {
        _statusMessagePadding = statusMessagePadding;
        self.statusPaddingConstraint.constant = statusMessagePadding;
        self.statusPaddingConstraint.active = YES;
    }
}




- (UIEdgeInsets)labelInsets {
    return _labelInsets;
}

- (void)setLabelInsets:(UIEdgeInsets)labelInsets {
    if (!UIEdgeInsetsEqualToEdgeInsets(_labelInsets, labelInsets)) {
        _labelInsets = labelInsets;
        self.labelTopAlignmentConstraint.constant = labelInsets.top;
        self.labelLeftAlignmentConstraint.constant = labelInsets.left;
        self.labelBottomAlignmentConstraint.constant = -labelInsets.bottom;
        self.labelRightAlignmentConstraint.constant = -labelInsets.right;
    }
}

- (CGFloat)progressViewHeight {
    return _progressViewHeight;
}

- (void)setProgressViewHeight:(CGFloat)progressViewHeight {
    if (_progressViewHeight != progressViewHeight) {
        _progressViewHeight = progressViewHeight;
        self.progressViewHeightConstraint.constant = progressViewHeight;
    }
}

- (UIEdgeInsets)progressViewInsets {
    return _progressBarInsets;
}

- (void)setProgressViewInsets:(UIEdgeInsets)progressViewInsets {
    if (!UIEdgeInsetsEqualToEdgeInsets(_progressBarInsets, progressViewInsets)) {
        _progressBarInsets = progressViewInsets;
        self.progressViewTopAlignmentConstraint.constant = progressViewInsets.top;
        self.progressViewBottomAlignmentConstraint.constant = -progressViewInsets.bottom;
        self.progressViewRightAlignmentConstraint.constant = -progressViewInsets.right;
        self.progressViewLeftAlignmentConstraint.constant = self.progressViewInsets.left;
    }
}

- (UIEdgeInsets)imageCapInsets {
    return _imageCapInsets;
}

- (void)setImageCapInsets:(UIEdgeInsets)imageCapInsets {
    if (!UIEdgeInsetsEqualToEdgeInsets(_imageCapInsets, imageCapInsets)) {
        _imageCapInsets = imageCapInsets;
    }
}

- (void)setBackgroundImageviewColor:(UIColor *)backgroundImageviewColor {
    if (self.backgroundImageView.backgroundColor != backgroundImageviewColor) {
        self.backgroundImageView.backgroundColor = backgroundImageviewColor;
    }
}

- (UIColor*)backgroundImageviewColor {
    return self.backgroundImageView.backgroundColor;
}

@end

@implementation SCSSenderMessageViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupDefaultViews];
    }
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupDefaultViews];
    }
    return self;
}

- (void)setupDefaultViews {

    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.contentView.preservesSuperviewLayoutMargins = YES;
    self.backgroundColor = [UIColor clearColor];

    if (!self.cellContainerView) {
        SCSSenderMessageCellContainerView *container = [SCSSenderMessageCellContainerView new];
        container.translatesAutoresizingMaskIntoConstraints = NO;
        container.tag = SCSSenderMessageCellTagsCellContainerView;
        [self.contentView addSubview:container];
        [container alignTopEdgeWithView:[self alignmentViewForTag:SCSSenderMessageCellTagsTopAlignmentView] predicate:kEqualZero];
        [container alignLeadingEdgeWithView:[self alignmentViewForTag:SCSSenderMessageCellTagsCellAlignmentView] predicate:kEqualZero];
        [container alignTrailingEdgeWithView:self.contentView predicate:kEqualZeroHigh];
        [container alignBottomEdgeWithView:[self alignmentViewForTag:SCSSenderMessageCellTagsBottomAlignmentView] predicate:kLessThanZero];
        self.cellContainerView = container;
    }

    if (!self.backgroundImageView) {
        SCSSenderMessageBackgroundImageViewContainer *container = [SCSSenderMessageBackgroundImageViewContainer new];
        container.tag  = SCSSenderMessageCellTagsBackgroundImageContainerView;
        container.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:container];
        [container alignLeadingEdgeWithView:[self alignmentViewForTag:SCSSenderMessageCellTagsCellContainerView] predicate:kGreaterThanZero];
        [container alignTrailingEdgeWithView:self.contentView predicate:kEqualZero];
        [container alignTopEdgeWithView:[self alignmentViewForTag:SCSSenderMessageCellTagsCellContainerView] predicate:kEqualZero];
        [container alignBottomEdgeWithView:[self alignmentViewForTag:SCSSenderMessageCellTagsCellContainerView] predicate:kLessThanZero];

        UIImageView *imageView = [UIImageView new];
        imageView.translatesAutoresizingMaskIntoConstraints = NO;
        imageView.tag = SCSSenderMessageCellTagsBackgroundImageView;
        imageView.contentMode = UIViewContentModeScaleToFill;
        imageView.accessibilityIdentifier = @"ServiceCloud.SenderMessage.Image";
        [container addSubview:imageView];
        [imageView alignTop:kEqualZero leading:kEqualZero bottom:kEqualZero trailing:kEqualZero toView:container];
        self.backgroundImageView = imageView;
    }

    if (!self.messageTextLabel) {
        SCSSenderMessageTextLabelContainerView *container = [SCSSenderMessageTextLabelContainerView new];

        container.tag = SCSSenderMessageCellTagsMessageTextLabelContainerView;
        container.translatesAutoresizingMaskIntoConstraints = NO;
        [[self alignmentViewForTag:SCSSenderMessageCellTagsBackgroundImageContainerView] addSubview:container];
        self.labelLeftAlignmentConstraint =  [NSLayoutConstraint constraintWithItem:container
                                                                          attribute:NSLayoutAttributeLeft
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:[self alignmentViewForTag:SCSSenderMessageCellTagsBackgroundImageContainerView]
                                                                          attribute:NSLayoutAttributeLeft
                                                                         multiplier:1.0
                                                                           constant:self.labelInsets.left];
        self.labelLeftAlignmentConstraint.priority = UILayoutPriorityDefaultHigh;
        self.labelRightAlignmentConstraint =  [NSLayoutConstraint constraintWithItem:container
                                                                           attribute:NSLayoutAttributeRight
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:[self alignmentViewForTag:SCSSenderMessageCellTagsBackgroundImageContainerView]
                                                                           attribute:NSLayoutAttributeRight
                                                                          multiplier:1.0
                                                                            constant:self.labelInsets.right];
        self.labelRightAlignmentConstraint.priority = UILayoutPriorityDefaultHigh;

        self.labelTopAlignmentConstraint =  [NSLayoutConstraint constraintWithItem:container
                                                                         attribute:NSLayoutAttributeTop
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:[self alignmentViewForTag:SCSSenderMessageCellTagsBackgroundImageContainerView]
                                                                         attribute:NSLayoutAttributeTop
                                                                        multiplier:1.0
                                                                          constant:self.labelInsets.top];
        self.labelTopAlignmentConstraint.priority = UILayoutPriorityDefaultHigh;

        self.labelBottomAlignmentConstraint =  [NSLayoutConstraint constraintWithItem:container
                                                                            attribute:NSLayoutAttributeBottom
                                                                            relatedBy:NSLayoutRelationLessThanOrEqual
                                                                               toItem:[self alignmentViewForTag:SCSSenderMessageCellTagsBackgroundImageContainerView]
                                                                            attribute:NSLayoutAttributeBottom
                                                                           multiplier:1.0
                                                                             constant:self.labelInsets.bottom];
        self.labelBottomAlignmentConstraint.priority = UILayoutPriorityDefaultHigh;
        [container alignBottomEdgeWithView:[self alignmentViewForTag:SCSSenderMessageCellTagsBackgroundImageContainerView] predicate:@"<=0.0@750"];

        [self.contentView addConstraint:self.labelLeftAlignmentConstraint];
        [self.contentView addConstraint:self.labelRightAlignmentConstraint];
        [self.contentView addConstraint:self.labelTopAlignmentConstraint];
        [self.contentView addConstraint:self.labelBottomAlignmentConstraint];

        UILabel *label = [UILabel new];
        label.translatesAutoresizingMaskIntoConstraints = NO;

        label.tag = SCSSenderMessageCellTagsMessageTextLabel;
        label.lineBreakMode = NSLineBreakByWordWrapping;
        label.numberOfLines = 0;
        label.accessibilityIdentifier = @"ServiceCloud.SenderMessage.MessageLabel";
        [label setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
        [label setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical];
        [label setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical];

        [container addSubview:label];
        [label alignTop:kEqualZeroHigh leading:kEqualZeroHigh bottom:kEqualZeroHigh trailing:kEqualZeroHigh toView:container];
        self.messageTextLabel = label;

    }


    if (!self.progressView) {
        SCSSenderMessageProgressViewContainerView *container = [SCSSenderMessageProgressViewContainerView new];
        container.tag = SCSSenderMessageCellTagsProgressViewContainerView;
        [self.contentView addSubview:container];
        self.progressViewLeftAlignmentConstraint =  [NSLayoutConstraint constraintWithItem:container
                                                                          attribute:NSLayoutAttributeLeft
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:[self alignmentViewForTag:SCSSenderMessageCellTagsBackgroundImageContainerView]
                                                                          attribute:NSLayoutAttributeLeft
                                                                         multiplier:1.0
                                                                           constant:self.progressViewInsets.left];
        self.progressViewLeftAlignmentConstraint.priority = UILayoutPriorityDefaultHigh;

        self.progressViewRightAlignmentConstraint =  [NSLayoutConstraint constraintWithItem:container
                                                                           attribute:NSLayoutAttributeRight
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:[self alignmentViewForTag:SCSSenderMessageCellTagsBackgroundImageContainerView]
                                                                           attribute:NSLayoutAttributeRight
                                                                          multiplier:1.0
                                                                            constant:self.progressViewInsets.right];
        self.progressViewRightAlignmentConstraint.priority = UILayoutPriorityDefaultHigh;

        self.progressViewTopAlignmentConstraint =  [NSLayoutConstraint constraintWithItem:container
                                                                         attribute:NSLayoutAttributeTop
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:[self alignmentViewForTag:SCSSenderMessageCellTagsMessageTextLabelContainerView]
                                                                         attribute:NSLayoutAttributeBottom
                                                                        multiplier:1.0
                                                                          constant:self.progressViewInsets.top];
        self.progressViewTopAlignmentConstraint.priority = UILayoutPriorityDefaultHigh;

        self.progressViewBottomAlignmentConstraint =  [NSLayoutConstraint constraintWithItem:container
                                                                            attribute:NSLayoutAttributeBottom
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:[self alignmentViewForTag:SCSSenderMessageCellTagsBackgroundImageContainerView]
                                                                            attribute:NSLayoutAttributeBottom
                                                                           multiplier:1.0
                                                                             constant:self.progressViewInsets.bottom];
        self.progressViewBottomAlignmentConstraint.priority = UILayoutPriorityDefaultLow;
        [container alignBottomEdgeWithView:[self alignmentViewForTag:SCSSenderMessageCellTagsCellContainerView] predicate:@"<=0.0@750"];
        [self.contentView addConstraint:self.progressViewBottomAlignmentConstraint];
        [self.contentView addConstraint:self.progressViewTopAlignmentConstraint];
        [self.contentView addConstraint:self.progressViewRightAlignmentConstraint];
        [self.contentView addConstraint:self.progressViewLeftAlignmentConstraint];

        UIProgressView *progressView = [UIProgressView new];
        progressView.tag = SCSSenderMessageCellTagsProgressView;
        [progressView setTransform:CGAffineTransformMakeScale(-1.0, 1.0)];
        progressView.trackTintColor = [UIColor clearColor];
        [container addSubview:progressView];
        self.progressViewHeightConstraint = [NSLayoutConstraint constraintWithItem:progressView
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeNotAnAttribute
                                                                multiplier:1.0
                                                                  constant:self.progressViewHeight];
        [progressView alignTop:kEqualZero leading:kEqualZero bottom:kEqualZero trailing:kEqualZero toView:container];
        self.progressView = progressView;
        [self.contentView addConstraint:self.progressViewHeightConstraint];
    }
    if (!self.timeStampLabel) {
        SCSSenderMessageTimeStampContainerView *container = [SCSSenderMessageTimeStampContainerView new];
        container.tag = SCSSenderMessageCellTagsTimeStampContainerView;
        [self.contentView addSubview:container];

        [container constrainTopSpaceToView:[self alignmentViewForTag:SCSSenderMessageCellTagsBackgroundImageContainerView] predicate:@"5@750"];
        [container alignTrailingEdgeWithView:[self alignmentViewForTag:SCSSenderMessageCellTagsBackgroundImageContainerView] predicate:kEqualZero];
        [container alignBottomEdgeWithView:[self alignmentViewForTag:SCSSenderMessageCellTagsBottomAlignmentView] predicate:kLessThanZero];

        UILabel *label = [UILabel new];
        label.tag = SCSSenderMessageCellTagsTimeStampLabel;
        label.lineBreakMode = NSLineBreakByTruncatingTail;
        label.accessibilityIdentifier = @"ServiceCloud.SenderMessage.TimeStampLabel";
        [label setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
        [label setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical];
        [label setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical];
        [container addSubview:label];
        [label alignTop:kEqualZeroHigh leading:kEqualZeroHigh bottom:kEqualZeroHigh trailing:kEqualZeroHigh toView:container];
        self.timeStampLabel = label;
    }

}

- (void)setProgressViewVisible:(BOOL)visible {
    self.progressView.hidden = !visible;
}

- (UIView*)alignmentViewForTag:(SCSTableViewCellTags)tag {
    UIView *view = [self.contentView viewWithTag:tag];
    if (!view) {
        view = [UIView new];
        view.tag = tag;
        [self.contentView addSubview:view];

        BOOL horizontal = NO;
        switch (tag) {
            case SCSSenderMessageCellTagsCellAlignmentView:
                self.minimumHeightConstraint = [NSLayoutConstraint constraintWithItem:view
                                                                            attribute:NSLayoutAttributeHeight
                                                                            relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                               toItem:nil
                                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                                           multiplier:1.0
                                                                             constant:self.minimumHeight];
                self.minimumHeightConstraint.priority = 750.0;
                self.minimumHeightConstraint.active = YES;
                [view alignTop:kEqualZero bottom:kEqualZero toView:view.superview];
                [view alignLeadingEdgeWithView:[self alignmentViewForTag:SCSSenderMessageCellTagsLeftAlignmentView] predicate:@"0@250"];
                [view constrainLeadingSpaceToView:[self alignmentViewForTag:SCSSenderMessageCellTagsLeftAlignmentView] predicate:@">=0.0@751"];
                break;

            case SCSSenderMessageCellTagsTopAlignmentView:
                [view alignLeading:kEqualZero trailing:kEqualZero toView:view.superview];
                view.backgroundColor = [UIColor redColor];

                self.topAlignmentConstraint = [NSLayoutConstraint constraintWithItem:view
                                                                           attribute:NSLayoutAttributeTop
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:view.superview
                                                                           attribute:NSLayoutAttributeTop
                                                                          multiplier:1.0
                                                                            constant:self.outerInsets.top];
                self.topAlignmentConstraint.active = YES;
                horizontal = YES;
                break;

            case SCSSenderMessageCellTagsLeftAlignmentView:
                [view alignTop:kEqualZero bottom:kEqualZero toView:view.superview];
                view.backgroundColor = [UIColor redColor];

                self.leftAlignmentConstraint = [NSLayoutConstraint constraintWithItem:view
                                                                            attribute:NSLayoutAttributeLeading
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:view.superview
                                                                            attribute:NSLayoutAttributeLeading
                                                                           multiplier:1.0
                                                                             constant:self.outerInsets.left];
                self.leftAlignmentConstraint.active = YES;
                break;

            case SCSSenderMessageCellTagsBottomAlignmentView:
                [view alignLeading:kEqualZero trailing:kEqualZero toView:view.superview];
                view.backgroundColor = [UIColor redColor];

                self.bottomAlignmentConstraint = [NSLayoutConstraint constraintWithItem:view.superview
                                                                              attribute:NSLayoutAttributeBottom
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:view
                                                                              attribute:NSLayoutAttributeBottom
                                                                             multiplier:1.0
                                                                               constant:self.outerInsets.bottom];
                self.bottomAlignmentConstraint.active = YES;
                horizontal = YES;
                break;

            case SCSSenderMessageCellTagsRightAlignmentView:
                [view alignTop:kEqualZero bottom:kEqualZero toView:view.superview];
                view.backgroundColor = [UIColor redColor];

                self.rightAlignmentConstraint = [NSLayoutConstraint constraintWithItem:view.superview
                                                                             attribute:NSLayoutAttributeTrailing
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:view
                                                                             attribute:NSLayoutAttributeTrailing
                                                                            multiplier:1.0
                                                                              constant:self.outerInsets.right];
                self.rightAlignmentConstraint.active = YES;
                self.rightAlignmentConstraint.priority = 1000;
                break;
                
            default:
                break;
        }
        
        NSString *dimensionPredicate = @"0@1000";
#ifdef DEBUG_LAYOUT
        view.backgroundColor = [UIColor colorWithRed:1.0 green:0 blue:0 alpha:0.5];
        dimensionPredicate = @"1@1000";
#endif
        if (horizontal) {
            [view constrainHeight:dimensionPredicate];
        } else {
            [view constrainWidth:dimensionPredicate];
        }
    }
    return view;
}


- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    UICollectionViewLayoutAttributes *attributes = [layoutAttributes copy];
    CGFloat totalPadding = self.labelInsets.left + self.labelInsets.right + self.outerInsets.left + self.outerInsets.right;
    self.messageTextLabel.preferredMaxLayoutWidth = self.contentView.frame.size.width - totalPadding;

    float desiredHeight = [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    CGRect frame = attributes.frame;
    frame.size.height = desiredHeight;
    attributes.frame = frame;
    return attributes;
}

@end
