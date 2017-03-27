//
//  ViewController.m
//  CoreImageDemo
//
//  Created by devedbox on 2017/3/24.
//  Copyright © 2017年 devedbox. All rights reserved.
//

#import "ViewController.h"
#import <CoreImage/CoreImage.h>

@interface ViewController ()
/// Image view.
@property(weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)handleFilters:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Filters" message:@"Select a filter to allpy on the image." preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"SepiaTone" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self addSepiaToneFilter];
    }]];
    [self presentViewController:alert animated:YES completion:NULL];
}

- (void)addSepiaToneFilter {
    CIContext *context = [CIContext context];
    
    CIFilter *filter = [CIFilter filterWithName:@"CISepiaTone"];
    [filter setValue:@0.8 forKey:kCIInputIntensityKey];
    
    CIImage *image = [CIImage imageWithCGImage:[UIImage imageNamed:@"image"].CGImage];
    [filter setValue:image forKey:kCIInputImageKey];
    
    CIImage *outputImage = filter.outputImage;
    
    UIImage *finalImage = [UIImage imageWithCGImage:[context createCGImage:outputImage fromRect:outputImage.extent]];
    
    _imageView.image = finalImage;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
