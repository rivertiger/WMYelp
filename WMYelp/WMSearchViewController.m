//
//  WMLoginViewController.m
//  WMYelp
//
//  Created by MacBook Pro on 5/24/16.
//  Copyright © 2016 BrushedMetal. All rights reserved.
//

#import "WMSearchViewController.h"
#import "WMRequestManager.h"
#import "WMDetailViewController.h"
#import "MBProgressHUD.h"
#import "WMSearchResultTableViewCell.h"

static NSString *cellIdentifier = @"cell";

@interface WMSearchViewController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet NSString *searchTerm;
@property (nonatomic, weak) IBOutlet UISearchBar *searchBar;
@end


@implementation WMSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    //Using default values
    self.navigationItem.title = @"Anaheim";
    self.searchBar.text = @"burgers";
    [self queryYelp:@"burgers"];
}


# pragma mark - UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WMSearchTermItemModel *item = [WMRequestManager sharedManager].currentSearchModel.businesses[indexPath.row];
    WMSearchResultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    [cell updateName:item.name image:nil];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [WMRequestManager sharedManager].currentSearchModel.businesses.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    WMSearchTermItemModel *item = [WMRequestManager sharedManager].currentSearchModel.businesses[indexPath.row];
    UIStoryboard *main = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    WMDetailViewController *detailVC = [main instantiateViewControllerWithIdentifier:@"detailVC"];
    detailVC.navigationItem.title = item.name;
    [self.navigationController pushViewController:detailVC animated:YES];
}


# pragma mark - UISearchBarDelegate

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    return YES;
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    self.searchTerm = searchBar.text;
    //NSLog(@"Found a new search %@", self.searchTerm);
    [ self.navigationItem.titleView resignFirstResponder ];
    
    [self queryYelp:searchBar.text];
}

- (void) hideKeyboard {
    [self.navigationItem.titleView resignFirstResponder];
//    [ self.tableView removeGestureRecognizer:self.tapKeyBoardResignGesture];
    //self.tapKeyBoardResignGesture.cancelsTouchesInView = YES;
}
 - (void)queryYelp:(NSString *)searchTerm {
        
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
     
        // Remember the last search.
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [ defaults setObject:self.searchTerm forKey:@"lastSearch"];
        [ defaults synchronize];
        __weak typeof(self) weakSelf = self;
        [[WMRequestManager sharedManager] request:self.searchTerm
                                         location:@"Anaheim"
                                          completion:^(id response, NSError *error) {
                                              [weakSelf.tableView reloadData];
                                              [MBProgressHUD hideAllHUDsForView:weakSelf.view animated:NO];
                                          }];
     
}
@end
