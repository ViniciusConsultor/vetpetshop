using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace WebUI
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            // At this point we have information about the error
            HttpContext ctx = HttpContext.Current;

            Exception exception = ctx.Server.GetLastError();

            string errorInfo =
               "<br>Offending URL: " + ctx.Request.Url.ToString() +
               "<br>Source: " + exception.Source +
               "<br>Message: " + exception.Message +
               "<br>Stack trace: " + exception.StackTrace +
               "<br>Target: " + exception.TargetSite; 

            ctx.Response.Write(errorInfo);

            // --------------------------------------------------
            // To let the page finish running we clear the error
            // --------------------------------------------------
            ctx.Server.ClearError();

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}