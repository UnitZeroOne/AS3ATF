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
				
		override internal function readOrWrite(serializer:IATFSerializer):void
		{
			jxrData = serializer.readOrWriteBlob(jxrData);
		}
		
							
		override public function toString():String
		{
			var s:String = "ATFTextureUncompressed :\n";
			s+=byteArrayDataToString(jxrData,"jxrData");
			s+=super.toString();
			return s;
		}
	}
}