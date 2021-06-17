using Blog.Application.DataTransfer.Comments;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.Commands.Comments
{
    public interface IUpdateCommentCommand : ICommand<UpdateCommentDto>
    {
    }
}
