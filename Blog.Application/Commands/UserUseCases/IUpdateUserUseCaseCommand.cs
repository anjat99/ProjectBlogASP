using Blog.Application.DataTransfer.UserUseCases;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.Commands.UserUseCases
{
    public interface IUpdateUserUseCaseCommand : ICommand<UserUseCaseDto>
    {
    }
}
