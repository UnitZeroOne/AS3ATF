package atf
{
	public class ATFTextureCollection
	{
		private var textures:Vector.<ATFTextureBase>;
		private var atfContainer:ATFContainer;		
		
		private var levels:int = 0;
		private var totalNum:int = 0;
		private var _byteLength:uint;

		public function get byteLength():uint
		{
			var atfCountSerializer:ATFCountSerializer = new ATFCountSerializer();
			for(var j:int = 0; j<textures.length; j++)
				textures[j].readOrWrite(atfCountSerializer);
			
			return atfCountSerializer.count;
		}
			
		public function ATFTextureCollection(container:ATFContainer)
		{
			this.atfContainer = container;				
			initializeVector();
		}
		
		private function initializeVector():void
		{
			levels = Math.min(atfContainer.logWidth, atfContainer.logHeight) + 1;
			totalNum = levels * (atfContainer.isCube ? 6 : 1);
			textures = new Vector.<ATFTextureBase>(totalNum, true);
			
			var textureClass:Class = ATFFormat.textureTypeForFormat(atfContainer.format);
			var w:int = atfContainer.width;
			var h:int = atfContainer.height;
			
			for(var i:int = 0; i < totalNum; i++){
				if(i%levels == 0){
					w = atfContainer.width;
					h = atfContainer.height;
				}
				
				textures[i] = new textureClass(w,h);
				w/=2;
				h/=2;
				
			}
		}
		
		internal function readOrWrite(serializer:IATFSerializer):void
		{
			var l:int = textures.length;
			for(var j:int=0; j<l; j++)
				textures[j].readOrWrite(serializer);
		}
		
		public function textureAtIndexAtFace(index:int, face:int):ATFTextureBase
		{
			var texIndex:int = levels*face + index;
			return textures[texIndex];
		}
		
		public function textureAtIndexAtFaceAsRaw(index:int, face:int):ATFTextureRaw
		{
			return textureAtIndexAtFace(index,face) as ATFTextureRaw;
		}
		
		public function textureAtIndexAtFaceAsCompressed(index:int, face:int):ATFTextureCompressed
		{
			return textureAtIndexAtFace(index,face) as ATFTextureCompressed;
		}
		
		public function textureAtIndexAtFaceAsUncompressed(index:int, face:int):ATFTextureUncompressed
		{
			return textureAtIndexAtFace(index,face) as ATFTextureUncompressed;
		}
				
		public function textureAtIndex(index:int):ATFTextureBase
		{
			return textureAtIndexAtFace(index,0);
		}
		
		public function textureAtIndexAsRaw(index:int):ATFTextureRaw
		{
			return textureAtIndex(index) as ATFTextureRaw;
		}
		
		public function textureAtIndexAsCompressed(index:int):ATFTextureCompressed
		{
			return textureAtIndex(index) as ATFTextureCompressed;	
		}
		
		public function textureAtIndexAsUncompressed(index:int):ATFTextureUncompressed
		{
			return textureAtIndex(index) as ATFTextureUncompressed;
		}
		
		public function toString():String
		{
			var s:String = "totalBytes " + byteLength;
			for(var j:int = 0; j<textures.length; j++)
				s += "\n"+ (textures[j].toString());
			return s;
		}

	}
}