//
//  ViewController.m
//  Labb1
//
//  Created by lösen är 0000 on 2018-01-12.
//  Copyright © 2018 Petteri Tuononen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) float amountRed;
@property (nonatomic) float amountGreen;
@property (nonatomic) float amountBlue;
@property (nonatomic) float tintamountRed;
@property (nonatomic) float tintamountGreen;
@property (nonatomic) float tintamountBlue;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSUserDefaults *settings =[NSUserDefaults standardUserDefaults];
    self.amountRed = [settings floatForKey:@"bgColorRed"];
    self.amountGreen = [settings floatForKey:@"bgColorGreen"];
    self.amountBlue = [settings floatForKey:@"bgColorBlue"];
    self.tintamountRed = [settings floatForKey:@"tintColorRed"];
    self.tintamountGreen = [settings floatForKey:@"tintColorGreen"];
    self.tintamountBlue = [settings floatForKey:@"tintColorBlue"];
    
    
    [self refresh];

}
-(void) refresh{
    
    self.view.backgroundColor = [self currentColor];
    self.view.tintColor = [self currentTintColor];
}

- (UIColor*) currentColor{
    return [UIColor colorWithRed:self.amountRed
                           green:self.amountGreen
                            blue:self.amountBlue
                           alpha:1.0f];
}

- (UIColor*) currentTintColor{
    return [UIColor colorWithRed:self.tintamountRed
                           green:self.tintamountGreen
                            blue:self.tintamountBlue
                           alpha:1.0f];
}

-(void)viewWillAppear:(BOOL)animated{
    [self.inputView reloadData];
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
