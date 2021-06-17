using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.DataTransfer.UserUseCases
{
    public class UserUseCaseDto
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public int UseCaseId { get; set; }
    }
}
