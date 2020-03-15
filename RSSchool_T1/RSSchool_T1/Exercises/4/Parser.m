#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {

    
    NSMutableArray<NSString*>* result = [[NSMutableArray alloc] initWithArray:@[]];
    NSString* openSymbols = @"(<[";
    NSString* closeSymbols = @")>]";
    int count = 0;

    for (int i = 0; i < [string length]; i++){
        for(int j = 0; j < [openSymbols length]; j++){
            if ([string characterAtIndex: i] == [openSymbols characterAtIndex: j]) {
                for (int k = i + 1; k < [string length]; k++) {
                    if ([string characterAtIndex: k] == [openSymbols characterAtIndex: j]) {
                        count++;
                        continue;
                    }
                    if ([string characterAtIndex: k] == [closeSymbols characterAtIndex: j] && count != 0) {
                        count--;
                        continue;
                    }
                    if ([string characterAtIndex: k] == [closeSymbols characterAtIndex: j] && count == 0) {
                        [result addObject:[string substringWithRange:NSMakeRange(i + 1, k - i - 1)]];
                        break;
                    }
                }
            }
        }
    }

    return result;
}

@end
