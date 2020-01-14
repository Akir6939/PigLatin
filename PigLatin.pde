public void setup() 
{
	//commented out the standard piglatin, if you want to piglatin the regular one comment out the piglatinlines
	/*String[] lines = loadStrings("words.txt");
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) 
	{
	  System.out.println(pigLatin(lines[i]));
	}*/
	String[] lines = loadStrings("LowellHymn.txt");
	System.out.println("there are "+lines.length+" lines");
	for(int i = 0;i<lines.length;i++)
		System.out.println(pigLatinLines(lines[i]));
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
		case 'A':
		case 'E':
		case 'I':
		case 'O':
		case 'U':
		return i;
	}

	}
	return -1;
}
public String pigLatinLines(String sLine){
	if(sLine.length()==0) return sLine;
	int subStart = 0;
	String ret = "";
	for(int i = 0;i<sLine.length();i++){
		if(!(Character.isLetter(sLine.charAt(i))||sLine.charAt(i)==39||sLine.charAt(i)==45)){
			ret+=pigLatin(sLine.substring(subStart,i))+" ";
			subStart = i+1;
		}
	}
	return ret.substring(0,1).toUpperCase()+ret.substring(1).toLowerCase();
}
public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{	
	if(sWord.length()==0)
		return "";
	if(sWord.length()>2&&sWord.substring(0,2).equals("qu"))
		return sWord.substring(2)+"quay";
	switch (findFirstVowel(sWord)){
		case -1:
		return sWord+"ay";
		case 0:
		return sWord+"way";
		default:
		return sWord.substring(findFirstVowel(sWord))+sWord.substring(0,findFirstVowel(sWord))+"ay";
		}
	
	
}
