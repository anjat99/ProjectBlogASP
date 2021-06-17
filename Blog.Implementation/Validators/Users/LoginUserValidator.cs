using Blog.Application.DataTransfer.Users;
using Blog.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Validators.Users
{
    public class LoginUserValidator : AbstractValidator<LoginUserDto>
    {
        public LoginUserValidator(BlogContext context)
        {
            RuleFor(x => x.Username)
                .NotEmpty()
                .MinimumLength(4)
                .Matches("[A-z0-9]*")
                .WithMessage("Username must contain Numbers and Letters")
                .Must(x => context.Users.Any(user => user.Username == x))
                .WithMessage("Username does not exists");


            RuleFor(x => x.Password)
                .NotEmpty()
                .MinimumLength(6)
                .Matches("[A-z0-9]*")
                .WithMessage("Password must contain only Numbers and Letters");
        }
    }
}
