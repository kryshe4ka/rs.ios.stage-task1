//
//  OddNumbers.m
//  ios.stage-task1
//
//  Created by Alex Tsybulko on 4.05.21.
//

#import <Foundation/Foundation.h>
#import "OddNumbers.h"

@implementation OddNumbers

- (NSInteger)oddNumbers:(NSArray <NSNumber *> *)array {
    
    if (array == nil || array.count == 0) {
        return 0;
    }
    
    NSNumber *number;
    int count = 0;
    
    for (number in array) {
        if (number.intValue % 2 == 1) {
            count += 1;
        }
    }
    return count;
}

@end
