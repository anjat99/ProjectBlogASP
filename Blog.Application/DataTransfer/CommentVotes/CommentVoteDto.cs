using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.DataTransfer.CommentVotes
{
    public class CommentVoteDto
    {
        public int? Mark { get; set; }
        public int? UserId { get; set; }
        public int? CommentId { get; set; }
    }
}
