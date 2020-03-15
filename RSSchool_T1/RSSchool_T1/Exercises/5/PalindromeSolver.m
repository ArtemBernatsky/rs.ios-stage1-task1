#import "PalindromeSolver.h"

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {

    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:@[]];

    for (int i = 0; i < [s length]; i++) {
        NSString *ch = [s substringWithRange:NSMakeRange(i, 1)];
        [array addObject:ch];
    }

    int changeCount = 0;
    long previouseMax = 0;

    for (int i = ([n intValue] / 2); i >= 0; i -= 1) {

        NSInteger leftElement = [[array objectAtIndex: i] integerValue];
        NSInteger rightElement = [[array objectAtIndex: ([n intValue] - i - 1) ] integerValue];
        if (leftElement != rightElement) {
            previouseMax = MAX(previouseMax, MAX(leftElement, rightElement));

            array[i] = [NSString stringWithFormat:@"%ld", previouseMax];
            array[([n intValue] - i - 1)] = [NSString stringWithFormat:@"%ld", previouseMax];

            if (leftElement != previouseMax) {
                changeCount += 1;
            }

            if (rightElement != previouseMax) {
                changeCount += 1;
            }

        }

    }

    return  changeCount == [k intValue] ? [array componentsJoinedByString:@""] : @"-1";
}

@end
