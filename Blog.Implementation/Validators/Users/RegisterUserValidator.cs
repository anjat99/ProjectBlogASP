using Blog.Application.DataTransfer.Users;
using Blog.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Validators.Users
{
    public class RegisterUserValidator : AbstractValidator<RegisterUserDto>
    {
        public RegisterUserValidator(BlogContext context)
        {
            RuleFor(u => u.FirstName)
                .NotEmpty()
                .MinimumLength(2).WithMessage("FIrstname must have at least 2 characters")
                .MaximumLength(30).WithMessage("FIrstname must have at max 30 characters");

            RuleFor(u => u.LastName)
                .NotEmpty()
                .MinimumLength(2).WithMessage("Lastname must have at least 2 characters")
                .MaximumLength(30).WithMessage("Lastname must have at max 30 characters");

            RuleFor(x => x.Username)
                .NotEmpty()
                .MinimumLength(4)
                .Matches("[A-z0-9]*")
                .WithMessage("Username must contain Numbers and Letters")
                .Must(x => !context.Users.Any(user => user.Username == x))
                .WithMessage("Username is already taken");

            RuleFor(x => x.Email)
               .NotEmpty()
               .EmailAddress()
               .Must(u => !context.Users.Any(x => x.Email == u))
               .WithMessage("Email is already taken");


            RuleFor(x => x.Password)
                .NotEmpty()
                .MinimumLength(6)
                .Matches("[A-z0-9]*")
                .WithMessage("Password must contain Numbers and Letters");

           

        }
    }
}
