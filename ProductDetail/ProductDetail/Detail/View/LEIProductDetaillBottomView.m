//
//  LEIProductDetaillBottomView.m
//  TianTiShop
//
//  Created by macbookpro on 2019/2/21.
//  Copyright © 2019 TianTiShop. All rights reserved.
//

#import "LEIProductDetaillBottomView.h"

@implementation LEIProductDetaillBottomView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    self = [[[NSBundle mainBundle] loadNibNamed:@"LEIProductDetaillBottomView" owner:self options:nil] lastObject];
    if (self) {
        self.frame = frame;        
    }
    return self;
}
@end
