//
//  TexureManager.m
//  TexurePackerForCocoa
//
//  Created by demon on 9/5/12.
//  Copyright (c) 2012 demon. All rights reserved.
//

#import "TexureManager.h"

#define ROOT_KEY                @"Root"
#define ATTRS_KEY               @"metadata"
    
#define FRAMES_KEY              @"frames"
#define FRAME_KEY               @"frame"
#define SCOURCE_COLOR_RECT      @"sourceColorRect"
#define SOURCE_SIZE             @"sourceSize"
#define OFFSET                  @"offset"

#define IMAGE_NAME_KEY          @"realTextureFileName"

#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

typedef enum
{
    ALPHA   = 3,
    BLUE    = 2,
    GREEN   = 1,
    RED     = 0
} PIXELS;

static TexureManager * _instance;

@implementation TexureManager

- (void)dealloc
{
    [texureDic release];
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self)
    {
        texureDic = [[NSMutableDictionary alloc] init];
    }
    return self;
}

+(TexureManager*)shareInstance
{
    if(!_instance) _instance = [[TexureManager alloc] init];
    return  _instance;
}

-(void)addTextureFile:(NSString*)fileName
{
    if(isRetina)fileName    = [fileName stringByAppendingString:@"-hd"];

    NSString * file         = [[NSBundle mainBundle] pathForResource:fileName
                                                              ofType:@"plist"];
    if(!file)
    {
       if(isRetina)
       {
           NSLog(@"can't file the -hd resource plist file, i'd like to use normal resource instead it");

           fileName     = [[fileName componentsSeparatedByString:@"-hd"] objectAtIndex:0];
           file         = [[NSBundle mainBundle] pathForResource:fileName
                                                          ofType:@"plist"];
       }
       else
           NSLog(@"can'd find this <%@>plist file, load texture failed",fileName);
    }
    NSDictionary * dicRoot  = [NSDictionary dictionaryWithContentsOfFile:file];
    
    NSDictionary * atts     = [dicRoot objectForKey:ATTRS_KEY];
    
    NSString * textureName  = [atts objectForKey:IMAGE_NAME_KEY];
    textureName             = [textureName stringByDeletingPathExtension];
    NSString * path         = [[NSBundle mainBundle] pathForResource:textureName
                                                              ofType:@"png"];
    UIImage * image         = [[UIImage alloc] initWithContentsOfFile:path];
   
    NSDictionary * frames   = [dicRoot objectForKey:FRAMES_KEY];
    
    int scale = isRetina?2:1;
    for (NSString *  key in [frames allKeys])
    {
        NSDictionary * keyDic= [frames objectForKey:key];
        
        NSString * frame                = [keyDic objectForKey:FRAME_KEY];
       
        NSString * sourceColorRectStr   = [keyDic objectForKey:SCOURCE_COLOR_RECT];
        NSString * sourceSizeStr        = [keyDic objectForKey:SOURCE_SIZE];
        
        
        CGSize  sourceSize              = CGSizeFromString(sourceSizeStr); 
        CGRect  sourceColorRect         = CGRectFromString(sourceColorRectStr);
        CGRect  frameRect               = CGRectFromString(frame);
        
        NSUInteger destinationWidth     = (NSUInteger)sourceSize.width;
        NSUInteger destinationHeight    = (NSUInteger)sourceSize.height;
        
        BOOL is_orientation             = [[keyDic objectForKey:@"rotated"] boolValue];

        if(is_orientation)
        {   
            frameRect       = CGRectMake(frameRect.origin.x,
                                         frameRect.origin.y,
                                         frameRect.size.height,
                                         frameRect.size.width);
        }
        
        CGImageRef ref =  CGImageCreateWithImageInRect(image.CGImage, frameRect);
        
        UIImage * saveImage     = [TexureManager createImageFrom:ref
                                                destinationWidth:destinationWidth
                                               destinationHeight:destinationHeight
                                                          offset:sourceColorRect.origin
                                                           scale:scale
                                                     orientation:is_orientation];
        
        [texureDic setObject:saveImage
                      forKey:key];
        CGImageRelease(ref);
    }
    [image release];
}

/**
 *	@brief	从Texture图中通过对.plist的解析，获取原UIImage对象
 *
 *	@param 	source 	切割后纹理图的CGImageRef指针
 *	@param 	width 	原图的宽
 *	@param 	height 	原图的高
 *	@param 	offset 	原图因为周围透明区域过大而在合成时产生的坐标偏移值
 *	@param 	scale 	尺寸（是不是retina屏）
 *	@param 	orientation 	原图是否经过旋转
 *
 *	@return	原图的UIImage对象
 */

