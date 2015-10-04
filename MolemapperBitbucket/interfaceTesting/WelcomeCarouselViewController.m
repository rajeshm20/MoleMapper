//
//  WelcomeCarouselViewController.m
//  MoleMapper
//
//  Created by Karpács István on 04/10/15.
//  Copyright © 2015 Webster Apps. All rights reserved.
//

#import "WelcomeCarouselViewController.h"
#import "WelcomeCollectionViewCell.h"
#import "HelpCollectionViewCell.h"

@interface WelcomeCarouselViewController ()

@end

@implementation WelcomeCarouselViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _cellContainer = [[NSMutableArray alloc] init];
    
    //_cellContainer
    
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:YES];
    [self.onboardingCollectionView setPagingEnabled:YES];
    
    UINib *nib1 = [UINib nibWithNibName:@"WelcomeCollectionViewCell" bundle:nil];
    [_onboardingCollectionView registerNib:nib1 forCellWithReuseIdentifier:@"WelcomeCollectionViewCell"];
    
    UINib *nib2 = [UINib nibWithNibName:@"HelpCollectionViewCell" bundle:nil];
    [_onboardingCollectionView registerNib:nib2 forCellWithReuseIdentifier:@"HelpCollectionViewCell"];
}

-(void)setupCollectionViewCells
{
   
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        WelcomeCollectionViewCell *cell = (WelcomeCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"WelcomeCollectionViewCell" forIndexPath:indexPath];
        cell.parentViewController = self;
        return cell;
    }
    
    if (indexPath.row == 1)
    {
        HelpCollectionViewCell *cell = (HelpCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"HelpCollectionViewCell" forIndexPath:indexPath];
        return cell;
    }
    
    return nil;
}

- (CGSize) collectionView: (UICollectionView *) __unused collectionView layout: (UICollectionViewLayout*) __unused collectionViewLayout sizeForItemAtIndexPath: (NSIndexPath *) __unused indexPath
{
    return collectionView.bounds.size;
}

- (NSInteger)horizontalPageNumber:(UIScrollView *)scrollView {
    CGPoint contentOffset = scrollView.contentOffset;
    CGSize viewSize = scrollView.bounds.size;
    
    NSInteger horizontalPage = MAX(0.0, contentOffset.x / viewSize.width);
    return horizontalPage;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    _pageControll.currentPage = [self horizontalPageNumber:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) _pageControll.currentPage = [self horizontalPageNumber:scrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end