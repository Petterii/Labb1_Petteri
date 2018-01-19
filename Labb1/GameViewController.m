//
//  GameViewController.m
//  Labb1
//
//  Created by lösen är 0000 on 2018-01-12.
//  Copyright © 2018 Petteri Tuononen. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()
@property (weak, nonatomic) IBOutlet UITextField *yourGuess;
@property (weak, nonatomic) IBOutlet UILabel *closeOne;
@property (nonatomic) float amountRed;
@property (nonatomic) float amountGreen;
@property (nonatomic) float amountBlue;
@property (nonatomic) int compGuess;
@property (nonatomic) BOOL winState;

@property (nonatomic) float tintamountRed;
@property (nonatomic) float tintamountGreen;
@property (nonatomic) float tintamountBlue;

@end

@implementation GameViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.compGuess = arc4random_uniform(100);
    
    self.yourGuess.keyboardType = UIKeyboardTypeNumberPad;
    
    NSUserDefaults *settings =[NSUserDefaults standardUserDefaults];
    self.amountRed = [settings floatForKey:@"bgColorRed"];
    self.amountGreen = [settings floatForKey:@"bgColorGreen"];
    self.amountBlue = [settings floatForKey:@"bgColorBlue"];
    self.tintamountRed = [settings floatForKey:@"tintColorRed"];
    self.tintamountGreen = [settings floatForKey:@"tintColorGreen"];
    self.tintamountBlue = [settings floatForKey:@"tintColorBlue"];
    
    [self refresh];
    // Do any additional setup after loading the view.
}

-(void) refresh{
    
    self.view.backgroundColor = [self currentColor];
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


-(IBAction)yourGuess:(id)sender{
    if(self.compGuess== self.yourGuess.text.intValue){
        self.winState = YES;
        self.closeOne.text = @"Graaatz";
    }
    else if(self.compGuess < self.yourGuess.text.intValue){
        self.closeOne.text = @"Too High";
    }
    else if(self.compGuess > self.yourGuess.text.intValue){
        self.closeOne.text = @"Too Low";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
//}


@end
