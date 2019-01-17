//
//  Hashes.m
//  iXpert for iPad
//
//  Created by Felipe Rios on 11/03/12.
//  Copyright (c) 2012 FreeDeveloping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hashes : NSObject {
}

+ (NSString *)Encode:(const uint8_t *) input length:(NSInteger) length;
+ (NSString *)DecodeB64:(const char *)stringIn length:(NSInteger)length;
+ (NSString *)EncodeB64:(NSString *)stringIn;
+ (NSString *)EncodeMD5:(NSString *)stringIn;

@end
