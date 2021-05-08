#import "NumberConverter.h"

@implementation NumberConverter

- (NSArray *)numberConverter:(NSNumber *)number {
    
    NSMutableArray *characterArray = [[NSMutableArray alloc] init];
    
    if (number == nil) {
        return characterArray;
    }
    
    // если число отрицательное, то делаем его положительным. С модулем сделать не вышло, какая-то ерунда на выходе была.
    if (number.intValue < 0 ) {
        number = @(-number.intValue);
    }
    // записываем последнюю цифру в массив и делим число на 10
    while (number.intValue > 0) {
        NSInteger digit = number.intValue % 10;
        NSString *symbol = [NSString stringWithFormat:@"%lx", digit];
        // конвертировать NSInteger в NSString
        [characterArray addObject:symbol];
        number = @(number.intValue / 10);
    }
    
    return characterArray;
}

@end
