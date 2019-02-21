//
//  LEIProductDetailViewController.m
//  TianTiShop
//
//  Created by macbookpro on 2019/2/18.
//  Copyright © 2019 TianTiShop. All rights reserved.
//

#import "LEIProductDetailViewController.h"
#import <WebKit/WebKit.h>
#import "LEIShopDetailFirstPageView.h"
#import "LEIProductDetaillBottomView.h"
#import "UIView+frame.h"
#import "MJRefresh.h"

#define SCREEN_WIDTH     [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT     [UIScreen mainScreen].bounds.size.height


#define pageHeight (SCREEN_HEIGHT - self.navigationController.navigationBar.frame.size.height-[[UIApplication sharedApplication] statusBarFrame].size.height - 50)


#define WeakSelf __weak typeof(self) weakSelf = self;
@interface LEIProductDetailViewController ()
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) LEIShopDetailFirstPageView *firstView;
@property (nonatomic,strong) UIView *secondView;
@property (nonatomic,strong) WKWebView *webView;

@property (nonatomic,strong) LEIProductDetaillBottomView *bottomView;

@end

@implementation LEIProductDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%f",self.navigationController.navigationBar.frame.size.height);
    NSLog(@"%f---%f",self.view.height,pageHeight);
    
    /*如果没有设置此参数 发现上拉下拉错乱 请根据需求自行调整frame 或自行添加约束 */
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"产品详情";
    [self configUI];
    [self configData];
    
}

-(void)configData{
    
    [self.firstView setImageScrollViewWith:@[@"1.jpg",
                                             @"2.jpg",
                                             @"3.jpg",
                                             @"4.jpg",
                                             @"5.jpg",
                                           ]];
}
-(void)configUI{
    /*1.在view上面放一个scrollview*/
    [self.view addSubview:self.scrollView];
    
    /*2.scrollview分两页 第一页商品详情（原生tableview或者scrollview）  第二页图文详情 webview  也可以添加两个子视图控制器完成 demo市直接用一个视图控制器*/
    
    /*3.firstView 和secondView 可根据需求自定义*/
    [self.scrollView addSubview:self.firstView];
    [self.scrollView addSubview:self.secondView];
    
    /*加载webview 图文详情*/
    self.webView = [[WKWebView alloc] initWithFrame:self.secondView.bounds];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
    [self.secondView addSubview:self.webView];

    /*上拉加载图文页*/
    WeakSelf
    MJRefreshBackNormalFooter *firstScrollViewFooter = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf.firstView.scrollView.mj_footer endRefreshing];
        [weakSelf.scrollView setContentOffset:CGPointMake(0, weakSelf.scrollView.contentSize.height/2.0) animated:YES];
    }];
    
    self.firstView.scrollView.mj_footer = firstScrollViewFooter;
    firstScrollViewFooter.stateLabel.hidden = YES;
    firstScrollViewFooter.arrowView.hidden = YES;

    
    /*下拉加载详情页*/
    MJRefreshNormalHeader *webViewHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf.webView.scrollView.mj_header endRefreshing];
        [weakSelf.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        
    }];
    self.webView.scrollView.mj_header = webViewHeader;
    webViewHeader.lastUpdatedTimeLabel.hidden = YES;
    webViewHeader.stateLabel.hidden = YES;

    [self.view addSubview:self.bottomView];

    
}
#pragma mark - 懒加载
-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.frame = self.view.bounds;
        _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, pageHeight*2);
        /*设置scrollview 不可滚动*/
        _scrollView.scrollEnabled = NO;
        _scrollView.pagingEnabled = YES;
    }
    return _scrollView;
}
-(LEIShopDetailFirstPageView *)firstView{
    if (!_firstView) {
        _firstView = [[LEIShopDetailFirstPageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, pageHeight)];
    }
    return _firstView;
}
-(UIView *)secondView{
    
    if (!_secondView) {
        _secondView = [UIView new];
        _secondView.backgroundColor = [UIColor redColor];
        _secondView.frame = CGRectMake(0,pageHeight, SCREEN_WIDTH,pageHeight);
    }
    return _secondView;
}
-(LEIProductDetaillBottomView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[LEIProductDetaillBottomView alloc] initWithFrame:CGRectMake(0, pageHeight , SCREEN_WIDTH, 50)];
        
    }
    return _bottomView;
    
    
}
@end
