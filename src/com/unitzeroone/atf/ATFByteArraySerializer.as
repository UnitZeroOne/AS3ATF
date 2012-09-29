package com.unitzeroone.atf
{
	import flash.utils.ByteArray;
	
	public class ATFByteArraySerializer implements IATFSerializer
	{
		private var bytes:ByteArray;
		private var _isWriter:Boolean = false;

		public function get isWriter():Boolean
		{
			return _isWriter;
		}

		public function get isReader():Boolean
		{
			return !_isWriter;
		}
				
		public function ATFByteArraySerializer(bytes:ByteArray, isWriter:Boolean = false)
		{
			this.bytes = bytes;
			this.bytes.position = 0;
			_isWriter = isWriter;
		}
								
		public function readOrWriteBlob(ba:ByteArray):ByteArray
		{
			if(!_isWriter){
				var length:uint = readU24();
				if(length < 1)
					return null;
				
				ba = new ByteArray();
				bytes.readBytes(ba,0,length);
				return ba;
			}
			
			if(!ba){
				writeU24(0);
				return ba;
			}
			
			writeU24(ba.length);
			ba.position = 0;
			bytes.writeBytes(ba);
			return ba;
		}
		
		public function readOrWriteU24(val:uint):uint
		{
			if(!_isWriter)
				return readU24();
				
			writeU24(val);
			return val;
		}
		
		public function readOrWriteU8(val:uint):uint
		{
			if(!_isWriter)
				return bytes.readUnsignedByte();
			
			bytes.writeByte(val);
			return val;
		}
					
		public function readU24():uint
		{
			return bytes.readUnsignedByte() << 16 | bytes.readUnsignedShort();
		}
		
		public function writeU24(val:uint):void
		{
			bytes.writeByte((val >> 16)&0xFF);
			bytes.writeShort(val&0x0000FFFF);
		}
		
		public function finish():void
		{
			if(isReader)
				bytes = null;
		}
		
	}
}