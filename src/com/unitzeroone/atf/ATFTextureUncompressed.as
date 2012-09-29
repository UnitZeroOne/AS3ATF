package com.unitzeroone.atf
{
	
	import flash.display.BitmapData;
	import flash.utils.ByteArray;
	import flash.utils.CompressionAlgorithm;

	public class ATFTextureUncompressed extends ATFTextureBase
	{
		public var jxrData:ByteArray;
			
		public function ATFTextureUncompressed(width:int, height:int)
		{
			super(width,height);
		}
				
		override internal function serializeWith(serializer:IATFSerializer):void
		{
			jxrData = serializer.readOrWriteBlob(jxrData);
		}
									
		override public function toString():String
		{
			var s:String = super.toString();
			s+=byteArrayDataToString(jxrData,"jxrData");
			return s;
		}
	}
}