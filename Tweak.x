#import <dlfcn.h>

%hookf(void *, dlopen, const char *path, int mode)
{
	NSString* nsPath = @(path);

	if([nsPath containsString:@"MobileSubstrate/DynamicLibraries"])
	{
		return NULL;
	}

	return %orig;
}