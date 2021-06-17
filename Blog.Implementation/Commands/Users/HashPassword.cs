using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;

namespace Blog.Implementation.Commands.Users
{
    public static class HashPassword
    {
        public static string Encrypt(string password)
        {
            var sha1 = new SHA1CryptoServiceProvider();
            var data = Encoding.ASCII.GetBytes(password);
            var sha1data = sha1.ComputeHash(data);
            var hashedPassword = Convert.ToBase64String(sha1data);

            return hashedPassword;
        }
    }
}
