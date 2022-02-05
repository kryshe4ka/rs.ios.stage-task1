#import "NSArray+MinRotated.h"

@implementation NSArray (MinRotated)

- (NSNumber *)minRotated {
    if (self == nil || self.count == 0) {
        return nil;
    }
    
    // если в массиве всего один объект -> возвращаем его
    if (self.count == 1) {
        return [self objectAtIndex:0];
    }
   
    // Простой поиск минимального числа в массиве. Сложность O(n)
//    NSNumber *min = self.firstObject;
//    for (NSNumber *number in self) {
//        if (number.intValue < min.intValue) {
//            min = number;
//        }
//    }
//    return min;
    
    // Модификация алгоритма бинарного поиска для циклично сдвинутого массива. Сложность O(logN)
    
    // Пускай массив будет отсортирован. Делим массив на две половины, отбрасываем не нужную, оставшуюся опять делим на две части и так пока не найдем нужное значение.
    
    NSUInteger low = 0;
    NSUInteger high = self.count - 1;
    NSInteger middle;

    while ([self[low] integerValue] > [self[high] integerValue]) {
        // Оператор двоичного правого сдвига >>. Значение левого операнда перемещается вправо на количество битов, указанное правым операндом. Например, при сдвиге на 2 из 0011 1100 поучим 0000 1111.
        // обычный способ mid = (left + right) / 2 вызовет переполнение на больших массивах
        // и поэтому будем использовать более правильный метод: mid = left + (right - left) / 2
        // >> 1 same as "(low + high) / 2", but avoid negative overflow and should be faster than "low + (high - low)/2"
        middle = (low + high) >> 1;
        
        // Теперь, осталось определить, в какой части массива нужно искать искомый минимальный элемент
        if ([self[middle] integerValue] > [self[high] integerValue]) {
            low = middle + 1;
        } else {
            high = middle;
        }
    }
    return [self objectAtIndex:low];
    
}

@end



// ЕЩЕ ВАРИАНТЫ:
// 1) Через KeyValueCoding:  https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/KeyValueCoding/BasicPrinciples.html#//apple_ref/doc/uid/20002170-BAJEAIEE
//- (NSNumber *)minRotated {
//    return [self valueForKeyPath:@"@min.self"];
//}

// 2) Через сортировку массива и взятие первого элемента
