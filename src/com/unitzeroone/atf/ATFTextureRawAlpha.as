package com.unitzeroone.atf
{
	public class ATFTextureRawAlpha extends ATFTextureBase
	{
		public function ATFTextureRawAlpha(width:int, height:int)
		{
			super(width, height);
		}
				
		override internal function serializeWith(serializer:IATFSerializer):void
		{
			//TBD
		}
		
		override public function toString():String
		{
			var s:String = s+=super.toString();
			
			return s;
		}
	}
}