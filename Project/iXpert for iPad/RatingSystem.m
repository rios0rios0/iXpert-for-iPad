//
//  RatingSystem.m
//  iXpert for iPad
//
//  Created by Felipe Rios on 11/03/12.
//  Copyright (c) 2012 FreeDeveloping. All rights reserved.
//

#import "RatingSystem.h"
#import "Hashes.h"

@implementation RatingSystem

#pragma mark ASCII Encryptation

+ (NSString *)ASCIItoHex:(NSString *)stringIn {
    if ([stringIn isEqualToString: @""]) {
        return @"Empty Input String!";
    } else {
        NSMutableString *stringOut = [[NSMutableString alloc] init];
        for (int i = 0; i < [stringIn length]; i++) {
            int c = [stringIn characterAtIndex: i];
            [stringOut appendFormat: @"%x", c];
        }
        return [[NSString stringWithString: stringOut] uppercaseString];
        [stringOut release];
    }
}

+ (NSString *)HextoASCII:(NSString *)stringIn {
    if ([stringIn isEqualToString: @""]) {
        return @"Empty Input String!";
    } else {
        @try {
            NSMutableString *stringOut = [NSMutableString string];
            for (int i = 0; i < [stringIn length]; i += 2) {
                NSString *hexChar = [stringIn substringWithRange: NSMakeRange(i, 2)];
                int value = 0;
                sscanf([hexChar cStringUsingEncoding: NSASCIIStringEncoding], "%x", &value);
                [stringOut appendFormat:@"%c", (char)value];        
            }
            return [NSString stringWithString: stringOut];
        }
        @catch (NSException *exception) {
            //TRATA O ERRO ...
            return @"Invalid ASCII Hex Number!";
        }
    }
}

+ (NSString *)ASCIItoBin:(NSString *)stringIn {
    if ([stringIn isEqualToString: @""]) {
        return @"Empty Input String!";
    } else {
        NSMutableString *stringOut = [[NSMutableString alloc] init];
        NSMutableString *stringOut2 = [[NSMutableString alloc] init];
        for (int i = 0; i < [stringIn length]; i++) {
            int c = [stringIn characterAtIndex: i];
            [stringOut appendFormat: @"%d", c];
            NSInteger theNumber = [stringOut intValue];
            [stringOut setString: @""];
            for (NSInteger numberCopy = theNumber; numberCopy > 0; numberCopy >>= 1) {
                // Prepend "0" or "1", depending on the bit
                [stringOut insertString: ((numberCopy & 1) ? @"1" : @"0") atIndex: 0];
            }
            int resum = 8 - [stringOut length];
            for (int i = 0; i < resum; i++) {
                [stringOut insertString: @"0" atIndex: 0];
            }
            [stringOut2 appendFormat: @"%@", stringOut];
            [stringOut setString: @""];
        }
        return [NSString stringWithString: stringOut2];
        [stringOut release];
        [stringOut2 release];
    }
}

+ (NSString *)BintoASCII:(NSString *)stringIn {
    if ([stringIn isEqualToString: @""]) {
        return @"Empty Input String!";
    } else {
        @try {
            NSInteger num;
            NSMutableString *stringOut = [[NSMutableString alloc] init];
            NSMutableString *stringOut2 = [[NSMutableString alloc] init];
            for (int i = 0; i < [stringIn length]; i += 8) {
                NSString *octeto = [stringIn substringWithRange: NSMakeRange(i, 8)];
                NSInteger num2;
                num2 = 0;
                for (int o = 0; o < [octeto length]; o++) {
                    num = [[octeto substringWithRange: NSMakeRange(o, 1)] integerValue];
                    num2 = num2 + (int)pow(2, ([octeto length] - o - 1)) * num;
                }
                [stringOut appendFormat: @"%x", num2];
            }
            for (int a = 0; a < [stringOut length]; a += 2) {
                NSString *hexChar = [stringOut substringWithRange: NSMakeRange(a, 2)];
                int value = 0;
                sscanf([hexChar cStringUsingEncoding: NSASCIIStringEncoding], "%x", &value);
                [stringOut2 appendFormat:@"%c", (char)value];        
            }
            return [NSString stringWithString: stringOut2];
            [stringOut release];
            [stringOut2 release];            
        }
        @catch (NSException *exception) {
            return @"Invalid ASCII Binary Number!";
        }
    }
}

+ (NSString *)ReverASCII:(NSString *)stringIn {
    if ([stringIn isEqualToString: @""]) {
        return @"Empty Input String!";
    } else {
        NSMutableString *stringOut = [[NSMutableString alloc] init];
        int len = [stringIn length];
        while (len > 0) {
            [stringOut appendFormat: @"%c", [stringIn characterAtIndex: --len]]; 
        }
        return [NSString stringWithString: stringOut];
        [stringOut release];
    }
}

