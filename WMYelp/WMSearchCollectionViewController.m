//
//  WMSearchCollectionViewController.m
//  WMYelp
//
//  Created by MacBook Pro on 5/26/16.
//  Copyright © 2016 BrushedMetal. All rights reserved.
//

#import "WMSearchCollectionViewController.h"
#import "WMSearchCollectionViewCell.h"
#import "WMRequestManager.h"
#import "MBProgressHUD.h"

static NSString *collectionIdentifier = @"collectionCell";

@interface  WMSearchCollectionViewController ()
@property (nonatomic,weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic, assign, getter=isLoadingMoreResults) BOOL LoadingMoreResults;
@property (nonatomic, weak) IBOutlet NSString *searchTerm;
@property (nonatomic, assign) NSInteger offset;
@property (nonatomic, assign) BOOL initialLoad;
@end

@implementation WMSearchCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setSectionInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    [layout setItemSize:CGSizeMake(([UIScreen mainScreen].bounds.size.width / 3) - 10,
                                   [UIScreen mainScreen].bounds.size.height / 3)];
    
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 10;
    
    self.collectionView.collectionViewLayout = layout;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.view.backgroundColor = UIColor.blueColor;
    self.collectionView.backgroundColor = UIColor.blackColor;
    self.LoadingMoreResults = NO;
    self.initialLoad = YES;
}


#pragma mark - UICollectionView


-(NSInteger)numberOfSectionsInCollectionView:
(UICollectionView *)collectionView
{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return [WMRequestManager sharedManager].currentSearchModel.businesses.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WMSearchTermItemModel *item = [WMRequestManager sharedManager].currentSearchModel.businesses[indexPath.row];
    WMSearchCollectionViewCell *cell = (WMSearchCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:collectionIdentifier forIndexPath:indexPath];
    [cell updateImageWithURL:item.imageURL];
    cell.backgroundColor = UIColor.redColor;
    return cell;
}

#pragma mark - UIScrollviewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{

    if (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)) {
        // last cell
        if (self.LoadingMoreResults == NO) {
            NSLog(@"end of the collectionView contentSize");
            self.LoadingMoreResults = YES;
            self.offset += 10;
            [self queryYelp:self.searchTerm offset:self.offset];
        }

    }
    
    if (scrollView.contentOffset.y < 0){
        //reach top
    }
    
    if (scrollView.contentOffset.y >= 0 && scrollView.contentOffset.y < (scrollView.contentSize.height - scrollView.frame.size.height)){
        //not top and not bottom
    }
}


- (void)queryYelp:(NSString *)searchTerm
           offset:(NSInteger)offset {
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    // Remember the last search.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [ defaults setObject:self.searchTerm forKey:@"lastSearch"];
    [ defaults synchronize];
    __weak typeof(self) weakSelf = self;
    [[WMRequestManager sharedManager] request:self.searchTerm
                                        limit:10
                                       offset:offset
                                     location:@"Anaheim"
                                   completion:^(id response, NSError *error) {
                                       [weakSelf.collectionView reloadData];
                                       [MBProgressHUD hideAllHUDsForView:weakSelf.view animated:NO];
                                       weakSelf.LoadingMoreResults = NO;
                                   }];
    
}




@end

