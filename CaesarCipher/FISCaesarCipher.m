//
//  FISCaesarCipher.m
//  CaesarCipher
//
//  Created by Chris Gonzales on 5/29/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISCaesarCipher.h"

@implementation FISCaesarCipher

-(NSString *)encodeWithMessage:(NSString *)message andOffset:(NSInteger)key {

    NSMutableString *codedMessage = [[NSMutableString alloc] init];
    for (NSUInteger i=0; i<message.length;i++) {
        unichar asciiCode = [message characterAtIndex:i];
        for (NSUInteger k=0; k < key; k++) {
            if (asciiCode < 90 && asciiCode >= 65) {
                asciiCode = asciiCode+1;
            } else if (asciiCode < 122 && asciiCode >= 97) {
                asciiCode = asciiCode+1;
            } else if (asciiCode == 90) {
                asciiCode = 65;
            } else if (asciiCode == 122) {
                asciiCode = 97;
            }
        }
        [codedMessage appendFormat:@"%C", asciiCode];
    }
    NSLog(@"%@", codedMessage);
    return codedMessage;
}

-(NSString *)decodeWithMessage:(NSString *)encodedMessage andOffset:(NSInteger)key {

    NSMutableString *decodedMessage = [[NSMutableString alloc] init];
    for (NSUInteger i=0; i<encodedMessage.length;i++) {
        unichar asciiCode = [encodedMessage characterAtIndex:i];
        for (NSUInteger k=0; k < key; k++) {
            if (asciiCode <= 90 && asciiCode > 65) {
                asciiCode = asciiCode-1;
            } else if (asciiCode <= 122 && asciiCode > 97) {
                asciiCode = asciiCode-1;
            } else if (asciiCode == 65) {
                asciiCode = 90;
            } else if (asciiCode == 97) {
                asciiCode = 122;
            }
        }
        [decodedMessage appendFormat:@"%C", asciiCode];
    }
    NSLog(@"%@", decodedMessage);
    return decodedMessage;

}


@end
