using System;
using System.IO;

namespace _1_1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string[] data = new string[1000];
            string[] dataEdited = new string[1000];
            int cptr = 0;
            int firstDigit = 0;
            int lastDigit = 0;
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

            string strEdit;
            for (int i = 0; i < data.Length; ++i)
            {
                dataEdited[i] = data[i].Replace("oneight", "18").Replace("twone", "21").Replace("sevenine", "79").Replace("eightwo", "82").Replace("eightree", "83").Replace("threeight", "38").Replace("fiveight", "58").Replace("nineight", "98").Replace("one", "1").Replace("two", "2").Replace("three", "3").Replace("four", "4").Replace("five", "5").Replace("six", "6").Replace("seven", "7").Replace("eight", "8").Replace("nine", "9");
            }
            cptr = 0;
            foreach (string s in dataEdited)
            {
                checkFirstInt = true;
                Console.WriteLine("--------\n" + cptr);
                foreach (char c in s)
                {
                    if (char.IsNumber(c))
                    {
                        lastDigit = c - 48;

                        if (checkFirstInt)
                        {
                            firstDigit = lastDigit;
                            checkFirstInt = false;
                        }
                    }
                }
                fullDigit += (firstDigit * 10) + lastDigit;
                Console.WriteLine("---------------\nbase value : " + data[cptr] + "\nedited value : " + dataEdited[cptr]);
                Console.WriteLine("first : " + firstDigit + " last : " + lastDigit + " sum : " + fullDigit);
                ++cptr;
            }

            Console.Write("final result : " + fullDigit);
            Console.Read();
        }
    }
}
