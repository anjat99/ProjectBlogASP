using Blog.Application.DataTransfer.Users;
using Blog.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Validators.Users
{
    public class UpdateUserValidator : AbstractValidator<UserDto>
    {
        public UpdateUserValidator(BlogContext context)
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
              .Must((request, username) => !context.Users.Any(p => p.Username == request.Username && p.Id != request.Id))
              .WithMessage("Username is already taken");

            RuleFor(x => x.Email)
               .NotEmpty()
               .EmailAddress()
               .Must((request, Email) => !context.Users.Any(x => x.Email == request.Email && x.Id != request.Id))
               .WithMessage("Email is already taken");

            //RuleFor(x => x.UserUseCases)
            //    .NotEmpty();



        }
    }
}
