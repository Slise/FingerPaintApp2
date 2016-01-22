//
//  ViewController.m
//  FingerPaintApp2
//
//  Created by Benson Huynh on 2016-01-22.
//  Copyright © 2016 Benson Huynh. All rights reserved.
//

#import "ViewController.h"
#import "DrawCanvas.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet DrawCanvas *drawingCanvas;
@property (weak, nonatomic) IBOutlet UISegmentedControl *colourPicker;
@property (strong, nonatomic) UIColor *currentColour;
@property (strong, nonatomic) UIBezierPath *currentPath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.drawingCanvas.paths = [[NSMutableArray alloc] init];
    self.currentColour = [UIColor blackColor];
}

- (IBAction)chooseColour:(id)sender {
    if(self.colourPicker.selectedSegmentIndex ==0){
        self.currentColour = [UIColor blackColor];
    }else if(self.colourPicker.selectedSegmentIndex ==1){
        self.currentColour = [UIColor blueColor];
    }else if(self.colourPicker.selectedSegmentIndex ==2){
        self.currentColour = [UIColor orangeColor];
    }else if(self.colourPicker.selectedSegmentIndex ==3){
        self.currentColour = [UIColor redColor];
    }else if(self.colourPicker.selectedSegmentIndex ==4){
        self.drawingCanvas.paths = [[NSMutableArray alloc] init];
        self.drawingCanvas.pathColours = [[NSMutableArray alloc] init];
        self.currentColour = [UIColor blackColor];
        [self.drawingCanvas setNeedsDisplay];
    }else {
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0, 0.0, 0.0, 0.0);
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    self.currentPath = [UIBezierPath bezierPathWithRect:CGRectZero];
    [self.currentPath moveToPoint:[touch locationInView:self.drawingCanvas]];
    [self.drawingCanvas.paths addObject:self.currentPath];
    [self.drawingCanvas.pathColours addObject:self.currentColour];
    [self.drawingCanvas setNeedsDisplay];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self touchesEnded:touches withEvent:event];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchlocation =[touch locationInView:self.drawingCanvas];
    [self.currentPath addLineToPoint:touchlocation];
    [self.drawingCanvas setNeedsDisplay];
}

@end
