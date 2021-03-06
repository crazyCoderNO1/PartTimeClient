//
//  PomeloTypeSelectViewController.h
//  PartTime
//
//  Created by 草帽~小子 on 2019/9/5.
//  Copyright © 2019 OnePiece. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^TypeSelectBlock)(NSString *str);

@interface PomeloTypeSelectViewController : BaseViewController

@property (nonatomic, copy) TypeSelectBlock  typeSelectBlock;

@end

NS_ASSUME_NONNULL_END
