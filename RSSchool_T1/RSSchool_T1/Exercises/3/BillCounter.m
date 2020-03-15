#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {

    NSMutableArray *withoutAnnDish = [[NSMutableArray alloc] initWithArray: bill];
    [withoutAnnDish removeObjectAtIndex:index];
    int annSum = [[withoutAnnDish valueForKeyPath:@"@sum.self"] intValue] / 2;

    if ([sum intValue] == annSum) {
        return  @"Bon Appetit";
    } else {
        return [NSString stringWithFormat:@"%d", [sum intValue] - annSum];
    }
}

@end
