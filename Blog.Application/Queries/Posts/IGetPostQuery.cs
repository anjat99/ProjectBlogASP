using Blog.Application.DataTransfer.Posts;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.Queries.Posts
{
    public interface IGetPostQuery : IQuery<int, ReadPostDto>
    {
    }
}
