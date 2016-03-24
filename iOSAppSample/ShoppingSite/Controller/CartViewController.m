//
//  CartViewController.m
//  ShoppingSite
//
//  Created by asakura hirofumi on 2015/01/01.
//  Copyright (c) 2015年 hirofumi. All rights reserved.
//

#import "CartViewController.h"
#import "ADBMobile.h"

@interface CartViewController ()

@end

@implementation CartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _ItemNam.text = _selectedItemName;
    _ItemPrice.text = _selectedItemPrice;
    _ItemDelivery.text = _selectedItemDelivery;

    NSMutableDictionary *contextData = [NSMutableDictionary dictionary];
    [contextData setObject:@"event2" forKey:@"&&events"];
    [ADBMobile trackState:@"CartView" data:contextData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// BuyNowボタン処理
- (IBAction)clickBuy:(id)sender {
    
    UIAlertController *alert =
    [UIAlertController alertControllerWithTitle:@"購入確認"
                                        message:@"購入します。よろしいですか。"
                                 preferredStyle:UIAlertControllerStyleAlert];

    [alert addAction:[UIAlertAction actionWithTitle:@"キャンセル"
                                              style:UIAlertActionStyleDefault
                                            handler:nil]];

    [alert addAction:[UIAlertAction actionWithTitle:@"確認"
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction *action) {
                                                [self performSegueWithIdentifier:@"ThankYouSegue" sender:self];
                                            }]];
    
    [self presentViewController:alert animated:YES completion:nil];

}

// 戻るボタン処理
- (IBAction)BtnBack:(id)sender {
    [self performSegueWithIdentifier:@"BackCartView" sender:self];
}

// 画面遷移処理
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"ThankYouSegue"]) {
        ThankYouController *thnakYouCon = segue.destinationViewController;
        thnakYouCon.fromCartView = @"ThankYouSegueへ";
        thnakYouCon.ItemId    = _selectedItemId;
        thnakYouCon.ItemName  = _selectedItemName;
        thnakYouCon.ItemPrice = _selectedItemPrice;

    } else if([segue.identifier isEqualToString:@"BackCartView"]){
        ItemDetailController *itemDetailCon = segue.destinationViewController;
        itemDetailCon.cateName = _cateName;
        itemDetailCon.cateKey  = _cateKey;
        itemDetailCon.clickedItemTitle = _selectedItemTitle;
        itemDetailCon.clieckedItemImg  = _selectedItemImg;
    }
}

// ライフサイクルメソッド
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [ADBMobile collectLifecycleData];
    return YES;
}

@end
