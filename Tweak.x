%hook UAUserActivityInfo

- (void)setBundleIdentifier:(NSString *)bundleIdentifier {
    NSLog(@"HookTest: bundleIdentifier = %@", bundleIdentifier);
    if ([bundleIdentifier isEqualToString:@"com.apple.mobilesafari"]) {
        bundleIdentifier = @"com.google.chrome.ios";
    }
    %orig;
}

- (void)setActivityType:(NSString *)activityType {
    NSLog(@"HookTest: activityType = %@", activityType);
    if ([activityType isEqualToString:@"NSUserActivityTypeBrowsingWeb"]) {
        activityType = @"com.google.chrome.handoff";
    }
    %orig;
}

%end

%ctor {
    %init;

    NSLog(@"HookTest: started!!!");
}
