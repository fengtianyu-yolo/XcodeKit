//___FILEHEADER___

#import "___FILEBASENAME___.h"

@interface ___FILEBASENAME___ () <CLLocationManagerDelegate>

@property (nonatomic, strong) void (^completion)(void);
@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation ___FILEBASENAME___

- (void)didReceiveLocationPushPayload:(NSDictionary<NSString *,id> *)payload completion:(void (^)(void))completion {
    self.completion = completion;
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager requestLocation];
}

- (void)serviceExtensionWillTerminate {
    // Called just before the extension will be terminated by the system.
    self.completion();
}

#pragma mark - CLLocationManagerDelegate methods

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    // Process the location(s) as appropriate
    // CLLocation *location = locations.firstObject;

    // If sharing the locations to another user, end-to-end encrypt them to protect privacy
    
    // When finished, always call completion()
    self.completion();
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    self.completion();
}

@end
