public void setup() 
{
	String[] lines = loadStrings("words.txt");
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) 
	{
	  System.out.println(pigLatin(lines[i]));
	}
}
public void draw()
{
        //not used
}
public int findFirstVowel(String sWord)
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
	for(int i = 0;i<sWord.length();i++){
		switch (sWord.charAt(i)){
		case 'a':
		case 'e':
		case 'i':
		case 'o':
		case 'u':
		return i;
	}

	}
	return -1;
}

public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{	
	if(sWord.substring(0,2).equals("qu"))
		return sWord.substring(2)+"quay";
	switch (findFirstVowel(sWord)){
		case -1:
		return sWord+"ay";
		case 0:
		return sWord+"way";
		default:
		return sWord.substring(findFirstVowel(sWord))+sWord.substring(0,findFirstVowel(sWord))+"ay";
		}
	/*if(findFirstVowel(sWord) == -1)
	{
		return sWord + "ay";
	}
	else
	{
		return "ERROR!";
	}*/
}
