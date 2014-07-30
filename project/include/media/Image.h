#ifndef LIME_MEDIA_IMAGE_H
#define LIME_MEDIA_IMAGE_H


#include <hx/CFFI.h>
#include <utils/ByteArray.h>


namespace lime {
	
	
	class Image {
		
		
		public:
			
			Image ();
			~Image ();
			
			void Blit (const unsigned char *data, int x, int y, int width, int height);
			void Resize (int width, int height, int bpp = 4);
			value Value ();
			
			int bpp;
			ByteArray *data;
			int height;
			int width;
		
		private:
			
			value mValue;
		
		
	};
	
	
}


#endif