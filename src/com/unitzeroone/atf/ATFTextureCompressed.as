package com.unitzeroone.atf
{
	import flash.utils.ByteArray;
	
	public class ATFTextureCompressed extends ATFTextureBase
	{
		public var dxt1Data:ByteArray;
		public var dxt1JXRData:ByteArray;
		
		public var pvrtcDataA:ByteArray;
		public var pvrtcDataB:ByteArray;
		public var pvrtcJXRData:ByteArray;
		
		public var etc1DataA:ByteArray;
		public var etc1DataB:ByteArray;
		public var etc1JXRData:ByteArray;
				
		public function ATFTextureCompressed(width:int, height:int)
		{
			super(width, height);
		}
				
		override internal function serializeWith(serializer:IATFSerializer):void
		{
			//DXT1
			dxt1Data = serializer.readOrWriteBlob(dxt1Data);
			dxt1JXRData = serializer.readOrWriteBlob(dxt1JXRData);
			
			//PVRTC		
			pvrtcDataA = serializer.readOrWriteBlob(pvrtcDataA);
			pvrtcDataB = serializer.readOrWriteBlob(pvrtcDataB);
			pvrtcJXRData = serializer.readOrWriteBlob(pvrtcJXRData);
			
			//etc
			etc1DataA = serializer.readOrWriteBlob(etc1DataA);
			etc1DataB = serializer.readOrWriteBlob(etc1DataB);
			etc1JXRData = serializer.readOrWriteBlob(etc1JXRData);
		}
								
		override public function toString():String
		{
			var s:String = super.toString();
			s+= byteArrayDataToString(dxt1Data,"dxt1Data");
			s+= byteArrayDataToString(dxt1JXRData,"dxt1ImageData");
			
			s+= byteArrayDataToString(pvrtcDataA,"pvrtcDataA");
			s+= byteArrayDataToString(pvrtcDataB,"pvrtcDataB");
			s+= byteArrayDataToString(pvrtcJXRData,"pvrtcJXRData");
			
			s+= byteArrayDataToString(etc1DataA,"etc1DataA");
			s+= byteArrayDataToString(etc1DataB,"etc1DataB");
			s+= byteArrayDataToString(etc1JXRData,"etc1JXRData");
						
			return s;
		}	
	}
}