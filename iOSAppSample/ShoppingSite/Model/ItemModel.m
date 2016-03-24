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
                                    , @"CateOutdoor"  : @"今年こそ冬山登山を始めよう！"
                                    , @"CateBooks"    : @"今年こそノーベル賞！？"
                                    , @"CateGames"    : @"今だけ！在庫あります！"
                                    , @"CateNursing"  : @"最先端科学が暮らしを変える"
                                    };
    return _cateDict[argKey];
    
}

// 商品画像
- (NSString *)getItemImg:(NSString *) argKey {
    
    NSDictionary* _cateDict =     @{
                                      @"CateFood"     : @"item_garlic.jpg"
                                    , @"CateFashion"  : @"item_fashion.jpg"
                                    , @"CateElec"     : @"item_car.jpg"
                                    , @"CateOutdoor"  : @"item_mountain.jpg"
                                    , @"CateBooks"    : @"item_book.jpg"
                                    , @"CateGames"    : @"item_game.jpg"
                                    , @"CateNursing"  : @"item_nurse.jpg"
                                    };
    return _cateDict[argKey];
    
}

// 商品ID
- (NSString *)getItemId:(NSString *) argKey {
    
    NSDictionary* itemDetailDict =
    @{
      @"item_garlic.jpg"      : @"P00001"
      , @"item_apple.jpg"     : @"P00002"
      , @"item_fashion.jpg"   : @"P00003"
      , @"item_car.jpg"       : @"P00004"
      , @"item_mountain.jpg"  : @"P00005"
      , @"item_book.jpg"      : @"P00006"
      , @"item_game.jpg"      : @"P00007"
      , @"item_nurse.jpg"     : @"P00008"
      };
    return itemDetailDict[argKey];
}

// 商品名称
- (NSString *)getItemName:(NSString *) argKey {
    
    NSDictionary* itemDetailDict =
    @{
      @"item_garlic.jpg"      : @"特選ニンニク塩バター鍋セット"
      , @"item_apple.jpg"     : @"ココナッツりんごパイセット"
      , @"item_fashion.jpg"   : @"まっきんとっしゅダッフルコート"
      , @"item_car.jpg"       : @"デロリアン仕様特別車"
      , @"item_mountain.jpg"  : @"グリベルピッケル2015年モデル"
      , @"item_book.jpg"      : @"1Q84全巻セット"
      , @"item_game.jpg"      : @"ようかいウォッチゲーム"
      , @"item_nurse.jpg"     : @"全自動式車椅子"
      };
    return itemDetailDict[argKey];
}

// 商品価格の取得
- (NSString *)getItemPrice:(NSString *) argKey {
    
    NSDictionary* itemDetailDict =
    @{
      @"item_garlic.jpg"      : @"2,400"
      , @"item_apple.jpg"     : @"1,100"
      , @"item_fashion.jpg"   : @"98,000"
      , @"item_car.jpg"       : @"5,200,000"
      , @"item_mountain.jpg"  : @"23,000"
      , @"item_book.jpg"      : @"3,600"
      , @"item_game.jpg"      : @"6,500"
      , @"item_nurse.jpg"     : @"280,000"
      };
    return itemDetailDict[argKey];
}

// 商品在庫
- (NSString *)getItemInventory:(NSString *) argKey {
    
    NSDictionary* itemDetailDict =
    @{
      @"item_garlic.jpg"      : @"多い"
      , @"item_apple.jpg"     : @"多い"
      , @"item_fashion.jpg"   : @"少ない"
      , @"item_car.jpg"       : @"少ない"
      , @"item_mountain.jpg"  : @"多い"
      , @"item_book.jpg"      : @"多い"
      , @"item_game.jpg"      : @"少ない"
      , @"item_nurse.jpg"     : @"少ない"
      };
    return itemDetailDict[argKey];
}

// 商品納期
- (NSString *)getItemDelivery:(NSString *) argKey {
    
    NSDictionary* itemDetailDict =
    @{
      @"item_garlic.jpg"      : @"翌日"
      , @"item_apple.jpg"     : @"翌日"
      , @"item_fashion.jpg"   : @"1ヶ月以内"
      , @"item_car.jpg"       : @"3ヶ月〜半年"
      , @"item_mountain.jpg"  : @"翌日"
      , @"item_book.jpg"      : @"1週間以内"
      , @"item_game.jpg"      : @"1週間以内"
      , @"item_nurse.jpg"     : @"1ヶ月以内"
      };
    return itemDetailDict[argKey];
}


@end

