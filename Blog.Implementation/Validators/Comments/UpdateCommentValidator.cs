using Blog.Application.DataTransfer.Comments;
using Blog.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Validators.Comments
{
    public class UpdateCommentValidator : AbstractValidator<UpdateCommentDto>
    {
        public UpdateCommentValidator(BlogContext context)
        {
            RuleFor(x => x.Message)
                .NotEmpty()
                .WithMessage("Message is required.")
                .MinimumLength(3);

        }
    }
}
