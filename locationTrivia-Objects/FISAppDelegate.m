//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

-(NSArray *)allLocationNames {
    
    NSMutableArray *namesArray = [[NSMutableArray alloc] init];
    for (FISLocation *items in self.locations) {
        [namesArray addObject:items.name];
    }
    
    return namesArray;
}

-(FISLocation *)locationNamed:(NSString *)name {
    
    for (FISLocation *item in self.locations) {
        if ([item.name isEqualToString:name]) {
            return item;
        }
    }

    return nil;
}

-(NSArray *)locationsNearLatitude:(CGFloat)latitude longitude:(CGFloat)longitude margin:(CGFloat)margin {
    
    NSMutableArray *closeByLocations = [[NSMutableArray alloc] init];
    
    for (FISLocation *place in self.locations) {
        if (fabs(place.latitude - latitude) <= margin && fabs(place.longitude - longitude) <= margin) {
            [closeByLocations addObject:place];
        }
    }
    
    return closeByLocations;
}

@end
