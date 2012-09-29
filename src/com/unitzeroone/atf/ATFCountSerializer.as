package com.unitzeroone.atf
{
	import flash.utils.ByteArray;
	
	public class ATFCountSerializer implements IATFSerializer
	{
		internal var count:int = 0;
		
		public function ATFCountSerializer()
		{
		}
		
		public function get isWriter():Boolean
		{
			return true;
		}
		
		public function get isReader():Boolean
		{
			return false;
		}
		
		public function readOrWriteBlob(ba:ByteArray):ByteArray
		{
			readOrWriteU24(1337);
			if(ba != null)
				count += ba.length;
			
			return ba;
		}
		
		public function readOrWriteU8(val:uint):uint
		{
			count += 1;
			return val;
		}
		
		public function readOrWriteU24(val:uint):uint
		{
			count += 3;
			return val;
		}
		
		public function finish():void
		{
		}
	}
}