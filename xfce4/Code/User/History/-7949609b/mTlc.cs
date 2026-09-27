using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ConsoleApplicationAnagram
{
    class Program
    {
        static int size;
        static int count;
        static char[] arrChar = new char[100];
        static void Main(string[] args)
        {
            Console.Write("Masukkan kalimat : ");
            String input = Console.ReadLine();
            Console.Write("\n\n");
            size = input.Length;
            count = 0;
            for (int j = 0; j < size; j++)
                arrChar[j] = input[j];
            doAnagram(size); 
            Console.ReadLine();
        }

        private static void doAnagram(int newSize)
        {
            if (newSize == 1)
                return;
            for (int j = 0; j < newSize; j++)
            {
                doAnagram(newSize - 1);
                if (newSize == 2)
                    displayWord();
                rotate(newSize);
            }
        }
        private static void rotate(int newSize)
        {
            int j;
            int position = size - newSize;
            // Simpan huruf pertama.
            char temp = arrChar[position];
            for (j = position + 1; j < size; j++)
                // Geser huruf yang lain ke kiri.
                arrChar[j - 1] = arrChar[j];
            // Meletakkan huruf pertama ke kanan.
            arrChar[j - 1] = temp;
        }
        private static void displayWord()
        {
            if (count < 99)
                Console.Write(" ");
            if (count < 9)
                Console.Write(" ");
            Console.Write(++count + " ");
            for (int j = 0; j < size; j++)
                Console.Write(arrChar[j]);
            Console.Write(" ");
            if (count % 6 == 0)
                Console.Write("");
        }
    }
}
