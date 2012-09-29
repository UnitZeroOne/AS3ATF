package atf
{
	import flash.utils.ByteArray;

	public class ATFTextureBase
	{
		public function get level():int
		{
			return 0;
		}
		
		private var _width:int = 0;

		public function get width():int
		{
			return _width;
		}
		
		private var _height:int = 0;

		public function get height():int
		{
			return _height;
		}
		
		public var format:uint;
			
		public function ATFTextureBase(width:int, height:int)
		{
			this._width = width;
			this._height = height;
		}
		
		internal function readOrWrite(readerWriter:IATFSerializer):void
		{
			throw new Error("Not implemented");
		}
													
		public function toString():String
		{
			var s:String = "";
			s+= "width : "+width+" height : "+height+"\n";
			return s;
		}
		
		protected function byteArrayDataToString(ba:ByteArray, name:String):String
		{
			var s:String;
			if(ba)
				s = name+" length : "+ba.length+"\n";
			else
				s ="no "+name+"\n"
					
			return s;
		}
		
	}
}