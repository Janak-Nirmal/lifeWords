//
//  JUSSNetworkEngine.h
//  JUSSNetworkKit
//
//  Created by JustaLiar on 08/10/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "JUSSNetworkKit.h"
/*!
 @header JUSSNetworkEngine.h
 @abstract   Represents a subclassable Network Engine for your app
 */

/*!
 *  @class JUSSNetworkEngine
 *  @abstract Represents a subclassable Network Engine for your app
 *  
 *  @discussion
 *	This class is the heart of JUSSNetworkEngine
 *  You create network operations and enqueue them here
 *  JUSSNetworkEngine encapsulates a Reachability object that relieves you of managing network connectivity losses
 *  JUSSNetworkEngine also allows you to provide custom header fields that gets appended automatically to every request
 */
@interface JUSSNetworkEngine : NSObject

/*!
 *  @abstract Initializes your network engine with a hostname
 *  
 *  @discussion
 *	Creates an engine for a given host name
 *  The hostname parameter is optional
 *  The hostname, if not null, initializes a Reachability notifier.
 *  Network reachability notifications are automatically taken care of by JUSSNetworkEngine
 *  
 */
- (id) initWithHostName:(NSString*) hostName;
/*!
 *  @abstract Initializes your network engine with a hostname and custom header fields
 *  
 *  @discussion
 *	Creates an engine for a given host name
 *  The default headers you specify here will be appened to every operation created in this engine
 *  The hostname, if not null, initializes a Reachability notifier.
 *  Network reachability notifications are automatically taken care of by JUSSNetworkEngine
 *  Both parameters are optional
 *  
 */
- (id) initWithHostName:(NSString*) hostName customHeaderFields:(NSDictionary*) headers;

/*!
 *  @abstract Initializes your network engine with a hostname
 *  
 *  @discussion
 *	Creates an engine for a given host name
 *  The hostname parameter is optional
 *  The apiPath paramter is optional
 *  The apiPath is prefixed to every call to operationWithPath: You can use this method if your server's API location is not at the root (/)
 *  The hostname, if not null, initializes a Reachability notifier.
 *  Network reachability notifications are automatically taken care of by JUSSNetworkEngine
 *  
 */
- (id) initWithHostName:(NSString*) hostName apiPath:(NSString*) apiPath customHeaderFields:(NSDictionary*) headers;
/*!
 *  @abstract Creates a simple GET Operation with a request URL
 *  
 *  @discussion
 *	Creates an operation with the given URL path.
 *  The default headers you specified in your JUSSNetworkEngine subclass gets added to the headers
 *  The HTTP Method is implicitly assumed to be GET
 *  
 */

-(JUSSNetworkOperation*) operationWithPath:(NSString*) path;

/*!
 *  @abstract Creates a simple GET Operation with a request URL and parameters
 *  
 *  @discussion
 *	Creates an operation with the given URL path.
 *  The default headers you specified in your JUSSNetworkEngine subclass gets added to the headers
 *  The body dictionary in this method gets attached to the URL as query parameters
 *  The HTTP Method is implicitly assumed to be GET
 *  
 */
-(JUSSNetworkOperation*) operationWithPath:(NSString*) path
                         params:(NSMutableDictionary*) body;

/*!
 *  @abstract Creates a simple GET Operation with a request URL, parameters and HTTP Method
 *  
 *  @discussion
 *	Creates an operation with the given URL path.
 *  The default headers you specified in your JUSSNetworkEngine subclass gets added to the headers
 *  The params dictionary in this method gets attached to the URL as query parameters if the HTTP Method is GET/DELETE
 *  The params dictionary is attached to the body if the HTTP Method is POST/PUT
 *  The HTTP Method is implicitly assumed to be GET
 */
-(JUSSNetworkOperation*) operationWithPath:(NSString*) path
                         params:(NSMutableDictionary*) body
                   httpMethod:(NSString*)method;

