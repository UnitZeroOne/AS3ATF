package com.unitzeroone.atf
{
	import flash.utils.ByteArray;

	public class ATFTextureRawAlpha extends ATFTextureBase
	{
		
		public var dxt5Data:ByteArray;
		public var pvrtcData:ByteArray;
		public var etcData:ByteArray;
		
		public function ATFTextureRawAlpha(width:int, height:int)
		{
			super(width, height);
		}
				
		override internal function serializeWith(serializer:IATFSerializer):void
		{
			dxt5Data = serializer.readOrWriteBlob(dxt5Data);
			pvrtcData = serializer.readOrWriteBlob(pvrtcData);
			etcData = serializer.readOrWriteBlob(etcData);
		}
		
		override public function toString():String
		{
			var s:String = s+=super.toString();
			s+=byteArrayDataToString(dxt5Data,"dxt1Data");
			s+=byteArrayDataToString(pvrtcData,"pvrtcData");
			s+=byteArrayDataToString(etcData,"etcData");
			return s;
		}
	}
}