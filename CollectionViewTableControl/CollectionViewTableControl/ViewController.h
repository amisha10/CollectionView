//
//  ViewController.h
//  CollectionViewTableControl
//
//  Created by Amisha Goyal on 8/29/16.
//  Copyright © 2016 Amisha Goyal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

