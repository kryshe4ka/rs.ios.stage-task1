#import "NumberConverter.h"

@implementation NumberConverter

- (NSArray *)numberConverter:(NSNumber *)number {
    
    NSMutableArray *characterArray = [[NSMutableArray alloc] init];
    
    if (number == nil) {
        return characterArray;
    }
    
    // если число отрицательное, то делаем его положительным. С модулем сделать не вышло, какая-то ерунда на выходе была.
    // вот так с модулем надо бы но не работает abs([number intValue])
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

//  РЕШЕНИЕ ПОЛУЧШЕ
//- (NSArray *)numberConverter:(NSNumber *)number {
//
//    NSString *numberAsString = [NSString stringWithFormat:@"%d", abs([number intValue])];
//    NSMutableArray *chars = [[NSMutableArray alloc] initWithCapacity:[numberAsString length]];
//
//    for (int i=0; i < [numberAsString length]; i++) {
//        NSString *iChar  = [NSString stringWithFormat:@"%c", [numberAsString characterAtIndex:i]];
//        [chars addObject:iChar];
//    }
//
//    NSArray *invertedArray = [[chars reverseObjectEnumerator] allObjects];
//    return invertedArray;
//}
