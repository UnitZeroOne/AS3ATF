package atf
{
	import flash.utils.ByteArray;

	public class ATFContainer
	{
		private var _length:uint = 0;
		private var _formatByte:uint = 0;
		private var _logWidth:uint;
		private var _logHeight:uint
		private var _formatAndCube:uint;
		private var _hasMips:Boolean;
		
		public var textureCount:uint = 0;
		private var _textures:ATFTextureCollection;
		
		
		public function get textures():ATFTextureCollection
		{
			return _textures;
		}
		
		public function get logWidth():uint
		{
			return _logWidth;
		}
			
		public function get logHeight():uint
		{
			return _logHeight;
		}
		
		public function get hasMips():Boolean
		{
			return _hasMips;
		}

		public function set hasMips(value:Boolean):void
		{
			_hasMips = value;
		}
	
		public function get length():uint
		{
			return _length;
		}
				
		public function get isCube():Boolean
		{
			var b:uint = _formatAndCube;
			b&=0x80;
			b>>=7;
			return (b!=0);
		}
				
		public function set isCube(value:Boolean):void
		{
			if(value){
				_formatAndCube |= 0x80;
			}else{
				_formatAndCube &=0x7F;
			}
		}
		
		public function get format():uint
		{
			return _formatAndCube&0x7f;
		}

		public function set format(value:uint):void
		{
			_formatAndCube = value&0x7f;
		}
				
		public function get width():int
		{
			return logSizeToSize(_logWidth);
		}

		public function set width(value:int):void
		{
			validateSize(value);
			_logWidth = sizeToLogSize(value);
		}
		
		public function get height():int
		{
			return logSizeToSize(_logHeight);
		}

		public function set height(value:int):void
		{
			validateSize(value);
			_logHeight = sizeToLogSize(value);
		}
				
		public function ATFContainer()
		{
						
		}
		
		public function createTextureCollection(format:uint, isCube:Boolean, width:int, height:int , hasMips:Boolean):ATFTextureCollection
		{
			this.format = format;
			this.isCube = isCube;
			this.width = width;
			this.height = height;
			this.hasMips = hasMips;
			return _textures = new ATFTextureCollection(this);
		}
		
		public function writeToByteArray(ba:ByteArray):void
		{
			serializeWith(new ATFByteArraySerializer(ba,true));			
		}
				
		internal function serializeWith(serializer:IATFSerializer):ATFContainer
		{
			if(!(serializer.readOrWriteU8(65) == 65 && serializer.readOrWriteU8(84) == 84 && serializer.readOrWriteU8(70) == 70))
				throw new Error("Trying to read invalid ATF File");
			
			var tl:int = textures != null ? textures.byteLength : 0;
			_length = serializer.readOrWriteU24(tl+4);
			
			_formatAndCube = serializer.readOrWriteU8(_formatAndCube);
			_logWidth = serializer.readOrWriteU8(_logWidth);
			_logHeight = serializer.readOrWriteU8(_logHeight);
			textureCount = serializer.readOrWriteU8(textureCount);
			
			if(serializer.isReader)
				_textures = new ATFTextureCollection(this);
						
			textures.readOrWrite(serializer);
					
			serializer.finish();
			return this;
		}
									
		public static function readFromByteArray(bytes:ByteArray):ATFContainer
		{
			if(bytes == null)
				throw new Error("bytes can't be null");
			
			if(bytes.length == 0)
				throw new Error("no bytes available");
			
			return new ATFContainer().serializeWith(new ATFByteArraySerializer(bytes,false));
		}
		
		private static function logSizeToSize(logSize:int):int
		{
			return Math.ceil(Math.exp(logSize*Math.log(2)));
		}
		
		private static function sizeToLogSize(size:int):int
		{
			return Math.log(size) / Math.log(2); 
		}
		
		private static function validateSize(size:int):void
		{
			if(!(size > 0 && size < 2048))				
				throw new Error("Invalid size");
			
			if(!isPowerOfTwo(size))
				throw new Error("width/height need to be power of two");
		}
		
		private static function isPowerOfTwo(size:int):Boolean
		{
			return Math.pow(2, Math.round(Math.log(size)*Math.LOG2E)) == size;
		}
		
		public function toString():String
		{
			var s:String = "ATFContainer:\n";
			s+= "length : "+length+"\n";
			s+= "format : "+ATFFormat.nameFor(format)+"\n";
			s+= "can be loaded using loader : "+ATFFormat.canBeLoadedUsingLoader(format)+"\n";
			s+= "minimum player version : "+ATFFormat.minimumPlayerVersionFor(format)+"\n";
			s+= "isCube : "+isCube+"\n";
			s+= "width,height : "+width+","+height+"\n";
			s+= "textureCount : "+textureCount+"\n";
			s+= "\n";
			s+= "Textures:";
			
			if(textures)
				s+=textures.toString();
			
			return s;
		}
	}
}