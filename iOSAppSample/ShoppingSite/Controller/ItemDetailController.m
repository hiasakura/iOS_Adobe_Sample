//
//  ItemDetailController.m
//  ShoppingSite
//
//  Created by asakura hirofumi on 2015/01/01.
//  Copyright (c) 2015年 hirofumi. All rights reserved.
//

#import "ItemDetailController.h"
#import "ItemModel.h"
#import "ADBMobile.h"

@interface ItemDetailController ()

@end

@implementation ItemDetailController

NSString* tmpId;
NSString* tmpName;
NSString* tmpPrice;
NSString* tmpInventory;
NSString* tmpDelivery;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
        
    // 商品詳細情報の取得
    id item   = [[ItemModel alloc] init];
    tmpId        = [item getItemId:_clieckedItemImg];
    tmpName      = [item getItemName:_clieckedItemImg];
    tmpPrice     = [item getItemPrice:_clieckedItemImg];
    tmpInventory = [item getItemInventory:_clieckedItemImg];
    tmpDelivery  = [item getItemDelivery:_clieckedItemImg];
    
    _ItemDetailTitle.text  = _clickedItemTitle;
    _ItemDetailImg.image   = [UIImage imageNamed:_clieckedItemImg];
    _ItemName.text         = tmpName;
    _ItemPrice.text        = tmpPrice;
    _ItemInventory.text    = tmpInventory;
    _ItemDelivery.text     = tmpDelivery;

    // 画面の遷移元判定
    NSString* pathToItemDetail;
    if (_cateKey != nil && [_cateKey length] > 0) {
        pathToItemDetail = @"FromItemList";
        
    } else if(_cateKey == nil && [_cateKey length] == 0){
        pathToItemDetail = @"FromItemSearchResult";
    }
    
    NSMutableDictionary *contextData = [NSMutableDictionary dictionary];
    [contextData setObject:@"event1" forKey:@"&&events"];
    [contextData setObject:_ItemName.text forKey:@"eVar1"];
    [contextData setObject:pathToItemDetail forKey:@"eVar2"];
    [ADBMobile trackState:@"ItemDetail" data:contextData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// カート追加処理
- (IBAction)clickAddCart:(id)sender {
    
    [self performSegueWithIdentifier:@"CartViewSegue" sender:self];

}

// 戻るボタン処理
- (IBAction)BtnBack:(id)sender {
    NSString* backSegue;
    
    // カテゴリを辿ったかで戻り先を判定
    if (_cateKey != nil && [_cateKey length] > 0) {
        backSegue = @"BackItemList";
        
    } else if(_cateKey == nil && [_cateKey length] == 0){
        backSegue = @"BackItemSearchResult";
    }

    [self performSegueWithIdentifier:backSegue sender:self];
}

// 画面遷移処理
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"CartViewSegue"]) {
        CartViewController *cartViewCon = segue.destinationViewController;
        cartViewCon.fromItemDetail = @"CartViewSegueへ";
        cartViewCon.cateName             = _cateName;
        cartViewCon.cateKey              = _cateKey;
        cartViewCon.selectedItemTitle    = _clickedItemTitle;
        cartViewCon.selectedItemImg      = _clieckedItemImg;
        cartViewCon.selectedItemId       = tmpId;
        cartViewCon.selectedItemName     = tmpName;
        cartViewCon.selectedItemPrice    = tmpPrice;
        cartViewCon.selectedItemDelivery = tmpDelivery;
        
    } else if([segue.identifier isEqualToString:@"BackItemList"]){
        ItemListController *itemListCon = segue.destinationViewController;
        itemListCon.cateName = _cateName;
        itemListCon.cateKey  = _cateKey;
        
    }
}

// ライフサイクルメソッド
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [ADBMobile collectLifecycleData];
    return YES;
}

@end
