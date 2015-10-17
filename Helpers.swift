//
//  Helpers.swift
//  Ten
//
//  Created by Yumen Cao on 10/3/15.
//  Copyright © 2015 LiMao Tech. All rights reserved.
//

import Foundation

func getDataFromUrl(urL:NSURL, completion: ((data: NSData?) -> Void)) {
    NSURLSession.sharedSession().dataTaskWithURL(urL) { (data, response, error) in
        completion(data: data)
        }.resume()
}

/*
func downLoadImageWithURL(url : NSURL) -> Void {
    let request = NSURLRequest(URL: url)
    NSURLConnection.sendAsynchronousRequest(request,
        queue: NSOperationQueue.mainQueue(),
        completionHandler: <#T##(NSURLResponse?, NSData?, NSError?) -> Void#>)
}
    

- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
        queue:[NSOperationQueue mainQueue]
        completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if ( !error )
        {
        UIImage *image = [[UIImage alloc] initWithData:data];
        completionBlock(YES,image);
        } else{
        completionBlock(NO,nil);
        }
        }];
}
*/
