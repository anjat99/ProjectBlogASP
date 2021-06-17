using Blog.Application.DataTransfer.Users;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.Queries.Users
{
    public interface IGetUserQuery : IQuery<int, ReadUserDto>
    {
    }
}
