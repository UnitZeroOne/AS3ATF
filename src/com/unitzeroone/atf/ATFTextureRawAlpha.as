package com.unitzeroone.atf
{
	public class ATFTextureRawAlpha extends ATFTextureBase
	{
		public function ATFTextureRawAlpha(width:int, height:int)
		{
			super(width, height);
		}
				
		override internal function readOrWrite(serializer:IATFSerializer):void
		{
			//TBD
		}
		
		override public function toString():String
		{
			var s:String = "ATFTextureCompressedAlpha :\n";
			/**s+= byteArrayDataToString(dxt1Data,"dxt1Data");
			 s+= byteArrayDataToString(dxt1JXRData,"dxt1ImageData");
			 
			 s+= byteArrayDataToString(pvrtcDataA,"pvrtcDataA");
			 s+= byteArrayDataToString(pvrtcDataB,"pvrtcDataB");
			 s+= byteArrayDataToString(pvrtcJXRData,"pvrtcJXRData");
			 
			 s+= byteArrayDataToString(etc1DataA,"etc1DataA");
			 s+= byteArrayDataToString(etc1DataB,"etc1DataB");
			 s+= byteArrayDataToString(etc1JXRData,"etc1JXRData");**/
			
			s+=super.toString();
			return s;
		}
	}
}