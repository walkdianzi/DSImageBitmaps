//
//  RootViewController.m
//  DSCategories
//
//  Created by dasheng on 15/12/17.
//  Copyright © 2015年 dasheng. All rights reserved.
//

#import "RootViewController.h"
#import "UIImage+ImageBitmaps.h"

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
                               @11
                               ]
             };
    
    _itemsName = @{
                   
                   @"图片转换":@[
                                @"converRGBA8",
                                @"converGray"
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
        default:
            break;
    }
}

@end
