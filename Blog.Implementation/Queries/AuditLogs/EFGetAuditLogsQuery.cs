using AutoMapper;
using Blog.Application.DataTransfer.AuditLogs;
using Blog.Application.Queries;
using Blog.Application.Queries.AuditLogs;
using Blog.Application.Searches;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Queries.AuditLogs
{
    public class EFGetAuditLogsQuery : IGetAuditLogsQuery
    {
        private readonly BlogContext _context;
        private readonly IMapper _mapper;

        public EFGetAuditLogsQuery(BlogContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 22;

        public string Name => "AuditLogs Search";

        public PagedResponse<AuditLogDto> Execute(AuditLogSearch search)
        {
            var query = _context.AuditLogs.OrderByDescending(x => x.Id).AsQueryable();

            if (!string.IsNullOrEmpty(search.Actor) || !string.IsNullOrWhiteSpace(search.Actor))
            {

                query = query.Where(x => x.Actor.ToLower().Contains(search.Actor.ToLower()));

            }

            if (!string.IsNullOrEmpty(search.UseCaseName) || !string.IsNullOrWhiteSpace(search.UseCaseName))
            {
                query = query.Where(x => x.UseCaseName.ToLower().Contains(search.UseCaseName.ToLower()));
            }

            if (!string.IsNullOrEmpty(search.DateFrom) || !string.IsNullOrWhiteSpace(search.DateFrom) )
            {

                DateTime startDate = Convert.ToDateTime(search.DateFrom);
               

                query = query.Where(x => x.Date >= startDate);
            }

            if (!string.IsNullOrEmpty(search.DateTo) || !string.IsNullOrWhiteSpace(search.DateTo))
            {
                DateTime endDate = Convert.ToDateTime(search.DateTo);
                query = query.Where(x => x.Date <= endDate);
            }


            return query.Paged<AuditLogDto, AuditLog>(search, _mapper);
            
        }
    }
}
