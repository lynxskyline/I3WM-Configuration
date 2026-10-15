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
            // Mendapatkan kalimat dari pengguna.
            Console.Write("Masukkan kalimat : ");
            String input = Console.ReadLine();
            Console.Write("\n\n");
            // Mendapatkan ukuran kalimat.
            size = input.Length;
            count = 0;
            for (int j = 0; j < size; j++)
                // Menaruh kalimat di array.
                arrChar[j] = input[j];
            doAnagram(size); // Menyusun anagram.
            Console.ReadLine();
        }

        // Metoda yang melakukan anagramisasi.
        private static void doAnagram(int newSize)
        {
            // Jika ukuran terlalu kecil
            // (dasar rekursif).
            if (newSize == 1)
                return;
            // Untuk tiap posisi.
            for (int j = 0; j < newSize; j++)
            {
                // Sisa anagram.
                doAnagram(newSize - 1);
                // Jika selesai, tampilkan!
                if (newSize == 2)
                    displayWord();
                // Lakukan rotasi kalimat.
                rotate(newSize);
            }
        }

        // Melakukan rotasi.
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

        // Menampilkan ke layar Console.
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
