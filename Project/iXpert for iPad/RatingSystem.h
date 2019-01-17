//
//  RatingSystem.h
//  iXpert for iPad
//
//  Created by Felipe Rios on 11/03/12.
//  Copyright (c) 2012 FreeDeveloping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RatingSystem : NSObject {
}

+ (NSString *)ASCIItoHex:(NSString *)stringIn;
+ (NSString *)HextoASCII:(NSString *)stringIn;
+ (NSString *)ASCIItoBin:(NSString *)stringIn;
+ (NSString *)BintoASCII:(NSString *)stringIn;
+ (NSString *)ReverASCII:(NSString *)stringIn;
+ (NSString *)ASCIItoLoo:(NSString *)stringIn;
+ (NSString *)LootoASCII:(NSString *)stringIn;
+ (NSString *)DectoHex:(NSString *)stringIn;
+ (NSString *)HextoDec:(NSString *)stringIn;
+ (NSString *)DectoBin:(NSString *)stringIn;
+ (NSString *)BintoDec:(NSString *)stringIn;
+ (NSString *)DectoOct:(NSString *)stringIn;
+ (NSString *)OcttoDec:(NSString *)stringIn;

@end