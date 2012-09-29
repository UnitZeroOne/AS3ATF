package com.unitzeroone.atf
{
	import flash.utils.ByteArray;

	public interface IATFSerializer
	{
		function get isWriter():Boolean;
		function get isReader():Boolean;
				
		function readOrWriteBlob(ba:ByteArray):ByteArray;
		function readOrWriteU8(val:uint):uint;
		function readOrWriteU24(val:uint):uint;
						
		function finish():void;
	}
}