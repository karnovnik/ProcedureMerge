package flexUnitTests
{
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertTrue;

	public class MergeTest
	{		
		private var outArray:Array 	= [];
		private var inArray1:Array	= [];
		private var inArray2:Array	= [];
		
		[Before]
		public function setUp():void
		{
			outArray = [];
			var isReverse:Boolean = (Math.random() < .5 ? true : false);
			inArray1 = getInputArray(isReverse);
			inArray2 = getInputArray(isReverse);
		}
				
		[Test] 
		public function merge():void 
		{
			outArray = ProcedureMerge.merge(inArray1, inArray2);
			
			assertEquals(outArray.length, (inArray1.length + inArray2.length));
			var inputQuals:Boolean = inArray1[0] > inArray1[inArray1.length - 1]; 
			if (inputQuals)
			{
				assertTrue(outArray[0] > outArray[outArray.length - 1]);
			}
			else
			{
				assertFalse(outArray[0] > outArray[outArray.length - 1]);
			}
		}
				
		private function getInputArray(isReverse:Boolean):Array
		{
			var returnArray:Array = [];
			var length:int = int(Math.random() * 5 + 2);
			
			for (var i:int = 0; i < length; i++) 
			{
				returnArray.push( int( Math.random() * 100 ) );
			}
			
			returnArray.sort(Array.NUMERIC);
			
			if (isReverse)
				returnArray.reverse();
			
			return returnArray;
		}
	}
}