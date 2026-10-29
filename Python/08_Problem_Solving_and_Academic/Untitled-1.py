class Solution(object):
    def mergeAlternately(self, word1, word2):
      
	   m = ""
	   i = 0
	   while (i < len(word1)) or (i < len(word2)): 
		 
		   if (i < len(word1)): 
			   m += word1[i] 

	   	   if (i < len(word2)): 
			   m += word2[i] 
			
		   i += 1
		
	   return m
Solution S1
a = "geeks"
b = "forgeeks"

print( s1.mergeAlternately(a, b)) 
