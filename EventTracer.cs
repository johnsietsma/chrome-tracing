using System.Runtime.InteropServices;

public static class ChromeEventTracing {

    [DllImport ("__Internal")]
    public static extern void StartTracing();

    [DllImport ("__Internal")]
    public static extern void StopTracing();

}
