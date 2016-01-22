//
//  DrawCanvas.m
//  FingerPaintApp2
//
//  Created by Benson Huynh on 2016-01-22.
//  Copyright © 2016 Benson Huynh. All rights reserved.
//

#import "DrawCanvas.h"

@implementation DrawCanvas


- (instancetype)init
{
    self = [super init];
    if (self) {
        _paths = [[NSMutableArray alloc] init];
        _pathColours = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)awakeFromNib {
    self.paths = [[NSMutableArray alloc] init];
    self.pathColours = [[NSMutableArray alloc] init];
}

//when line starts and end it's 1 path then stores it in Arrays of path and colour
-(void)drawRect:(CGRect)rect {
    for (int i = 0; i < self.paths.count; i++) {
        UIBezierPath *path = [self.paths objectAtIndex:i];
        UIColor *pathColour = [self.pathColours objectAtIndex:i];
        [path setLineWidth:6.0];
        [pathColour setStroke];
        [path stroke];
    }
}

@end
