using System;

public class PC : GamingDevice
{
    // override keyword to enable overriding here
    public override void LaunchGame()
    {
        Console.WriteLine("Launching a PC game.");
    }

    // method hiding, static binding
    public new void ConnectToInternet()
    {
        Console.WriteLine("Connecting to the internet via PC's network.");
    }

    // method hiding, static binding
    public new void GetDeviceType()
    {
        Console.WriteLine("This is a PC.");
    }
}