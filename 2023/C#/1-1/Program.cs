using System;
using System.IO;

namespace _1_1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string[] data = new string[1000];
            int cptr = 0;
            int firstDigit = 0;
            int lastDigit = 0;
            string fullDigitString;
            int fullDigit = 0;
            bool checkFirstInt = true;
            StreamReader sr = new StreamReader("../../donnee.txt");
            try
            {
                string line;
                while ((line = sr.ReadLine()) != null)
                {
                    data[cptr] = line;
                    cptr++;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("error : " + ex);
                Console.Read();
            }

            foreach(string s in data)
            {
                foreach(char c in s)
                {
                    if(char.IsNumber(c))
                    {
                        lastDigit = c-48;

                        if (checkFirstInt)
                        {
                            firstDigit = lastDigit;
                            checkFirstInt = false;
                        }
                    }
                }
                checkFirstInt = true;
                fullDigitString = firstDigit + "" + lastDigit;
                fullDigit += Convert.ToInt32(fullDigitString);
                Console.WriteLine("first : " + firstDigit + " last : " + lastDigit + "full : " + fullDigit);
            }

            Console.Write(fullDigit);
            Console.Read();
        }
    }
}
