using System;

public class Nintendo : GamingDevice
{
    // override keyword to enable overriding here
    public override void LaunchGame()
    {
        Console.WriteLine("Launching a Nintendo game.");
    }

    // method hiding, static binding
    public void ConnectToInternet()
    {
        Console.WriteLine("Connecting to the internet via Nintendo's network.");
    }

    // method hiding, static binding
    public new void GetDeviceType()
    {
        Console.WriteLine("This is a Nintendo gaming device.");
    }
}