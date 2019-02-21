//
//  LEIShopDetailFirstPageView.h
//  TianTiShop
//
//  Created by macbookpro on 2019/2/21.
//  Copyright © 2019 TianTiShop. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LEIShopDetailFirstPageView : UIView

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

/*设置产品banner*/
-(void)setImageScrollViewWith:(NSArray *)imageArr;
@end

NS_ASSUME_NONNULL_END