/*!
 *  @abstract Creates a simple GET Operation with a request URL, parameters, HTTP Method and the SSL switch
 *  
 *  @discussion
 *	Creates an operation with the given URL path.
 *  The ssl option when true changes the URL to https.
 *  The ssl option when false changes the URL to http.
 *  The default headers you specified in your JUSSNetworkEngine subclass gets added to the headers
 *  The params dictionary in this method gets attached to the URL as query parameters if the HTTP Method is GET/DELETE
 *  The params dictionary is attached to the body if the HTTP Method is POST/PUT
 *  The previously mentioned methods operationWithPath: and operationWithPath:params: call this internally
 */
-(JUSSNetworkOperation*) operationWithPath:(NSString*) path
                         params:(NSMutableDictionary*) body
                   httpMethod:(NSString*)method 
                          ssl:(BOOL) useSSL;


/*!
 *  @abstract Creates a simple GET Operation with a request URL
 *  
 *  @discussion
 *	Creates an operation with the given absolute URL.
 *  The hostname of the engine is *NOT* prefixed
 *  The default headers you specified in your JUSSNetworkEngine subclass gets added to the headers
 *  The HTTP method is implicitly assumed to be GET.
 */
-(JUSSNetworkOperation*) operationWithURLString:(NSString*) urlString;

/*!
 *  @abstract Creates a simple GET Operation with a request URL and parameters
 *  
 *  @discussion
 *	Creates an operation with the given absolute URL.
 *  The hostname of the engine is *NOT* prefixed
 *  The default headers you specified in your JUSSNetworkEngine subclass gets added to the headers
 *  The body dictionary in this method gets attached to the URL as query parameters
 *  The HTTP method is implicitly assumed to be GET.
 */
-(JUSSNetworkOperation*) operationWithURLString:(NSString*) urlString
                                       params:(NSMutableDictionary*) body;

/*!
 *  @abstract Creates a simple Operation with a request URL, parameters and HTTP Method
 *  
 *  @discussion
 *	Creates an operation with the given absolute URL.
 *  The hostname of the engine is *NOT* prefixed
 *  The default headers you specified in your JUSSNetworkEngine subclass gets added to the headers
 *  The params dictionary in this method gets attached to the URL as query parameters if the HTTP Method is GET/DELETE
 *  The params dictionary is attached to the body if the HTTP Method is POST/PUT
 *	This method can be over-ridden by subclasses to tweak the operation creation mechanism.
 *  You would typically over-ride this method to create a subclass of JUSSNetworkOperation (if you have one). After you create it, you should call [super prepareHeaders:operation] to attach any custom headers from super class.
 *  @seealso
 *  prepareHeaders:
 */
-(JUSSNetworkOperation*) operationWithURLString:(NSString*) urlString
                              params:(NSMutableDictionary*) body
                        httpMethod:(NSString*) method;

/*!
 *  @abstract adds the custom default headers
 *  
 *  @discussion
 *	This method adds custom default headers to the factory created JUSSNetworkOperation.
 *	This method can be over-ridden by subclasses to add more default headers if necessary.
 *  You would typically over-ride this method if you have over-ridden operationWithURLString:params:httpMethod:.
 *  @seealso
 *  operationWithURLString:params:httpMethod:
 */

-(void) prepareHeaders:(JUSSNetworkOperation*) operation;
/*!
 *  @abstract Handy helper method for fetching images
 *  
 *  @discussion
 *	Creates an operation with the given image URL.
 *  The hostname of the engine is *NOT* prefixed.
 *  The image is returned to the caller via MKNKImageBlock callback block. 
 */
- (JUSSNetworkOperation*)imageAtURL:(NSURL *)url onCompletion:(MKNKImageBlock) imageFetchedBlock;
/*!
 *  @abstract Enqueues your operation into the shared queue
 *  
 *  @discussion
 *	The operation you created is enqueued to the shared queue. If the response for this operation was previously cached, the cached data will be returned.
 *  @seealso
 *  enqueueOperation:forceReload:
 */
-(void) enqueueOperation:(JUSSNetworkOperation*) request;

