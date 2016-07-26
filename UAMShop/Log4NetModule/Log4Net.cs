using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using log4net;

namespace Log4NetModule
{
    public class Log4Net
    {
        public enum LogType
        {
            Info,
            Debug,
            Warn,
            Error,
            Fatal
        }

        private static Log4Net InstanceLog4Net { get; set; }
        private static ILog Log { get; set; }

        private Log4Net()
        {
            log4net.Config.XmlConfigurator.Configure(new FileInfo("App.config"));
            Log = LogManager.GetLogger("UAMSHOP");

        }

        public static void WriteLog(Exception exception, LogType type)
        {

            if (InstanceLog4Net == null)
            {
                InstanceLog4Net = new Log4Net();
            }

            switch (type)
            {
                case LogType.Error:
                    Log.Error(exception.Message + exception.StackTrace);
                    break;
                case LogType.Info:
                    Log.Info(exception.Message + exception.StackTrace);
                    break;
                case LogType.Debug:
                    Log.Debug(exception.Message + exception.StackTrace);
                    break;
                case LogType.Warn:
                    Log.Warn(exception.Message + exception.StackTrace);
                    break;
                case LogType.Fatal:
                    Log.Fatal(exception.Message + exception.StackTrace);
                    break;
            }
        }

        public static void WriteLog(string message, LogType type)
        {
            if (InstanceLog4Net == null)
            {
                InstanceLog4Net = new Log4Net();
            }

            switch (type)
            {
                case LogType.Error:
                    Log.Error(message);
                    break;
                case LogType.Info:
                    Log.Info(message);
                    break;
                case LogType.Debug:
                    Log.Debug(message);
                    break;
                case LogType.Warn:
                    Log.Warn(message);
                    break;
                case LogType.Fatal:
                    Log.Fatal(message);
                    break;
            }  
        }
    }
}
