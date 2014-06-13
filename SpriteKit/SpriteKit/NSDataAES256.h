//
//  NSDataAES256.h
//
//  Created by DANIEL ANNIS on 5/29/14.
//  Copyright (c) 2014 Dinky_Details. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (AES256)

- (NSData *)encryptedWithKey:(NSData *)key;
- (NSData *)decryptedWithKey:(NSData *)key;

@end
