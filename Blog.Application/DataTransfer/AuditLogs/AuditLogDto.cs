using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.DataTransfer.AuditLogs
{
    public class AuditLogDto
    {
        public int Id { get; set; }
        public DateTime CreatedAt { get; set; }
        public string UseCaseName { get; set; }
        public string Actor { get; set; }
        public string Data { get; set; }
    }
}
