using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Net.Mime.MediaTypeNames;

namespace Lab2_ZD1
{
    internal class zd2
    {

        static void Main2()
        {
  
            string[] text = { "1", "2", "3", "2" };
            int uniqueTextCount = Repac(text);
            Console.WriteLine("Количество уникальных слов на азбуке Морзе: " + uniqueTextCount);
        }

        static int Repac(string[] text)
        {
            HashSet<string> uniqueText = new HashSet<string>();// хранения уникальных строк

            foreach (var word in text) //итерация по каждому элементу word в массиве text.
            {
                char[] morseChars = word.ToCharArray();
                Array.Sort(morseChars); //сортируются по алфавиту с помощью метода Array.Sort(). //	Копирует знаки из указанной подстроки данного экземпляра в массив знаков Юникода.
                string normalizedWord = new string(morseChars);// Отсортированные символы объединяются обратно в строку с помощью конструктора new string(morseChars), и результат сохраняется в переменную normalizedWord.
                uniqueText.Add(normalizedWord);//добавляется в HashSet uniqueText с помощью метода Add()
            }

            return uniqueText.Count;
        }
    }
}
