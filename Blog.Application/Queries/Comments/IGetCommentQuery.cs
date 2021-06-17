using Blog.Application.DataTransfer.Comments;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.Queries.Comments
{
    public interface IGetCommentQuery : IQuery<int, ReadCommentDto>
    {
    }
}
