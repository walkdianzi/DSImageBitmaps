//
//  DSShowImageViewcontroller.m
//  DSImageBitmaps
//
//  Created by dasheng on 2018/8/7.
//  Copyright © 2018年 dasheng. All rights reserved.
//

#import "DSShowImageViewcontroller.h"

@interface DSShowImageViewcontroller ()

@end

@implementation DSShowImageViewcontroller

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, 300, 250)];
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    [imageView setImage:self.showImage];
    NSLog(@"%@", [NSValue valueWithCGSize:self.showImage.size]);
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
