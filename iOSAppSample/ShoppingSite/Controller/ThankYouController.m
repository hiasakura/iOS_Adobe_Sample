//
//  ThankYouController.m
//  ShoppingSite
//
//  Created by asakura hirofumi on 2015/01/01.
//  Copyright (c) 2015年 hirofumi. All rights reserved.
//

#import "ThankYouController.h"
#import "ADBMobile.h"

@interface ThankYouController ()

@end

@implementation ThankYouController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSLog(@"%@" , _ItemId);
    NSLog(@"%@" , _ItemName);
    NSLog(@"%@" , _ItemPrice);
    
    NSMutableDictionary *contextData = [NSMutableDictionary dictionary];
    [contextData setObject:@"event3" forKey:@"&&events"];
    [contextData setObject:_ItemName forKey:@"eVar4"];
    [contextData setObject:_ItemId forKey:@"eVar5"];

    NSMutableString* productsVariable = [NSMutableString stringWithString:@""];
    NSString* purchaseId = @"201501010321";
    [productsVariable appendString:@";"];       // Category
    [productsVariable appendString:_ItemName];  // Product
    [productsVariable appendString:@";1;"];     // Quantity
    [productsVariable appendString:_ItemPrice]; // Price
    NSLog(@"%@" , productsVariable);

    [contextData setObject:productsVariable forKey:@"&&products"];
    [contextData setObject:purchaseId forKey:@"purchaseid"];
    [contextData setObject:@"1" forKey:@"purchase"];
    
    [ADBMobile trackState:@"ThankYou" data:contextData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// TOPに戻るボタン処理
- (IBAction)BackToTop:(id)sender {
    [self performSegueWithIdentifier:@"BackToTopSegue" sender:self];
}

// ライフサイクルメソッド
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [ADBMobile collectLifecycleData];
    return YES;
}
@end
