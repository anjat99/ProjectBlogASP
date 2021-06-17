using Blog.Application.DataTransfer.CommentVotes;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Validators.CommentVotes
{
    public class UpdateCommentVoteValidator : AbstractValidator<UpdateCommentVoteDto>
    {
        public UpdateCommentVoteValidator()
        {

            RuleFor(x => x.CommentId).NotEmpty();

            RuleFor(x => x.Mark)
                .ExclusiveBetween(1, 5)
                .WithMessage("Mark must be in the range between 1 and 5");
        }
    }
}
