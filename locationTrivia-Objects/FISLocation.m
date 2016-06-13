//
//  FISLocation.m
//  locationTrivia-Objects
//
//  Created by David Park on 6/13/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocation.h"

@implementation FISLocation

-(instancetype)init{
    
    self = [self initWithName:@"" latitude:0.0 longitude:0.0];
    
    return self;
}

-(instancetype)initWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    
    self = [super init];
    
    if (self) {
        _name = name;
        _latitude = latitude;
        _longitude = longitude;
        _trivia = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(NSString *)stringByTruncatingNameToLength:(NSUInteger)length {
    
    if (length < self.name.length) {
        
        NSString *subString = [self.name substringWithRange:NSMakeRange(0, length)];
        
        return subString;
    }
    
    return self.name;
}

-(BOOL)hasValidData {
    
    if (self.name == nil || [self.name isEqualToString:@""]) {
        return NO;
    } else if (self.latitude < -90.0 || self.latitude > 90.0) {
        return NO;
    } else if (self.longitude <= -180.0 || self.longitude > 180.0) {
        return NO;
    }
    
    return YES;
}

-(FISTrivium *)triviumWithMostLikes {
    
    if ([self.trivia count] == 0) {
        return nil;
    }
    
    NSSortDescriptor *sortByLikesDesc = [NSSortDescriptor sortDescriptorWithKey:@"likes" ascending:NO];
    
    NSArray *descArray = [[self.trivia sortedArrayUsingDescriptors:@[sortByLikesDesc]] mutableCopy];
    
    return descArray[0];
}

@end
