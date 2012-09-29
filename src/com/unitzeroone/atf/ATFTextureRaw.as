package com.unitzeroone.atf
{
	import flash.utils.ByteArray;

	public class ATFTextureRaw extends ATFTextureBase
	{
		public var dxt1Data:ByteArray;
		public var pvrtcData:ByteArray;
		public var etcData:ByteArray;
				
		public function ATFTextureRaw(width:int, height:int)
		{
			super(width,height);
		}
				
		override internal function serializeWith(serializer:IATFSerializer):void
		{	
			dxt1Data = serializer.readOrWriteBlob(dxt1Data);
			pvrtcData = serializer.readOrWriteBlob(pvrtcData);
			etcData = serializer.readOrWriteBlob(etcData);
		}
				
		override public function toString():String
		{
			var s:String = super.toString();
			s+=byteArrayDataToString(dxt1Data,"dxt1Data");
			s+=byteArrayDataToString(pvrtcData,"pvrtcData");
			s+=byteArrayDataToString(etcData,"etcData");
			return s;
		}
	}
}