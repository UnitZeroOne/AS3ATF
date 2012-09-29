package com.unitzeroone.atf
{
	public class ATFTextureCompressedAlpha extends ATFTextureBase
	{
		public function ATFTextureCompressedAlpha(width:int, height:int)
		{
			super(width, height);
		}
						
		override internal function serializeWith(serializer:IATFSerializer):void
		{
			//TBD
		}
		
		override public function toString():String
		{
			var s:String = super.toString();
					
			s+=super.toString();
			return s;
		}
	}
}