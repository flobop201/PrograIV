using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Log4NetModule
{
    class Test
    {
        private static void Main(string[] args)
        {
            try
            {
                int zero = 0;
                int numero = 5/zero;
            }
            catch (Exception exception)
            {
                Log4Net.WriteLog(exception,Log4Net.LogType.Error);
                Log4Net.WriteLog(exception, Log4Net.LogType.Warn);
            }
        }
    }
}
