//
//  ItemModel.m
//  ShoppingSite
//
//  Created by asakura hirofumi on 2015/01/02.
//  Copyright (c) 2015年 hirofumi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemModel.h"

@interface ItemModel ()

@end

@implementation ItemModel : NSObject 

// 商品テキスト
- (NSString *)getItemText:(NSString *) argKey {
    
    NSDictionary* _cateDict =     @{
                                      @"CateFood"     : @"今年の流行はニンニクバター鍋！"
                                    , @"CateFashion"  : @"流行りのあの服がお買い得"
                                    , @"CateElec"     : @"祝！2015年！あの映画で話題！"
                                    };
    return _cateDict[argKey];
    
}

// 商品画像
- (NSString *)getItemImg:(NSString *) argKey {
    
    NSDictionary* _cateDict =     @{
                                      @"CateFood"     : @"item_garlic.jpg"
                                    , @"CateFashion"  : @"item_fashion.jpg"
                                    , @"CateElec"     : @"item_car.jpg"
                                    };
    return _cateDict[argKey];
    
}

// 商品ID
- (NSString *)getItemId:(NSString *) argKey {
    
    NSDictionary* itemDetailDict =
    @{
      @"item_garlic.jpg"      : @"P00001"
      , @"item_fashion.jpg"   : @"P00003"
      , @"item_car.jpg"       : @"P00004"
      };
    return itemDetailDict[argKey];
}

// 商品名称
- (NSString *)getItemName:(NSString *) argKey {
    
    NSDictionary* itemDetailDict =
    @{
      @"item_garlic.jpg"      : @"特選ニンニク塩バター鍋セット"
      , @"item_fashion.jpg"   : @"雨の日はダッフルコート"
      , @"item_car.jpg"       : @"パーク仕様特別車"
      };
    return itemDetailDict[argKey];
}

// 商品価格の取得
- (NSString *)getItemPrice:(NSString *) argKey {
    
    NSDictionary* itemDetailDict =
    @{
      @"item_garlic.jpg"      : @"2,400"
      , @"item_fashion.jpg"   : @"98,000"
      , @"item_car.jpg"       : @"5,200,000"
      };
    return itemDetailDict[argKey];
}

// 商品在庫
- (NSString *)getItemInventory:(NSString *) argKey {
    
    NSDictionary* itemDetailDict =
    @{
      @"item_garlic.jpg"      : @"多い"
      , @"item_fashion.jpg"   : @"少ない"
      , @"item_car.jpg"       : @"少ない"
      };
    return itemDetailDict[argKey];
}

// 商品納期
- (NSString *)getItemDelivery:(NSString *) argKey {
    
    NSDictionary* itemDetailDict =
    @{
      @"item_garlic.jpg"      : @"翌日"
      , @"item_fashion.jpg"   : @"1ヶ月以内"
      , @"item_car.jpg"       : @"3ヶ月〜半年"
      };
    return itemDetailDict[argKey];
}


@end

