//
//  SettingsViewController.m
//  Labb1
//
//  Created by lösen är 0000 on 2018-01-19.
//  Copyright © 2018 Petteri Tuononen. All rights reserved.
//

#import "SettingsViewController.h"


@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISlider *amountReds;
@property (weak, nonatomic) IBOutlet UISlider *amountGreens;
@property (weak, nonatomic) IBOutlet UISlider *amountBlues;
@property (weak, nonatomic) IBOutlet UISwitch *sliderPos;
@property (weak, nonatomic) IBOutlet UILabel *switchStateText;
@property (nonatomic) float redTemp;
@property (nonatomic) float greenTemp;
@property (nonatomic) float blueTemp;
@property (nonatomic) BOOL isTempTint;
@end

@implementation SettingsViewController

- (IBAction)saveSettings:(id)sender {
    NSUserDefaults *settings =[NSUserDefaults standardUserDefaults];
  
    if(!self.redTemp){

    [settings setFloat:self.amountReds.value forKey:@"bgColorRed"];
    [settings setFloat:self.amountGreens.value forKey:@"bgColorGreen"];
    [settings setFloat:self.amountBlues.value forKey:@"bgColorBlue"];
        
    }
    else if(self.sliderPos.isOn){
        [settings setFloat:self.redTemp forKey:@"tintColorRed"];
        [settings setFloat:self.greenTemp forKey:@"tintColorGreen"];
        [settings setFloat:self.blueTemp forKey:@"tintColorBlue"];
        [settings setFloat:self.amountReds.value forKey:@"bgColorRed"];
        [settings setFloat:self.amountGreens.value forKey:@"bgColorGreen"];
        [settings setFloat:self.amountBlues.value forKey:@"bgColorBlue"];
        
    }
    else {
    [settings setFloat:self.redTemp forKey:@"bgColorRed"];
    [settings setFloat:self.greenTemp forKey:@"bgColorGreen"];
    [settings setFloat:self.blueTemp forKey:@"bgColorBlue"];
    [settings setFloat:self.amountReds.value forKey:@"tintColorRed"];
    [settings setFloat:self.amountGreens.value forKey:@"tintColorGreen"];
    [settings setFloat:self.amountBlues.value forKey:@"tintColorBlue"];
    
    }
    [settings synchronize];
        
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *settings =[NSUserDefaults standardUserDefaults];
    self.amountReds.value = [settings floatForKey:@"bgColorRed"];
    self.amountGreens.value = [settings floatForKey:@"bgColorGreen"];
    self.amountBlues.value = [settings floatForKey:@"bgColorBlue"];
    
    
    
    [self refresh];
    
    // NSUserDefaults = shared prefrences!! kolla upp lite.
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)sliderChange:(id)sender {
    
    [self refresh];
    
}
-(IBAction)backOrTint:(id)sender {
    if(self.sliderPos.isOn){
        self.switchStateText.text = @"Background Color";
    }else{
        self.switchStateText.text = @"Tint Color";
    }
    self.redTemp = self.amountReds.value;
    self.greenTemp = self.amountGreens.value;
    self.blueTemp = self.amountBlues.value;
}


-(void) refresh{
    if(self.sliderPos.isOn){
    self.view.backgroundColor = [self currentColor];
    }
    else{
        self.view.tintColor = [self currentColor];
        
    }
}

- (UIColor*) currentColor{
    return [UIColor colorWithRed:self.amountReds.value
                           green:self.amountGreens.value
                            blue:self.amountBlues.value
                           alpha:1.0f];
}
- (UIColor*) currentTintColor{
    return [UIColor colorWithRed:self.amountReds.value
                           green:self.amountGreens.value
                            blue:self.amountBlues.value
                           alpha:1.0f];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

