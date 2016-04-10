//
//  SNJSFileManager.h
//  SNJSBridge
//
//  Created by Max on 16/4/10.
//  Copyright © 2016年 Max. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNJSFileManager : NSObject

+ (instancetype)shareInstance;

- (void)cacheFile:(NSString *)file
          content:(NSString *)content;
- (void)removeFile:(NSString *)file;
- (NSString *)contentForFileName:(NSString *)file;
- (BOOL)containFile:(NSString *)path;

- (void)cleanCache;
@end
