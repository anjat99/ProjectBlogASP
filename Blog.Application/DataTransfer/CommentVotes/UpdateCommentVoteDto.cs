using Blog.Application.DataTransfer.Users;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.DataTransfer.CommentVotes
{
    public class UpdateCommentVoteDto
    {
        public int Id { get; set; }
        public int Mark { get; set; }
        public int CommentId { get; set; }
        public int UserId { get; set; }
    }
}
