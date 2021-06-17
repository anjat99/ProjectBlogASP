using Blog.Application.DataTransfer.Users;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.Commands.Users
{
   public interface IRegisterUserCommand : ICommand<RegisterUserDto>
    {
    }
}
