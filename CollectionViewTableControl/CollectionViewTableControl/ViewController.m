//
//  ViewController.m
//  CollectionViewTableControl
//
//  Created by Amisha Goyal on 8/29/16.
//  Copyright © 2016 Amisha Goyal. All rights reserved.
//

#import "ViewController.h"
#import "CVCell.h"
#import "CVSuppView.h"
#import "UIView+FLKAutoLayout.h"
#import "SCSSenderMessageViewCell.h"

static NSString * const kSuppKind = @"SeparatorView";
@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, assign) CGFloat oldHeight;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableArray *firstSection = [NSMutableArray new];
    for (int i=0; i<20; i++) {
        [firstSection addObject:[NSString stringWithFormat:@" The time Emily switched “hi” to “nugget.” Not nugget. Nugget: %d", i]];
    }
    self.dataArray = [[NSArray alloc] initWithObjects:firstSection, nil];

    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
   // [flowLayout setItemSize:CGSizeMake(self.view.frame.size.width, 100)];
    [flowLayout setEstimatedItemSize:CGSizeMake(1, 50)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    // flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 0);
//    flowLayout.footerReferenceSize = CGSizeMake(self.collectionView.frame.size.width, 10.0);
    flowLayout.minimumLineSpacing = 0.0;
    flowLayout.minimumInteritemSpacing = 0.0;
    //    flowLayout.headerReferenceSize = CGSizeMake(self.collectionView.frame.size.width, 20.0);

// Setup UIcollection view
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor clearColor];
    [self.view addSubview: self.collectionView];
    [self.collectionView alignToView:self.view];
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;


    [self.collectionView registerClass:[CVCell class] forCellWithReuseIdentifier:@"CVCell"];
    [self.collectionView registerClass:[CVSuppView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"CVSuppView"];
    [self.collectionView registerClass:[SCSSenderMessageViewCell class] forCellWithReuseIdentifier:@"SCSSenderMessageViewCell"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.view layoutIfNeeded];
    dispatch_after(DISPATCH_TIME_NOW, dispatch_get_main_queue(), ^(void)
    {
        [self scrollToBottom];
        NSLog(@"content size height :%f", self.collectionView.contentSize.height);

    });
}

//-(void)viewDidLayoutSubviews{
//    [super viewDidLayoutSubviews];
//    [self scrollToBottom];
//    NSLog(@"content size height :%f", self.collectionView.contentSize.height);
//}

- (void)scrollToBottom {
    NSAssert([NSThread isMainThread], @"scrollToBottom called using a thread other than main!");

    NSInteger section = 0;
    NSInteger item = [self collectionView:_collectionView numberOfItemsInSection:section] -1;
    NSIndexPath *lastIndexPath = [NSIndexPath indexPathForItem:item inSection:section];
    [self.collectionView scrollToItemAtIndexPath:lastIndexPath atScrollPosition:UICollectionViewScrollPositionBottom animated:NO];

}

# pragma mark CollectionView delegates


#pragma mark CollectionView datasource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dataArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSMutableArray *sectionArray = [self.dataArray objectAtIndex:section];
    return sectionArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSMutableArray *data = [self.dataArray objectAtIndex:indexPath.section];
    NSString *cellData = [data objectAtIndex:indexPath.row];
/*
    static NSString *cellIdentifier = @"CVCell";

    CVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.titleLabel.text = cellData;
*/
     static NSString *cellIdentifier = @"SCSSenderMessageViewCell";
    SCSSenderMessageViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
     cell.outerInsets = UIEdgeInsetsMake(10, 80, 10, 15);
     cell.labelInsets = UIEdgeInsetsMake(10, 10, 10, 10);
     cell.minimumHeight = 44.0;
    cell.backgroundImageviewColor = [UIColor blueColor];
    cell.messageTextLabel.text = cellData;

    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {

    UICollectionReusableView *separator = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"CVSuppView" forIndexPath:indexPath];

    return separator;
}

- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(CGRectGetWidth(collectionView.bounds), 1);
}

- (void)dealloc {
    self.collectionView = nil;

}
@end
