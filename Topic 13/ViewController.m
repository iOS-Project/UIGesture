//
//  ViewController.m
//  Topic 13
//
//  Created by Lun Sovathana on 11/16/15.
//  Copyright © 2015 Lun Sovathana. All rights reserved.
//

#import "ViewController.h"
#import "MyUIView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // get parent point
    int x = self.view.frame.size.width/2 - 45;
    int y = self.view.frame.size.height/2 - 45;
    
    MyUIView *myView = [[MyUIView alloc] initWithFrame: CGRectMake(x, y, 90, 90)];
    
    // constrain
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(<=1)-[myView]-|"
                                            options:NSLayoutFormatAlignAllCenterY
                                            metrics:nil
                                              views:NSDictionaryOfVariableBindings(self.view, myView)];
    
    [self.view addSubview:myView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
