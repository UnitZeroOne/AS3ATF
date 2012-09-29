package com.unitzeroone.atf
{
	import flash.system.Capabilities;

	public class ATFFormat
	{
		
		public static const RGB:uint = 0;
		public static const RGB_NAME:String = "RGB";
		
		public static const RGBA:uint = 1;
		public static const RGBA_NAME:String = "RGBA";
		
		public static const COMPRESSED:uint = 2;
		public static const COMPRESSED_NAME:String = "Compressed"
		
		public static const RAW:uint = 3;
		public static const RAW_NAME:String = "Raw";
		
		public static const COMPRESSED_ALPHA:uint = 4;
		public static const COMPRESSED_ALPHA_NAME:String = "CompressedAlpha";
		
		public static const RAW_ALPHA:uint = 5;
		public static const RAW_ALPHA_NAME:String = "RawAlpha";
		
		private static var textureTypeRegistry:Vector.<Class>;
		
		public static function nameFor(b:uint):String
		{
			switch(b){
				case 0:
					return RGB_NAME;
				case 1: 
					return RGBA_NAME;
				case 2:
					return COMPRESSED_NAME;
				case 3:
					return RAW_NAME;
				default:
					return "Invalid/unknown";
			}
		}
			
		public static function minimumPlayerVersionFor(b:uint):String
		{
			switch(b){
				case 0:
				case 1:
					return "11.0.0";
				case 2:
					return "11.0.0";
				case 3:
					return "11.2.0";
				case 4:
				case 5:
					return "11.4.0";
				default:
					return "Invalid/unknown";
			}
		}
		
		public static function canBeLoadedUsingLoader(b:uint):Boolean
		{
			return b == 0 || b == 1;
		}
		
		//TODO : Really not liking doing this like this.
		public static function initializeTypeRegistry():void
		{
			textureTypeRegistry = new Vector.<Class>();
			registerTextureTypeForFormat(RGB,ATFTextureUncompressed);
			registerTextureTypeForFormat(RGBA,ATFTextureUncompressed);
			registerTextureTypeForFormat(COMPRESSED,ATFTextureCompressed);
			registerTextureTypeForFormat(RAW,ATFTextureRaw);
			
			registerTextureTypeForFormat(COMPRESSED_ALPHA, ATFTextureCompressedAlpha);
			registerTextureTypeForFormat(RAW_ALPHA,ATFTextureRawAlpha);
		}
		
		public static function textureTypeForFormat(b:uint):Class
		{
			if(textureTypeRegistry == null)
				initializeTypeRegistry();
			
			if(textureTypeRegistry[b] == null)
				throw new Error("No texture type registered for format : "+b);
			
			return textureTypeRegistry[b];
		}
		
		public static function registerTextureTypeForFormat(b:uint, t:Class):void
		{
			textureTypeRegistry[b] = t;
		}
		
	}
}