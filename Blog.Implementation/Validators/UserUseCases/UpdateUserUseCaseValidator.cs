using Blog.Application.DataTransfer.UserUseCases;
using Blog.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Validators.UserUseCases
{
    public class UpdateUserUseCaseValidator : AbstractValidator<UserUseCaseDto>
    {
        public UpdateUserUseCaseValidator(BlogContext context)
        {
            RuleFor(x => x.UseCaseId).NotEmpty();
            RuleFor(x => x.UserId).NotEmpty()
                .Must(x => context.Users.Any(user => user.Id == x))
                .WithMessage("Users Id has to be in database");
        }
    }
}
