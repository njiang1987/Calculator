//
//  CalculatorWindow.m
//  Calculator
//
//  Created by jn11585852 on 12/3/14.
//  Copyright (c) 2014 JiangNan. All rights reserved.
//

#import "CalculatorWindow.h"

const static CGFloat kPercent191 = 0.191;
const static CGFloat kPercent382 = 0.382;
const static CGFloat kPercent618 = 0.618;
const static CGFloat kPercent809 = 0.809;

@interface CalculatorWindow ()

@property (weak) IBOutlet NSTextField *startTextField;
@property (weak) IBOutlet NSTextField *minTextField;
@property (weak) IBOutlet NSTextField *maxTextField;
@property (weak) IBOutlet NSTextField *rangeTextField;
@property (weak) IBOutlet NSTextField *midTextField;

@property (weak) IBOutlet NSTextField *higher191;
@property (weak) IBOutlet NSTextField *higher382;
@property (weak) IBOutlet NSTextField *higher618;
@property (weak) IBOutlet NSTextField *higher809;

@property (weak) IBOutlet NSTextField *highToLow191;
@property (weak) IBOutlet NSTextField *highToLow382;
@property (weak) IBOutlet NSTextField *highToLow618;
@property (weak) IBOutlet NSTextField *highToLow809;

@property (weak) IBOutlet NSTextField *lower191;
@property (weak) IBOutlet NSTextField *lower382;
@property (weak) IBOutlet NSTextField *lower618;
@property (weak) IBOutlet NSTextField *lower809;

// percent text field
@property (weak) IBOutlet NSTextField *higher191Percent;
@property (weak) IBOutlet NSTextField *higher382Percent;
@property (weak) IBOutlet NSTextField *higher618Percent;
@property (weak) IBOutlet NSTextField *higher809Percent;

@property (weak) IBOutlet NSTextField *highToLow191Percent;
@property (weak) IBOutlet NSTextField *highToLow382Percent;
@property (weak) IBOutlet NSTextField *highToLow618Percent;
@property (weak) IBOutlet NSTextField *highToLow809Percent;

@property (weak) IBOutlet NSTextField *lower191Percent;
@property (weak) IBOutlet NSTextField *lower382Percent;
@property (weak) IBOutlet NSTextField *lower618Percent;
@property (weak) IBOutlet NSTextField *lower809Percent;

@end

@implementation CalculatorWindow

- (CGFloat)startValue
{
    return [[self.startTextField stringValue] floatValue];
}

- (IBAction)runButtonDidClicked:(id)sender
{
    [self run];
}

- (IBAction)clearButtonDidClicked:(id)sender
{
    [self clear];
}

- (void)run
{
    CGFloat lMin = [[self.minTextField stringValue] floatValue];
    CGFloat lMax = [[self.maxTextField stringValue] floatValue];
    
    [self.rangeTextField setStringValue:[NSString stringWithFormat:@"%.f", lMax - lMin]];
    [self.midTextField setStringValue:[NSString stringWithFormat:@"%.2f", (lMax + lMin) / 2]];
    
    [self setHigherGroupValueMin:lMin max:lMax];
    [self setHighToLowGroupValueMin:lMin max:lMax];
    [self setLowerGroupValueMin:lMin max:lMax];
}

- (void)clear
{
    [self.minTextField setStringValue:@"0"];
    [self.maxTextField setStringValue:@"0"];
    [self.startTextField setStringValue:@"0"];
    [self.rangeTextField setStringValue:@"0"];
    [self.midTextField setStringValue:@"0"];
    
    [self setHigherGroupValueMin:0 max:0];
    [self setHighToLowGroupValueMin:0 max:0];
    [self setLowerGroupValueMin:0 max:0];
}

- (NSString*)percentStringToStart:(CGFloat)iValue
{
    CGFloat lStart = [self startValue];
    if (lStart == 0) {
        return @"";
    }
    
    CGFloat percent = (iValue - lStart) / lStart * 100;
    if (percent > 0) {
        return [NSString stringWithFormat:@"+%.2f", percent];
    }
    else{
        return [NSString stringWithFormat:@"%.2f", percent];
    }
}

