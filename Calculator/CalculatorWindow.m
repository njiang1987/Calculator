//
//  CalculatorWindow.m
//  Calculator
//
//  Created by jn11585852 on 12/3/14.
//  Copyright (c) 2014 JiangNan. All rights reserved.
//

#import "CalculatorWindow.h"

const static CGFloat kPercent191 = 0.191;
const static CGFloat kPercent238 = 0.238;
const static CGFloat kPercent500 = 0.500;
const static CGFloat kPercent682 = 0.682;

@interface CalculatorWindow ()

@property (weak) IBOutlet NSTextField *startTextField;
@property (weak) IBOutlet NSTextField *minTextField;
@property (weak) IBOutlet NSTextField *maxTextField;

@property (weak) IBOutlet NSTextField *rangeTextField;


@property (weak) IBOutlet NSTextField *higher191;
@property (weak) IBOutlet NSTextField *higher238;
@property (weak) IBOutlet NSTextField *higher500;
@property (weak) IBOutlet NSTextField *higher682;

@property (weak) IBOutlet NSTextField *highToLow191;
@property (weak) IBOutlet NSTextField *highToLow238;
@property (weak) IBOutlet NSTextField *highToLow500;
@property (weak) IBOutlet NSTextField *highToLow682;

@property (weak) IBOutlet NSTextField *lowToHigh191;
@property (weak) IBOutlet NSTextField *lowToHigh238;
@property (weak) IBOutlet NSTextField *lowToHigh500;
@property (weak) IBOutlet NSTextField *lowToHigh682;

@property (weak) IBOutlet NSTextField *lower191;
@property (weak) IBOutlet NSTextField *lower238;
@property (weak) IBOutlet NSTextField *lower500;
@property (weak) IBOutlet NSTextField *lower682;

// percent text field
@property (weak) IBOutlet NSTextField *higher191Percent;
@property (weak) IBOutlet NSTextField *higher238Percent;
@property (weak) IBOutlet NSTextField *higher500Percent;
@property (weak) IBOutlet NSTextField *higher682Percent;

@property (weak) IBOutlet NSTextField *highToLow191Percent;
@property (weak) IBOutlet NSTextField *highToLow238Percent;
@property (weak) IBOutlet NSTextField *highToLow500Percent;
@property (weak) IBOutlet NSTextField *highToLow682Percent;

@property (weak) IBOutlet NSTextField *lowToHigh191Percent;
@property (weak) IBOutlet NSTextField *lowToHigh238Percent;
@property (weak) IBOutlet NSTextField *lowToHigh500Percent;
@property (weak) IBOutlet NSTextField *lowToHigh682Percent;

@property (weak) IBOutlet NSTextField *lower191Percent;
@property (weak) IBOutlet NSTextField *lower238Percent;
@property (weak) IBOutlet NSTextField *lower500Percent;
@property (weak) IBOutlet NSTextField *lower682Percent;

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
    
    [self setHigherGroupValueMin:lMin max:lMax];
    [self setHighToLowGroupValueMin:lMin max:lMax];
    [self setLowToHighGroupValueMin:lMin max:lMax];
    [self setLowerGroupValueMin:lMin max:lMax];
}

- (void)clear
{
    [self.minTextField setStringValue:@"0"];
    [self.maxTextField setStringValue:@"0"];
    [self.startTextField setStringValue:@"0"];
    [self.rangeTextField setStringValue:@"0"];
    
    [self setHigherGroupValueMin:0 max:0];
    [self setHighToLowGroupValueMin:0 max:0];
    [self setLowToHighGroupValueMin:0 max:0];
    [self setLowerGroupValueMin:0 max:0];
}

- (NSString*)percentStringToStart:(CGFloat)iValue
{
    CGFloat lStart = [self startValue];
    if (lStart == 0) {
        return @"";
    }
    
    CGFloat percent = (iValue - lStart) / lStart;
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
    CGFloat lValue238 = lMax + range * kPercent238;
    CGFloat lValue500 = lMax + range * kPercent500;
    CGFloat lValue682 = lMax + range * kPercent682;
    
    [self.higher191 setStringValue:[NSString stringWithFormat:@"%.2f", lValue191]];
    [self.higher238 setStringValue:[NSString stringWithFormat:@"%.2f", lValue238]];
    [self.higher500 setStringValue:[NSString stringWithFormat:@"%.2f", lValue500]];
    [self.higher682 setStringValue:[NSString stringWithFormat:@"%.2f", lValue682]];
    
    [self.higher191Percent setStringValue:[self percentStringToStart:lValue191]];
    [self.higher238Percent setStringValue:[self percentStringToStart:lValue238]];
    [self.higher500Percent setStringValue:[self percentStringToStart:lValue500]];
    [self.higher682Percent setStringValue:[self percentStringToStart:lValue682]];
}

