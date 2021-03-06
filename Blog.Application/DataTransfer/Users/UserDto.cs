using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.DataTransfer.Users
{
    public class UserDto
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Username { get; set; }
        public IEnumerable<int> UserUseCases { get; set; } = new List<int>();
    }
}
