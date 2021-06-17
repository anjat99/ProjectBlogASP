using Blog.Application.DataTransfer.CommentVotes;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.Commands.CommentVotes
{
    public interface ICreateCommentVoteCommand : ICommand<CommentVoteDto>
    {
    }
}
