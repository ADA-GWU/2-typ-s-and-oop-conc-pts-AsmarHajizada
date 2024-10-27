using System;
// using Devices;

public class Program
{
    public static void Main()
    {
        Console.WriteLine("Choose your gaming device:");
        Console.WriteLine("1. Nintendo");
        Console.WriteLine("2. PlayStation");
        Console.WriteLine("3. PC");
        Console.Write("Enter your choice (1, 2, or 3): ");
        
        string choice = Console.ReadLine();
        GamingDevice chosenDevice;

        switch (choice)
        {
            case "1":
                chosenDevice = new Nintendo();
                Console.WriteLine("\nFirst, declaring the pointer to Nintendo.\n");

                Nintendo nintendo = new Nintendo();

                nintendo.LaunchGame();        // dynamic binding 
                nintendo.ConnectToInternet(); // static binding 
                nintendo.GetDeviceType();     // static binding 
                break;
            case "2":
                chosenDevice = new PlayStation();
                Console.WriteLine("\nFirst, declaring the pointer to PlayStation.\n");

                PlayStation playStation = new PlayStation();

                playStation.LaunchGame();        // dynamic binding
                playStation.ConnectToInternet(); // static binding
                playStation.GetDeviceType();     // static binding
                break;
            case "3":
                chosenDevice = new PC();
                Console.WriteLine("\nFirst, declaring the pointer to PC.\n");

                PC pc = new PC();

                pc.LaunchGame();        // dynamic binding
                pc.ConnectToInternet(); // static binding
                pc.GetDeviceType();     // static binding
                break;
            default:
                Console.WriteLine("Invalid choice. Exiting the program.");
                return;
        }

        Console.WriteLine("\nNow, using the pointer of the base class GamingDevice.\n");
        // display the outputs by calling the methods from base class pointer
        chosenDevice.LaunchGame();        // dynamic binding 
        chosenDevice.ConnectToInternet(); // static binding 
        chosenDevice.GetDeviceType();     // static binding 
    }
}