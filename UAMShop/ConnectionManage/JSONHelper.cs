using System.Web.Script.Serialization;

namespace ConnectionManage
{
    public static class JsonHelper
    {
        public static string ToJson(this object obj)
        {
            var serializer = new JavaScriptSerializer();
            return serializer.Serialize(obj);
        }

        public static string ToJson(this object obj, int recursionDepth)
        {
            var serializer = new JavaScriptSerializer {RecursionLimit = recursionDepth};
            return serializer.Serialize(obj);
        }
    }
}