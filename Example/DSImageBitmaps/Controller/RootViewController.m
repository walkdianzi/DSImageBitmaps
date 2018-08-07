//
//  RootViewController.m
//  DSCategories
//
//  Created by dasheng on 15/12/17.
//  Copyright © 2015年 dasheng. All rights reserved.
//

#import "RootViewController.h"
#import "UIImage+ImageBitmaps.h"
#import "DSShowImageViewcontroller.h"
#import "UIImage+Resize.h"

@interface RootViewController(){
    
    NSDictionary *_itemsName;
}

@property (nonatomic, strong)UIImageView *showImageView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"图片转换";
    _items = @{
               
               @"图片转换":@[
                               @10,
                               @11,
                               @12,
                               @13
                               ]
             };
    
    _itemsName = @{
                   
                   @"图片转换":@[
                                @"10：converRGBA8",
                                @"11：converGray",
                                @"12：裁剪图片(切出上半部分)",
                                @"13：缩放图片"
                           ]
                   };
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.tableView reloadData];
    
    self.showImageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.tableView addSubview:self.showImageView];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[_items allKeys] count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [_items allKeys][section];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[_items objectForKey:[_items allKeys][section]] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text =  [_itemsName objectForKey:[_itemsName allKeys][indexPath.section]][indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSNumber *number =  [_items objectForKey:[_items allKeys][indexPath.section]][indexPath.row];
    switch ([number integerValue]) {
        case 10:{
            
            UIImage *image = [UIImage imageNamed:@"orgin_resize"];
            [self.showImageView setImage:image];
            NSArray *bitmapsArr = [image convertToMode:DSImageModeRGBA];
            for (int y=0; y<28; y++) {
                for (int x=0; x<28; x++) {
                    NSLog(@"y:%d x:%d",y,x);
                    NSLog(@"%@",bitmapsArr[y][x]);
                }
            }
        }
            break;
        case 11:{
            UIImage *image = [UIImage imageNamed:@"orgin_resize"];
            [self.showImageView setImage:image];
            NSArray *bitmapsArr = [image convertToMode:DSImageModeGray];
            for (int y=0; y<28; y++) {
                for (int x=0; x<28; x++) {
                    NSLog(@"y:%d x:%d",y,x);
                    NSLog(@"%@",bitmapsArr[y][x]);
                }
            }
        }
            break;
        case 12:{
            UIImage *image = [UIImage imageNamed:@"apic23847"];
            
            //适配二三倍屏幕(CGImageGetWidth获取的就是实际像素大小)
            CGImageRef imageRef = [image CGImage];
            CGSize size = CGSizeMake(CGImageGetWidth(imageRef), CGImageGetHeight(imageRef));
            NSLog(@"原像素大小：%@",[NSValue valueWithCGSize:size]);
            
            UIImage *image1 = [image croppedImageWithPixelRect:CGRectMake(0, 0, size.width, size.height/2)];
            CGImageRef imageRef1 = [image1 CGImage];
            CGSize size1 = CGSizeMake(CGImageGetWidth(imageRef1), CGImageGetHeight(imageRef1));
            NSLog(@"按像素大小裁剪：%@，现像素大小：%@",[NSValue valueWithCGSize:CGSizeMake(size.width, size.height/2)],[NSValue valueWithCGSize:size1]);
            
            
            UIImage *image2 = [image croppedImageWithRect:CGRectMake(0, 0, image.size.width, image.size.height/2)];
            CGImageRef imageRef2 = [image2 CGImage];
            CGSize size2 = CGSizeMake(CGImageGetWidth(imageRef), CGImageGetHeight(imageRef2));
            NSLog(@"按图片大小裁剪：%@，现像素大小：%@",[NSValue valueWithCGSize:CGSizeMake(image.size.width, image.size.height/2)],[NSValue valueWithCGSize:size2]);
            
            DSShowImageViewcontroller *VC = [[DSShowImageViewcontroller alloc] init];
            VC.showImage = image;
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        case 13:{
            UIImage *image = [UIImage imageNamed:@"apic23847"];
            CGImageRef imageRef = [image CGImage];
            CGSize size = CGSizeMake(CGImageGetWidth(imageRef), CGImageGetHeight(imageRef));
            NSLog(@"%@",[NSValue valueWithCGSize:size]);
            
            //按照图片大小缩放
            image = [image resizedImageToSize:CGSizeMake(325,508)];
            CGImageRef imageRef2 = [image CGImage];
            CGSize size2 = CGSizeMake(CGImageGetWidth(imageRef2), CGImageGetHeight(imageRef2));
            NSLog(@"%@",[NSValue valueWithCGSize:size2]);
            
            //按照像素大小缩放
            image = [image resizedImageToPixelSize:CGSizeMake(325,508)];
            CGImageRef imageRef3 = [image CGImage];
            CGSize size3 = CGSizeMake(CGImageGetWidth(imageRef3), CGImageGetHeight(imageRef3));
            NSLog(@"%@",[NSValue valueWithCGSize:size3]);
            DSShowImageViewcontroller *VC = [[DSShowImageViewcontroller alloc] init];
            VC.showImage = image;
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        default:
            break;
    }
}

@end
