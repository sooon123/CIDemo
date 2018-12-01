//
//  FirstViewController.m
//  CIDemo
//
//  Created by sh on 2018/11/30.
//  Copyright © 2018年 sh. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
#ifdef PRE
    self.title = @"PRE";
#endif
}


@end