/*!
 *  @abstract Enqueues your operation into the shared queue.
 *  
 *  @discussion
 *	The operation you created is enqueued to the shared queue. 
 *  When forceReload is NO, this method behaves like enqueueOperation:
 *  When forceReload is YES, No cached data will be returned even if cached data is available.
 *  @seealso
 *  enqueueOperation:
 */
-(void) enqueueOperation:(JUSSNetworkOperation*) operation forceReload:(BOOL) forceReload;

/*!
 *  @abstract HostName of the engine
 *  @property readonlyHostName
 *  
 *  @discussion
 *	Returns the host name of the engine
 *  This property is readonly cannot be updated. 
 *  You normally initialize an engine with its hostname using the initWithHostName:customHeaders: method
 */
@property (readonly, strong, nonatomic) NSString *readonlyHostName;

/*!
 *  @abstract Port Number that should be used by URL creating factory methods
 *  @property portNumber
 *  
 *  @discussion
 *	Set a port number for your engine if your remote URL mandates it.
 *  This property is optional and you DON'T have to specify the default HTTP port 80
 */
@property (assign, nonatomic) int portNumber;

/*!
 *  @abstract Sets an api path if it is different from root URL
 *  @property apiPath
 *  
 *  @discussion
 *	You can use this method to set a custom path to the API location if your server's API path is different from root (/) 
 *  This property is optional
 */
@property (strong, nonatomic) NSString* apiPath;

/*!
 *  @abstract Handler that you implement to monitor reachability changes
 *  @property reachabilityChangedHandler
 *  
 *  @discussion
 *	The framework calls this handler whenever the reachability of the host changes.
 *  The default implementation freezes the queued operations and stops network activity
 *  You normally don't have to implement this unless you need to show a HUD notifying the user of connectivity loss
 */
@property (copy, nonatomic) void (^reachabilityChangedHandler)(NetworkStatus ns);

/*!
 *  @abstract Registers an associated operation subclass
 *  
 *  @discussion
 *	When you override both JUSSNetworkEngine and JUSSNetworkOperation, you might want the engine's factory method
 *  to prepare operations of your JUSSNetworkOperation subclass. To create your own JUSSNetworkOperation subclasses from the factory method, you can register your JUSSNetworkOperation subclass using this method.
 *  This method is optional. If you don't use, factory methods in JUSSNetworkEngine creates JUSSNetworkOperation objects.
 */
-(void) registerOperationSubclass:(Class) aClass;
/*!
 *  @abstract Cache Directory Name
 *  
 *  @discussion
 *	This method can be over-ridden by subclasses to provide an alternative cache directory
 *  The default directory (JUSSNetworkKitCache) within the NSCaches directory will be used otherwise
 *  Overriding this method is optional
 */
-(NSString*) cacheDirectoryName;

/*!
 *  @abstract Cache Directory In Memory Cost
 *  
 *  @discussion
 *	This method can be over-ridden by subclasses to provide an alternative in memory cache size.
 *  By default, JUSSNetworkKit caches 10 recent requests in memory
 *  The default size is 10
 *  Overriding this method is optional
 */
-(int) cacheMemoryCost;

/*!
 *  @abstract Enable Caching
 *  
 *  @discussion
 *	This method should be called explicitly to enable caching for this engine.
 *  By default, JUSSNetworkKit doens't cache your requests.
 *  The cacheMemoryCost and cacheDirectoryName will be used when you turn caching on using this method.
 */
-(void) useCache;

/*!
 *  @abstract Empties previously cached data
 *  
 *  @discussion
 *	This method is a handy helper that you can use to clear cached data.
 *  By default, JUSSNetworkKit doens't cache your requests. Use this only when you enabled caching
 *  @seealso
 *  useCache
 */
-(void) emptyCache;

/*!
 *  @abstract Checks current reachable status
 *  
 *  @discussion
 *	This method is a handy helper that you can use to check for network reachability.
 */
-(BOOL) isReachable;

@end
