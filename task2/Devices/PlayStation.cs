using System;

// derived class PlayStation with overriding and method hiding
public class PlayStation : GamingDevice
{
    // override keyword to enable overriding here
    public override void LaunchGame()
    {
        Console.WriteLine("Launching a PlayStation game.");
    }

    // method hiding, static binding
    public new void ConnectToInternet()
    {
        Console.WriteLine("Connecting to the internet via PlayStation's network.");
    }

    // method hiding, static binding
    public new void GetDeviceType()
    {
        Console.WriteLine("This is a PlayStation.");
    }
}