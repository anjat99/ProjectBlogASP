using Blog.Application.DataTransfer.CommentVotes;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Validators.CommentVotes
{
    public class CreateCommentVoteValidator : AbstractValidator<CommentVoteDto>
    {
        public CreateCommentVoteValidator()
        {

            RuleFor(x => x.CommentId).NotEmpty();

            RuleFor(x => x.UserId).NotEmpty();

            RuleFor(x => x.Mark)
                .NotEmpty()
                .ExclusiveBetween(1,5)
                .WithMessage("Mark must be in the range between 1 and 5");
        }
    }
}
