//
//  Hashes.m
//  iXpert for iPad
//
//  Created by Felipe Rios on 11/03/12.
//  Copyright (c) 2012 FreeDeveloping. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import "Hashes.h"

@implementation Hashes

#define ArrayLength(x) (sizeof(x)/sizeof(*(x)))

static char encodingTable[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
static char decodingTable[128];

+ (NSString *)Encode:(const uint8_t *) input length:(NSInteger) length {
    memset(decodingTable, 0, ArrayLength(decodingTable));
    for (NSInteger i = 0; i < ArrayLength(encodingTable); i++) {
        decodingTable[encodingTable[i]] = i;
    }
    NSMutableData* data = [NSMutableData dataWithLength:((length + 2) / 3) * 4];
    uint8_t* output = (uint8_t*)data.mutableBytes;
	
    for (NSInteger i = 0; i < length; i += 3) {
        NSInteger value = 0;
        for (NSInteger j = i; j < (i + 3); j++) {
            value <<= 8;
			
            if (j < length) {
                value |= (0xFF & input[j]);
            }
        }
		
        NSInteger index = (i / 3) * 4;
        output[index + 0] =                    encodingTable[(value >> 18) & 0x3F];
        output[index + 1] =                    encodingTable[(value >> 12) & 0x3F];
        output[index + 2] = (i + 1) < length ? encodingTable[(value >> 6)  & 0x3F] : '=';
        output[index + 3] = (i + 2) < length ? encodingTable[(value >> 0)  & 0x3F] : '=';
    }
    return [[[NSString alloc] initWithData: data encoding: NSASCIIStringEncoding] autorelease];
}

+ (NSString *)DecodeB64:(const char *)stringIn length:(NSInteger)length {
    if (length == 0) {
        return @"Empty Input String!";
    } else {
        memset(decodingTable, 0, ArrayLength(decodingTable));
        for (NSInteger i = 0; i < ArrayLength(encodingTable); i++) {
            decodingTable[encodingTable[i]] = i;
        }
        if ((stringIn == NULL) || (length % 4 != 0)) {
            return nil;
        }
	
        while (length > 0 && stringIn[length - 1] == '=') {
            length--;
        }
	
        NSInteger outputLength = length * 3 / 4;
        NSMutableData* data = [NSMutableData dataWithLength:outputLength];
        uint8_t* output = data.mutableBytes;
	
        NSInteger inputPoint = 0;
        NSInteger outputPoint = 0;
        while (inputPoint < length) {
            char i0 = stringIn[inputPoint++];
            char i1 = stringIn[inputPoint++];
            char i2 = inputPoint < length ? stringIn[inputPoint++] : 'A'; /* 'A' will decode to \0 */
            char i3 = inputPoint < length ? stringIn[inputPoint++] : 'A';
		
            output[outputPoint++] = (decodingTable[i0] << 2) | (decodingTable[i1] >> 4);
            if (outputPoint < outputLength) {
                output[outputPoint++] = ((decodingTable[i1] & 0xf) << 4) | (decodingTable[i2] >> 2);
            }
            if (outputPoint < outputLength) {
                output[outputPoint++] = ((decodingTable[i2] & 0x3) << 6) | decodingTable[i3];
            }
        }
        NSMutableString *stringOut = [[NSMutableString alloc] initWithData: data encoding: NSASCIIStringEncoding];
        if ([stringOut isEqualToString: @""]) {
            return @"Invalid Base64 Hash!";
        } else {
            return [NSString stringWithString: stringOut];
        }
        [stringOut release];
    }
}

+ (NSString *)EncodeB64:(NSString *)stringIn {
    if ([stringIn isEqualToString: @""]) {
        return @"Empty Input String!";
    } else {
        NSData *Data = [stringIn dataUsingEncoding: NSASCIIStringEncoding];
        return [self Encode: (const uint8_t*) Data.bytes length: Data.length];
    }
}

+ (NSString *)EncodeMD5:(NSString *)stringIn {
    if ([stringIn isEqualToString: @""]) {
        return @"Empty Input String!";
    } else {
        const char *cStr = [stringIn UTF8String];
        unsigned char stringOut[CC_MD5_DIGEST_LENGTH];
        CC_MD5(cStr, strlen(cStr), stringOut);
        return [[NSString stringWithFormat: @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X", stringOut[0], stringOut[1], stringOut[2], stringOut[3], stringOut[4], stringOut[5], stringOut[6], stringOut[7], stringOut[8], stringOut[9], stringOut[10], stringOut[11], stringOut[12], stringOut[13], stringOut[14], stringOut[15]] lowercaseString];
    }
}

@end
