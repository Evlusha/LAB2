using System;
using System.IO;
using System.Reflection.Metadata.Ecma335;

namespace LAB2
{
    public class StringValidator
    {
        static void Main()
        {
            Console.WriteLine("Введите текст");
            string text = Console.ReadLine();

            for (int i = 0; i < text.Length - 2; i++)
            {
                if (text[i] == text[i + 1] && text[i + 1] == text[i + 2])
                {
                    text = text.Remove(i + 2, 1).Insert(i + 2, Convert.ToString(RandomChar()));
                }
            }

            Console.WriteLine(text);
        }

        static char RandomChar()
        {
            Random random = new Random();
            char[] chars = "abcdefghijklmnopqrstuvwxyz".ToCharArray();
            return chars[random.Next(chars.Length)];
        }
    }
}
        


