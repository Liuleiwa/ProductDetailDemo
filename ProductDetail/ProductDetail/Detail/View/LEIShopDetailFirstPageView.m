//
//  LEIShopDetailFirstPageView.m
//  TianTiShop
//
//  Created by macbookpro on 2019/2/21.
//  Copyright © 2019 TianTiShop. All rights reserved.
//

#import "LEIShopDetailFirstPageView.h"
#import "SDCycleScrollView.h"
#define SCREEN_WIDTH     [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT     [UIScreen mainScreen].bounds.size.height
@interface LEIShopDetailFirstPageView()<SDCycleScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *imagePageView;


@end
@implementation LEIShopDetailFirstPageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self = [[[NSBundle mainBundle] loadNibNamed:@"LEIShopDetailFirstPageView" owner:self options:nil] lastObject];
    if (self) {
        self.frame = frame;
        [self setupUI];
    }
    return self;
}
-(void)setImageScrollViewWith:(NSArray *)imageArr{
    for (UIView *vi in self.imagePageView.subviews) {
        if ([vi isKindOfClass:[SDCycleScrollView class]]) {
            [vi removeFromSuperview];
        }
    }
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH) shouldInfiniteLoop:YES imageNamesGroup:nil];
    cycleScrollView.imageURLStringsGroup = imageArr;
    cycleScrollView.delegate = self;
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    cycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    cycleScrollView.bannerImageViewContentMode =  UIViewContentModeScaleAspectFill;
    [self.imagePageView addSubview:cycleScrollView];
    
    
}

-(void)setupUI{
    
    
    
    
    
}
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{

    
    
    
}
@end
