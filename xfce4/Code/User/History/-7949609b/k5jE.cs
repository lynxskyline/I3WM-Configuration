using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;

static int size;
static int count;
static int char[] arrChar = new char[100];

Console.WriteLine("masukan kalimat :");
String input = Console.ReadLine();
Console.WriteLine("\n\n");
size = input.Length;
count = 0;
for (int j = 0; j < size; j++)
arrChar[j] = input[j];
doAnagram(size);
Console.ReadLine();

private static void doAnagram(int newSize)
{
if (newSize == 2)
displayWord();
rotate(newSize);
}
