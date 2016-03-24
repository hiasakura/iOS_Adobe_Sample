//
//  ItemModel.h
//  ShoppingSite
//
//  Created by asakura hirofumi on 2015/01/02.
//  Copyright (c) 2015年 hirofumi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemModel : NSObject 

- (NSString *)getItemText:(NSString *) argKey;
- (NSString *)getItemImg:(NSString *) argKey;
- (NSString *)getItemId:(NSString *) argKey;
- (NSString *)getItemName:(NSString *) argKey;
- (NSString *)getItemPrice:(NSString *) argKey;
- (NSString *)getItemInventory:(NSString *) argKey;
- (NSString *)getItemDelivery:(NSString *) argKey;

@end

