package
{
	import flash.display.Sprite;
	
	public class ProcedureMerge extends Sprite
	{
		public function ProcedureMerge()
		{
		}
		
		// in fact it is procedure merge of MergeSort algorithm with one addition to save order sort
		public static function merge(array1:Array, array2:Array):Array
		{
			var length1:int = array1.length;
			var length2:int = array2.length;
			var len:int = length1 + length2;
			var resultArray:Array = [];
			
			// this condition needs to save order of sort.  
			if (array1[0] < array1[length1 - 1] || array2[0] < array2[length2 - 1])
			{
				var count1:int = 0;
				var count2:int = 0;
				
				for (var j:int = 0; j < len; j++) 
				{
					if (array1[count1] < array2[count2])
					{
						resultArray.push(array1[count1]);
						count1++;
					}
					else
					{
						resultArray.push(array2[count2]);
						count2++;
					}
					
					if (count1 == length1)
					{
						resultArray = resultArray.concat(array2.slice(count2, length2));
						break;
					}
					
					if (count2 == length2)
					{
						resultArray = resultArray.concat(array1.slice(count1, length1));
						break;
					}
				}
			}
			else
			{
				count1 = length1 - 1;
				count2 = length2 - 1;
				
				for (j = 0; j < len; j++) 
				{
					if (array1[count1] < array2[count2])
					{
						resultArray.unshift(array1[count1]);
						count1--;
					}
					else
					{
						resultArray.unshift(array2[count2]);
						count2--;
					}
					
					if (count1 < 0)
					{
						resultArray.unshift(array2.slice(0, count2 + 1));
						break;
					}
					
					if (count2 < 0)
					{
						resultArray.unshift(array1.slice(0, count1 + 1));
						break;
					}
				}
			}
			
			return resultArray;
		}
	}
}