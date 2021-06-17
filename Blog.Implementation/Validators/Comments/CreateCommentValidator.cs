using Blog.Application.DataTransfer.Comments;
using Blog.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Validators.Comments
{
    public class CreateCommentValidator : AbstractValidator<CommentDto>
    {
        public CreateCommentValidator(BlogContext context)
        {
            RuleFor(x => x.Message)
               .NotEmpty()
               .WithMessage("Message is required.")
               .MinimumLength(3);

            RuleFor(x => x.PostId)
                .NotEmpty()
                .Must(postId => context.Posts.Any(p => p.Id == postId))
                .WithMessage("Post must exists.");


        }
    }
}
