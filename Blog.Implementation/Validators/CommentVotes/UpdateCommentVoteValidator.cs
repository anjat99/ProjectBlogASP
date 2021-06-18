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
                 .NotEmpty().GreaterThanOrEqualTo(1).WithMessage("Value of vote has to be greater or equal than 1").LessThanOrEqualTo(5).WithMessage("Value of vote has to be less or equal than 5");
        }
    }
}