- (void)setHigherGroupValueMin:(CGFloat)min max:(CGFloat)max
{
    CGFloat lMin = MIN(min, max);
    CGFloat lMax = MAX(min, max);
    CGFloat range = lMax - lMin;
    
    CGFloat lValue191 = lMax + range * kPercent191;
    CGFloat lValue382 = lMax + range * kPercent382;
    CGFloat lValue618 = lMax + range * kPercent618;
    CGFloat lValue809 = lMax + range * kPercent809;
    
    [self.higher191 setStringValue:[NSString stringWithFormat:@"%.2f", lValue191]];
    [self.higher382 setStringValue:[NSString stringWithFormat:@"%.2f", lValue382]];
    [self.higher618 setStringValue:[NSString stringWithFormat:@"%.2f", lValue618]];
    [self.higher809 setStringValue:[NSString stringWithFormat:@"%.2f", lValue809]];
    
    [self.higher191Percent setStringValue:[self percentStringToStart:lValue191]];
    [self.higher382Percent setStringValue:[self percentStringToStart:lValue382]];
    [self.higher618Percent setStringValue:[self percentStringToStart:lValue618]];
    [self.higher809Percent setStringValue:[self percentStringToStart:lValue809]];
}

- (void)setHighToLowGroupValueMin:(CGFloat)min max:(CGFloat)max
{
    CGFloat lMin = MIN(min, max);
    CGFloat lMax = MAX(min, max);
    CGFloat range = lMax - lMin;
    
    CGFloat lValue191 = lMax - range * kPercent191;
    CGFloat lValue382 = lMax - range * kPercent382;
    CGFloat lValue618 = lMax - range * kPercent618;
    CGFloat lValue809 = lMax - range * kPercent809;
    
    [self.highToLow191 setStringValue:[NSString stringWithFormat:@"%.2f", lValue191]];
    [self.highToLow382 setStringValue:[NSString stringWithFormat:@"%.2f", lValue382]];
    [self.highToLow618 setStringValue:[NSString stringWithFormat:@"%.2f", lValue618]];
    [self.highToLow809 setStringValue:[NSString stringWithFormat:@"%.2f", lValue809]];
    
    [self.highToLow191Percent setStringValue:[self percentStringToStart:lValue191]];
    [self.highToLow382Percent setStringValue:[self percentStringToStart:lValue382]];
    [self.highToLow618Percent setStringValue:[self percentStringToStart:lValue618]];
    [self.highToLow809Percent setStringValue:[self percentStringToStart:lValue809]];
}

- (void)setLowerGroupValueMin:(CGFloat)min max:(CGFloat)max
{
    CGFloat lMin = MIN(min, max);
    CGFloat lMax = MAX(min, max);
    CGFloat range = lMax - lMin;
    
    CGFloat lValue191 = lMin - range * kPercent191;
    CGFloat lValue382 = lMin - range * kPercent382;
    CGFloat lValue618 = lMin - range * kPercent618;
    CGFloat lValue809 = lMin - range * kPercent809;
    
    [self.lower191 setStringValue:[NSString stringWithFormat:@"%.2f", lValue191]];
    [self.lower382 setStringValue:[NSString stringWithFormat:@"%.2f", lValue382]];
    [self.lower618 setStringValue:[NSString stringWithFormat:@"%.2f", lValue618]];
    [self.lower809 setStringValue:[NSString stringWithFormat:@"%.2f", lValue809]];
    
    [self.lower191Percent setStringValue:[self percentStringToStart:lValue191]];
    [self.lower382Percent setStringValue:[self percentStringToStart:lValue382]];
    [self.lower618Percent setStringValue:[self percentStringToStart:lValue618]];
    [self.lower809Percent setStringValue:[self percentStringToStart:lValue809]];
}

@end