- (void)setHighToLowGroupValueMin:(CGFloat)min max:(CGFloat)max
{
    CGFloat lMin = MIN(min, max);
    CGFloat lMax = MAX(min, max);
    CGFloat range = lMax - lMin;
    
    CGFloat lValue191 = lMax - range * kPercent191;
    CGFloat lValue238 = lMax - range * kPercent238;
    CGFloat lValue500 = lMax - range * kPercent500;
    CGFloat lValue682 = lMax - range * kPercent682;
    
    [self.highToLow191 setStringValue:[NSString stringWithFormat:@"%.2f", lValue191]];
    [self.highToLow238 setStringValue:[NSString stringWithFormat:@"%.2f", lValue238]];
    [self.highToLow500 setStringValue:[NSString stringWithFormat:@"%.2f", lValue500]];
    [self.highToLow682 setStringValue:[NSString stringWithFormat:@"%.2f", lValue682]];
    
    [self.highToLow191Percent setStringValue:[self percentStringToStart:lValue191]];
    [self.highToLow238Percent setStringValue:[self percentStringToStart:lValue238]];
    [self.highToLow500Percent setStringValue:[self percentStringToStart:lValue500]];
    [self.highToLow682Percent setStringValue:[self percentStringToStart:lValue682]];
}

- (void)setLowToHighGroupValueMin:(CGFloat)min max:(CGFloat)max
{
    CGFloat lMin = MIN(min, max);
    CGFloat lMax = MAX(min, max);
    CGFloat range = lMax - lMin;
    
    CGFloat lValue191 = lMin + range * kPercent191;
    CGFloat lValue238 = lMin + range * kPercent238;
    CGFloat lValue500 = lMin + range * kPercent500;
    CGFloat lValue682 = lMin + range * kPercent682;
    
    [self.lowToHigh191 setStringValue:[NSString stringWithFormat:@"%.2f", lValue191]];
    [self.lowToHigh238 setStringValue:[NSString stringWithFormat:@"%.2f", lValue238]];
    [self.lowToHigh500 setStringValue:[NSString stringWithFormat:@"%.2f", lValue500]];
    [self.lowToHigh682 setStringValue:[NSString stringWithFormat:@"%.2f", lValue682]];
    
    [self.lowToHigh191Percent setStringValue:[self percentStringToStart:lValue191]];
    [self.lowToHigh238Percent setStringValue:[self percentStringToStart:lValue238]];
    [self.lowToHigh500Percent setStringValue:[self percentStringToStart:lValue500]];
    [self.lowToHigh682Percent setStringValue:[self percentStringToStart:lValue682]];
}

- (void)setLowerGroupValueMin:(CGFloat)min max:(CGFloat)max
{
    CGFloat lMin = MIN(min, max);
    CGFloat lMax = MAX(min, max);
    CGFloat range = lMax - lMin;
    
    CGFloat lValue191 = lMin - range * kPercent191;
    CGFloat lValue238 = lMin - range * kPercent238;
    CGFloat lValue500 = lMin - range * kPercent500;
    CGFloat lValue682 = lMin - range * kPercent682;
    
    [self.lower191 setStringValue:[NSString stringWithFormat:@"%.2f", lValue191]];
    [self.lower238 setStringValue:[NSString stringWithFormat:@"%.2f", lValue238]];
    [self.lower500 setStringValue:[NSString stringWithFormat:@"%.2f", lValue500]];
    [self.lower682 setStringValue:[NSString stringWithFormat:@"%.2f", lValue682]];
    
    [self.lower191Percent setStringValue:[self percentStringToStart:lValue191]];
    [self.lower238Percent setStringValue:[self percentStringToStart:lValue238]];
    [self.lower500Percent setStringValue:[self percentStringToStart:lValue500]];
    [self.lower682Percent setStringValue:[self percentStringToStart:lValue682]];
}

@end
