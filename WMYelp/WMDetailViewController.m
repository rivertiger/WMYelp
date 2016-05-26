//
//  WMDetailViewController.m
//  WMYelp
//
//  Created by MacBook Pro on 5/24/16.
//  Copyright © 2016 BrushedMetal. All rights reserved.
//

#import "WMDetailViewController.h"

static NSString *cellIdentifier = @"collectionCell";

@interface WMDetailViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@end


@implementation WMDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.blackColor;
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    return cell;
}

@end
