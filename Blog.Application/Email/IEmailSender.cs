using Blog.Application.DataTransfer.Email;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.Email
{
    public interface IEmailSender
    {
        void SendEmail(SendEmailDto dto);
    }
}
