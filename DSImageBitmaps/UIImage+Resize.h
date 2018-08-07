//
//  UIImage+Resize.h
//  DSImageBitmaps
//
//  Created by dasheng on 2018/8/6.
//

#import <UIKit/UIKit.h>

@interface UIImage (Resize)

/**
 裁剪图片大小

 @param bounds 要裁剪的图片在原图的bounds
 传入的是图片大小和位置
 如要裁剪图片的上半部分
 传入即为{0,0,image.size.width,image.size.height/2}
 */
- (UIImage *)croppedImageWithRect:(CGRect)bounds;

/**
 裁剪图片大小
 
 @param bounds 要裁剪的图片在原图的bounds
 传入的是图片像素大小和位置
 如要裁剪图片的上半部分，
 传入即为{0,0,image.size.width*[UIScreen mainScreen].scale,image.size.height/2*[UIScreen mainScreen].scale}
 或者直接获取像素大小{0,0,CGImageGetWidth(imageRef),CGImageGetHeight(imageRef)}
 */
- (UIImage *)croppedImageWithPixelRect:(CGRect)bounds;

/**
 缩放图片大小
 @param dstSize 新的图片大小
 传进去的是图片大小，最后会生成对应像素大小的图片
 如传进来为{100,100}，
 二倍屏中像素大小为{200,200}，
 三倍屏中像素大小为{300,300}，
 image.size为{100，100}
 */
- (UIImage*)resizedImageToSize:(CGSize)dstSize;

- (UIImage*)resizedImageToWidth:(CGFloat)width;

- (UIImage*)resizedImageToHeight:(CGFloat)height;

/**
 缩放图片大小
 @param dstSize 新的图片像素大小
 传进去的是像素大小，此像素大小的图片
 如传进来为{300,300}，
 二倍屏中image.size为{150,150}
 三倍屏中image.size为{100,100}
 像素大小为{100，100}
 */
- (UIImage*)resizedImageToPixelSize:(CGSize)dstSize;

- (UIImage*)resizedImageToPixelWidth:(CGFloat)width;

- (UIImage*)resizedImageToPixelHeight:(CGFloat)height;

/**
 修正图片方向
 */
- (UIImage *)fixOrientation;

@end