+(UIImage*)createImageFrom:(CGImageRef)source
          destinationWidth:(NSUInteger)width
         destinationHeight:(NSUInteger)height
                    offset:(CGPoint)offset
                     scale:(int)scale
               orientation:(BOOL)orientation

{
    
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGBitmapInfo bitmapInfo = kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedLast;
    CGColorRenderingIntent renderingIntent = kCGRenderingIntentDefault;
    
    uint32_t * be_painted_pixels = (uint32_t*)malloc(width*height*sizeof(uint32_t));
    memset(be_painted_pixels, 0, width*height*sizeof(uint32_t));
    
    NSInteger src_width    = CGImageGetWidth(source);
    NSInteger src_height   = CGImageGetHeight(source);

    uint32_t * sources = (uint32_t*)malloc(src_width*src_height*sizeof(uint32_t));
    memset(sources, 0, src_width*src_height*sizeof(uint32_t));
    
    CGContextRef context = CGBitmapContextCreate(sources,
                                                 src_width,
                                                 src_height,
                                                 8,
                                                 src_width*sizeof(uint32_t),
                                                 colorSpaceRef,
                                                 bitmapInfo);
    CGContextDrawImage(context,
                       CGRectMake(0, 0, src_width, src_height),
                       source);
    
    
    for(int y = 0; y < height; y++)
    {
        for(int x = 0; x < width; x++)
        {
            uint8_t *paintedPixel   = (uint8_t *) &be_painted_pixels[y* width+x];
            
            paintedPixel[RED]      = 0;
            paintedPixel[GREEN]    = 0;
            paintedPixel[BLUE]     = 0;
            paintedPixel[ALPHA]    = 0;
        }
    }
    
    for(int y = 0; y < src_height; y++)
    {
        for(int x = 0; x < src_width; x++)
        {
            uint8_t *paintedPixel   = (uint8_t *) &be_painted_pixels[(y+(int)offset.y) * width + (int)offset.x+x];
            if(orientation)
                paintedPixel        = (uint8_t *) &be_painted_pixels[(src_height-x+(int)offset.y) * width + (int)offset.x+y];
                
            uint8_t *originPixel    = (uint8_t *) &sources[y * src_width + x];
            
            paintedPixel[RED]      = originPixel[RED];
            paintedPixel[GREEN]    = originPixel[GREEN];
            paintedPixel[BLUE]     = originPixel[BLUE];
            paintedPixel[ALPHA]    = originPixel[ALPHA];
        }
    }
    
    CGDataProviderRef provider = CGDataProviderCreateWithData(NULL,
                                                              be_painted_pixels,
                                                              width*height*sizeof(uint32_t),
                                                              providerReleaseData);
    
    CGImageRef imageRef = CGImageCreate(width,
                                        height,
                                        8,
                                        32,
                                        4*width,
                                        colorSpaceRef,
                                        bitmapInfo,
                                        provider,NULL,NO,renderingIntent);
    UIImage *newImage = [UIImage imageWithCGImage:imageRef 
                                            scale:scale 
                                      orientation:UIImageOrientationUp];
    
    CFRelease(context);
    
    CGColorSpaceRelease(colorSpaceRef);
    CGImageRelease(imageRef);
    CGDataProviderRelease(provider);
    
    //  free(be_painted_pixels);
    //  这边的be_painted_pixels照理来说应该可以安全释放的，但是我尝试了立即释放，出现在屏幕上的像素信息就不对
    //  后来查了一下还有一种方法，可以通过CGDataProviderRef在生成的时候，传入方法指针使其释放的时候进行回调
    //  Instrument测试后没有发下泄露问题，但是下面的sources立即释放的话会在console中得到incorrect checksum
    //  for freed object - object was probably modified after being freed.的警告...不懂
    free(sources);
    
    return newImage;
}

/**
 *	@brief	自建providerReleaseData方法，用以释放CGDataProviderCreateWithData中传递的数据
 *
 *	@param 	info 	CGDataProviderCreateWithData的第一个参数
 *	@param 	data 	数据就存在这里(第二个参数)
 *	@param 	size 	第三个参数
 */
static void providerReleaseData(void *info, const void *data, size_t size)
{
    free((void *)data);
}

-(UIImage*)getUIImageByName:(NSString*)imageName
{
    return [texureDic objectForKey:imageName];
}

-(NSArray*)getAllImages
{
    return texureDic.allValues;
}


@end
