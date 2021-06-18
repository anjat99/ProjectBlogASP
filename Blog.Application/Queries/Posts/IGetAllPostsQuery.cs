using Blog.Application.DataTransfer.Posts;
using Blog.Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.Queries.Posts
{
    public interface IGetAllPostsQuery : IQuery<PostSearch, PagedResponse<PostsDto>>
    {
    }
}
