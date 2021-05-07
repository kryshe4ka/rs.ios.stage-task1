#import "NSString+ValidNumber.h"

@implementation NSString (ValidNumber)

- (BOOL)isValidNumber {
    
    if (self == nil || [self  isEqual: @""]) {
        return false;
    }
    
    NSCharacterSet *decimalDigitCharacterSet = NSCharacterSet.decimalDigitCharacterSet;
    unichar symbol;
    
    for (int i = 0; i < self.length; i++ ) {
        symbol = [self characterAtIndex:i];
        if (![decimalDigitCharacterSet characterIsMember:symbol]) {
            return false;
        }
    }
    return true;
}

@end
