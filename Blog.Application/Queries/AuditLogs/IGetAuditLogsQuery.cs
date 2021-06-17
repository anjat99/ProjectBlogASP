using Blog.Application.DataTransfer.AuditLogs;
using Blog.Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.Queries.AuditLogs
{
    public interface IGetAuditLogsQuery : IQuery<AuditLogSearch, PagedResponse<AuditLogDto>>
    {
    }
}
