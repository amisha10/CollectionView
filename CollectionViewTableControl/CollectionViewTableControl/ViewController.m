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

static NSString * const kSuppKind = @"SeparatorView";
@interface ViewController ()

@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableArray *firstSection = [NSMutableArray new];
    NSMutableArray *secondSection = [NSMutableArray new];
    for (int i=0; i<40; i++) {
        [firstSection addObject:[NSString stringWithFormat:@"Cell long long %d", i]];
        [secondSection addObject:[NSString stringWithFormat:@"item long long %d", i]];
    }
    self.dataArray = [[NSArray alloc] initWithObjects:firstSection, secondSection, nil];

    [self.collectionView registerClass:[CVCell class] forCellWithReuseIdentifier:@"CVCell"];
    [self.collectionView registerClass:[CVSuppView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"CVSuppView"];

    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(100, 100)];
//    [flowLayout setEstimatedItemSize:CGSizeMake(1, 1)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 0);
    flowLayout.footerReferenceSize = CGSizeMake(self.collectionView.frame.size.width, 40.0);
//    flowLayout.headerReferenceSize = CGSizeMake(self.collectionView.frame.size.width, 20.0);
    [self.collectionView setCollectionViewLayout:flowLayout];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    static NSString *cellIdentifier = @"CVCell";

    CVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.titleLabel.text = cellData;
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {

    UICollectionReusableView *separator = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"CVSuppView" forIndexPath:indexPath];

    return separator;
}
@end
