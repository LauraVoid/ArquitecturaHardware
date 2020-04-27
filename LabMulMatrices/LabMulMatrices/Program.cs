using System;
using System.Diagnostics;

namespace LabMulMatrices
{
    class Program
    {
        public static void Main(string[] args)
        {
            bool stop = true;
            while (stop)
            {
                Console.WriteLine("Ingrese el numero n");
                String num = Console.ReadLine();
                int n = Int32.Parse(num);
                Console.WriteLine("1: version1, 2: version2, 3:version3 o otro valor para terminar");
                String ver = Console.ReadLine();
                int indice = Int32.Parse(ver);
                int[,] A = new int[n, n];
                //int[,] A = { { 1, 2, 3 }, { 4, 5, 6 }, { 7, 8, 9 } };
                int[,] B = new int[n, n];
                //int[,] B = { { 1, 2, 3 }, { 4, 5, 6 }, { 7, 8, 9 } };
                int[,] C = new int[n, n];

                switch (indice)
                {
                    case 1:
                        Program.Version1IJK(A, B, C, n);
                        break;
                    case 2:
                        Program.Version2KIJ(A, B, C, n);
                        break;
                    case 3:
                        Program.Version3JKI(A, B, C, n);
                        break;
                    default:
                        stop = false;
                        break;

                }

            }




        }
        public static void Version1IJK(int[,] A, int[,] B, int[,] C, int n)
        {
            try
            {          

                int sum = 0;
                long tiempo = 0;
              
                Stopwatch timeA = new Stopwatch();
                timeA.Restart();
                timeA.Start();

                for (int i = 0; i < n; i++)
                {
                    for (int j = 0; j < n; j++)
                    {
                        sum = 0;
                        for (int k = 0; k < n; k++)
                        { sum += A[i, k] * B[k, j]; }
                        C[i, j] += sum;
                    }
                }

                timeA.Stop();

                tiempo = (long)(timeA.Elapsed.TotalMilliseconds * 1000); //*1000000 ns; *1000 us
                Console.WriteLine("n " + n + "\n" + "version1 ijk ");
                Console.WriteLine("Tiempo " + tiempo);
               
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception: " + e.Message);
            }

        }

        public static void Version2KIJ(int[,] A, int[,] B, int[,] C, int n)
        {
            try
            {     

                int r = 0;
                long tiempo = 0;
               
                Stopwatch timeA = new Stopwatch();
                timeA.Restart();
                timeA.Start();

                for (int k = 0; k < n; k++)
                {
                    for (int i = 0; i < n; i++)
                    {
                        r = A[i, k];
                        for (int j = 0; j < n; j++)
                        {

                            C[i, j] += r * B[k, j];
                        }

                    }
                }

                timeA.Stop();

                tiempo = (long)(timeA.Elapsed.TotalMilliseconds * 1000); //*1000000 ns; *1000 us
                Console.WriteLine("n " + n + "\n" + "version2 kij");
                Console.WriteLine("Tiempo "+tiempo);
               
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception: " + e.Message);
            }

        }

        public static void Version3JKI(int[,] A, int[,] B, int[,] C, int n)
        {
            try
            {                   

                int r = 0;
                long tiempo = 0;
               
                Stopwatch timeA = new Stopwatch();
                timeA.Restart();
                timeA.Start();

                for (int j = 0; j < n; j++)
                {
                    for (int k = 0; k < n; k++)
                    {
                        r = B[k, j];
                        for (int i = 0; i < n; i++)
                        {

                            C[i, j] += A[i, k] * r;
                        }

                    }
                }

                timeA.Stop();

                tiempo = (long)(timeA.Elapsed.TotalMilliseconds * 1000); //*1000000 ns; *1000 us
                Console.WriteLine("n " + n + "\n" + "version3 jki");
                Console.WriteLine("Tiempo "+tiempo);
               
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception: " + e.Message);
            }

        }
    }

}
