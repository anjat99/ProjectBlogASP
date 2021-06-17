using Blog.Application;
using Blog.Application.Queries.AuditLogs;
using Blog.Application.Searches;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Blog.Api.Controllers
{
    
    [Route("api/[controller]")]
    [ApiController]
    public class AuditLogsController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public AuditLogsController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/<AuditLogsController>
        [HttpGet]
        public IActionResult Get([FromQuery] AuditLogSearch search,
            [FromServices] IGetAuditLogsQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

    }
}
