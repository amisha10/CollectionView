//
//  SCSSenderMessageCellView.h
//  ServiceCommon
//
//  Created by Amisha Goyal on 3/14/16.
//  Copyright © 2016 Salesforce.com. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 Container view used to wrap all the cell contents.
 */
@interface SCSSenderMessageCellContainerView: UIView @end

@interface SCSSenderMessageBackgroundImageViewContainer: UIView @end

@interface SCSSenderMessageStatusContainerView: UIView @end

@interface SCSSenderMessageProgressViewContainerView: UIView @end

@interface SCSSenderMessageTextLabelContainerView: UIView @end

@interface SCSSenderMessageBackgroundView: UIView @end

@interface SCSSenderMessageStatusLabelContainerView: UIView @end

@interface SCSSenderMessageStatusImageViewContainerView: UIView @end

@interface SCSSenderMessageTimeStampContainerView: UIView @end

@interface SCSSenderMessageViewCell : UICollectionViewCell


/**
 Title text label.
 */
@property (nonatomic, weak, readonly) UILabel *messageTextLabel;

/**
 Background view.
 UIView to allow users to customize the cell.
 */
@property (nonatomic, weak, readonly) UIView *backgroundContainerView;

/**
 BackgroundImageView
 */
@property (nonatomic, weak, readonly) UIImageView *backgroundImageView;

/**
 Delivery status text label.
 */
@property (nonatomic, weak, readonly) UILabel *statusTextLabel;

/**
 Time stamp label.
 */
@property (nonatomic, weak, readonly) UILabel *timeStampLabel;

/**
Error Image icon.
 */
@property (nonatomic, weak, readonly) UIImageView *statusImageView;

/**
 Message progress view.
 */
@property (nonatomic, weak, readonly) UIProgressView *progressView;

/**
Show progress view: visible = YES. Hide progressView : visible = NO;
 */
- (void)setProgressViewVisible:(BOOL)visible;

@end

@interface SCSSenderMessageViewCell (UIAppearance)

/**
 Padding between the status message label and the text label.
 */
@property (nonatomic, assign) IBInspectable CGFloat statusMessagePadding UI_APPEARANCE_SELECTOR;

/**
 Edge insets from the outside edge of the cell to the contents.
 */
@property (nonatomic, assign) IBInspectable UIEdgeInsets outerInsets UI_APPEARANCE_SELECTOR;

/**
 Minimum height for the cell content.
 */
@property (nonatomic, assign) IBInspectable CGFloat minimumHeight UI_APPEARANCE_SELECTOR;

/**
Progress View Height
 */
@property (nonatomic, assign) IBInspectable CGFloat progressViewHeight UI_APPEARANCE_SELECTOR;

/**
 Edge insets For the progressBar.
 */
@property (nonatomic, assign) IBInspectable UIEdgeInsets progressViewInsets UI_APPEARANCE_SELECTOR;

/**
 Edge insets For the Text label.
 */
@property (nonatomic, assign) IBInspectable UIEdgeInsets labelInsets UI_APPEARANCE_SELECTOR;

/**
 Background image cap insets.
 */
@property (nonatomic, assign) IBInspectable UIEdgeInsets imageCapInsets UI_APPEARANCE_SELECTOR;

/**
 Background imageview color.
 */
@property (nonatomic, assign) IBInspectable UIColor* backgroundImageviewColor UI_APPEARANCE_SELECTOR;

@end
