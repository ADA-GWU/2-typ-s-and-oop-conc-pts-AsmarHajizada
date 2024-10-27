using System;

// base class
public class GamingDevice
{
    // virtual keyword to enable dynamic binding
    public virtual void LaunchGame()
    {
        Console.WriteLine("Launching a game on the gaming device.");
    }

    // non-virtual function
    public void ConnectToInternet()
    {
        Console.WriteLine("Connecting to the internet in a generic way.");
    }

    // non-virtual function
    public void GetDeviceType()
    {
        Console.WriteLine("This is a gaming device.");
    }
}