+ (NSString *)ASCIItoLoo:(NSString *)stringIn {
    if ([stringIn isEqualToString: @""]) {
        return @"Empty Input String!";
    } else {
        NSString *stringOut = [[NSString alloc] init];
        NSString *resum = [[NSString alloc] init];
        resum = [self ASCIItoHex: stringIn];
        stringOut = [Hashes EncodeB64: resum];
        resum = @"";
        resum = [self ASCIItoHex: stringOut];
        return resum;
        [stringOut release];
        [resum release];
    }
}

+ (NSString *)LootoASCII:(NSString *)stringIn {
    if ([stringIn isEqualToString: @""]) {
        return @"Empty Input String!";
    } else {
        @try {
            NSString *resum = [[NSString alloc] initWithString: [self HextoASCII: stringIn]];
            NSString *Return = [[NSString alloc] initWithString: [Hashes DecodeB64: [resum cStringUsingEncoding: NSASCIIStringEncoding] length: resum.length]];
            resum = @"";
            resum = [self HextoASCII: Return];
            return resum;
            [Return release];
            [resum release];
        }
        @catch (NSException *exception) {
            return @"Invalid Loop Codification!";
        }
    }
}

#pragma mark Numeric Base Conversion

+ (NSString *)DectoHex:(NSString *)stringIn {
    if ([stringIn isEqualToString: @""]) {
        return @"Empty Input String!";
    } else {
        NSMutableString *stringOut = [[NSMutableString alloc] init];
        NSNumber *In = [NSNumber numberWithInt: [stringIn integerValue]];
        [stringOut appendFormat: @"%x", [In intValue]];
        if (([stringOut isEqualToString: @"0"]) || ([[stringOut substringWithRange: NSMakeRange(0, 1)] isEqualToString: @"-"])) {
            return @"Invalid Decimal Number!";
            [stringOut release];
        }
        return [[NSString stringWithString: stringOut] uppercaseString];
        [stringOut release];
    }
}

+ (NSString *)HextoDec:(NSString *)stringIn {
    if ([stringIn isEqualToString: @""]) {
        return @"Empty Input String!";
    } else {
        NSNumber *number;
        NSScanner *scanner;
        unsigned int tmpInt;
        scanner = [NSScanner scannerWithString: stringIn];
        [scanner scanHexInt: &tmpInt];
        number = [NSNumber numberWithInt: tmpInt];
        return [number stringValue];
    }
}

+ (NSString *)DectoBin:(NSString *)stringIn {
    if ([stringIn isEqualToString: @""]) {
        return @"Empty Input String!";
    } else {
        NSMutableString *stringOut = [[NSMutableString alloc] init];
        int theNumber = [stringIn intValue];
        for(NSInteger numberCopy = theNumber; numberCopy > 0; numberCopy >>= 1) {
            [stringOut insertString:((numberCopy & 1) ? @"1" : @"0") atIndex: 0];
        }
        return [NSString stringWithString: stringOut];
        [stringOut release];
    }
}

+ (NSString *)BintoDec:(NSString *)stringIn {
    if ([stringIn isEqualToString: @""]) {
        return @"Empty Input String!";
    } else {
        NSInteger num;
        for (int e = 0; e < [stringIn length]; e++) {
            num = [[stringIn substringWithRange: NSMakeRange(e, 1)] integerValue];
            if (num == 1 || num == 0) {
                //TRATA O ERRO ...
            } else {
                return @"Invalid Binary Number!";
            }
        }
        NSMutableString *stringOut = [[NSMutableString alloc] init];
        NSInteger num2;
        num2 = 0;
        for (int i = 0; i < [stringIn length]; i++) {
            num = [[stringIn substringWithRange: NSMakeRange(i, 1)] integerValue];
            num2 = num2 + (int)pow(2, ([stringIn length] - i - 1)) * num;
        }
        [stringOut appendFormat: @"%d", num2];
        return [NSString stringWithString: stringOut];
        [stringOut release];
    }
}

+ (NSString *)DectoOct:(NSString *)stringIn {
    if ([stringIn isEqualToString: @""]) {
        return @"Empty Input String!";
    } else {
        NSMutableString *stringOut = [[NSMutableString alloc] init];
        [stringOut appendFormat: @"%o", [stringIn integerValue]];            
        return [NSString stringWithString: stringOut];
        [stringOut release];
    }
}

+ (NSString *)OcttoDec:(NSString *)stringIn {
    if ([stringIn isEqualToString: @""]) {
        return @"Empty Input String!";
    } else {
        NSMutableString *stringOut = [[NSMutableString alloc] init];
        NSInteger num;
        NSInteger num2;
        num2 = 0;
        for (int i = 0; i < [stringIn length]; i++) {
            num = [[stringIn substringWithRange: NSMakeRange(i, 1)] integerValue];
            num2 = num2 + (int)pow(8, ([stringIn length] - i - 1)) * num;
        }
        [stringOut appendFormat: @"%d", num2];
        return [NSString stringWithString: stringOut];
        [stringOut release];
    }
}

@end