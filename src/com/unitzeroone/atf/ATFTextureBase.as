package com.unitzeroone.atf
{
	import flash.utils.ByteArray;
	import flash.utils.getQualifiedClassName;

	public class ATFTextureBase
	{
		private var _width:int = 0;
		private var _height:int = 0;
				
		public function get width():int
		{
			return _width;
		}
		
		public function get height():int
		{
			return _height;
		}
		
		public function ATFTextureBase(width:int, height:int)
		{
			this._width = width;
			this._height = height;
		}
		
		internal function serializeWith(serializer:IATFSerializer):void
		{
			throw new Error("Not implemented");
		}
													
		public function toString():String
		{
			var o:String = getQualifiedClassName(this).split("::")[1]+"\n";
			var s:String = o;
			s+= "width : "+width+" height : "+height+"\n";
			return s;
		}
		
		protected function byteArrayDataToString(ba:ByteArray, name:String):String
		{
			var s:String = "";
			if(ba)
				s = name+" length : "+ba.length+"\n";
			else
				s ="no "+name+"\n"
					
			return s;
		}
		
	}
}