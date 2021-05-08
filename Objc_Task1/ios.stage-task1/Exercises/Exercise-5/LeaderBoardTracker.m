#import "LeaderBoardTracker.h"

@interface LeaderBoardTracker()

@property (nonatomic, strong) NSArray <NSNumber *> *playersPlaces;

@end

@implementation LeaderBoardTracker

- (NSArray <NSNumber *> *)trackLeaderBoard:(NSArray <NSNumber *> *)rankedArray
                               playerArray:(NSArray <NSNumber *> *)playerArray {
    
    // Нужно обязательно инициализировать пустым массивом, иначе невозможно добавить объект внутрь
    NSMutableArray *playerRank = [NSMutableArray array];
    
    if ([playerArray  isEqual: @[]]) {
        return playerRank;
    }
    
    
    // Initialise a new, empty mutable array
    NSMutableArray *uniqueRankedArray = [NSMutableArray array];
    
    // делаем массив рангов уникальным, чтобы (индекс ранга +1) соотвествовал скору
    for (id obj in rankedArray) {
        if (![uniqueRankedArray containsObject:obj]) {
            [uniqueRankedArray addObject:obj];
        }
    }
   
    for (int i = 0; i < playerArray.count; i++) {
        
        // обнуляем флаг
        _Bool flag = NO;

        for (int j = 0; j < uniqueRankedArray.count; j++) {
            if ([playerArray[i] integerValue] == [uniqueRankedArray[j] integerValue]) {
                // так как ранг начинается с 1 а не с 0, то прибавляем к индексу 1
                NSNumber *rank = @(j+1);
                [playerRank addObject:rank];
                // если мы нашли подходящий ранк, то меняем флаг
                flag = YES;
                // если нашли, то нужно выйти из текущей итерации (чтобы не зациклиться)
                break;
            } else if ([playerArray[i] integerValue] > [uniqueRankedArray[j] integerValue]) {
                NSNumber *rank = @(j+1);
                [playerRank addObject:@([rank integerValue])];
                [uniqueRankedArray insertObject:playerArray[i] atIndex:j];
                // если мы нашли подходящий ранк, то меняем флаг
                flag = YES;
                // если нашли, то нужно выйти из текущей итерации
                break;
            }
        }
        
        // если в цикле вышле ранк не нашелся, то значит наш скор ниже всех, поэтому нужно присвоить последний+1 и занести новое значение в массив рангов
        if (!flag) {
            NSNumber *rank = @(1+ uniqueRankedArray.count);
            [playerRank addObject:@([rank integerValue])];
            [uniqueRankedArray addObject:playerArray[i]];
        }
        
    }
    
    return playerRank;
 
}

@end
