<html>
	<head>
		<g:if env="development"><title><g:message code="site.500.exception.title"/></title></g:if>
		<g:else><title><g:message code="site.500.oops.title"/></title></g:else>
		<meta name="layout" content="kickstart" />
	</head>

  <body>
	  <g:if env="development">
		<section id="overview" class="">
	    	<div class="alert alert-error">
				${request.'javax.servlet.error.message'?.indexOf(':') == null ? request.'javax.servlet.error.message'?.encodeAsHTML()	: request.'javax.servlet.error.message'?.substring(0, request.'javax.servlet.error.message'?.indexOf(':')).encodeAsHTML()}
				<g:if test="${exception}">
					${exception.className}
					at line ${exception.lineNumber}
				</g:if>
	 	   </div>
		</section>
			
		<section id="details" class="">
		    <h2><g:message code="site.500.details.message"/></h2>
		  	<div class="message">
				<table class="table">
					<tbody>
						<tr>
							<td><strong>Error ${request.'javax.servlet.error.status_code'}</strong></td>
							<td>
								${request.'javax.servlet.error.message'.encodeAsHTML()}
							</td>
						</tr>
						<tr>
							<td><strong>Servlet</strong></td>
							<td>
								${request.'javax.servlet.error.servlet_name'}
							</td>
						</tr>
						<tr>
							<td><strong>URI</strong></td>
							<td>
								${request.'javax.servlet.error.request_uri'}
							</td>
						</tr>
					<g:if test="${exception}">
						<tr>
							<td><strong>Exception Message:</strong></td>
							<td>
								${exception.message?.encodeAsHTML()}
							</td>
						</tr>
						<tr>
							<td><strong>Caused by:</strong></td>
							<td>
								${exception.cause?.message?.encodeAsHTML()}
							</td>
						</tr>
						<tr>
							<td><strong>Class:</strong></td>
							<td>
								${exception.className}
							</td>
						</tr>
						<tr>
							<td><strong>At Line:</strong>
							</td>
							<td> [${exception.lineNumber}]</td>
						</tr>
				  		<tr>
							<td><strong>Code Snippet:</strong></td>
							<td>
					  		<div class="snippet">
					  			<g:each var="cs" in="${exception.codeSnippet}">
					  				${cs?.encodeAsHTML()}<br />
					  			</g:each>
					  		</div>
					  		</td>
						</tr>
					</g:if>
					</tbody>
				</table>
		  	</div>
		</section>
	
		<g:if test="${exception}">
			<section id="exception">
			    <h2><g:message code="site.500.stack.message"/></h2>
			    <div class="stack">
			      <pre><g:each in="${exception.stackTraceLines}">${it.encodeAsHTML()}<br/></g:each></pre>
			    </div>
			</section>
		</g:if>
	</g:if>
	<g:else>
		<div id="error-info" class="big-message" style="margin:0">
			<div class="info center"><g:message code="site.500.error.message"/></div>
			<div class="image center">
				<g:img alt="Claptrap" dir="images/info" file="claptrap.png" />
			</div>
			<div class="actions center">
				<a href="javascript:history.go(-1)" class="btn btn-large btn-primary">
					<i class="icon-chevron-left icon-white"></i>
					<g:message code="default.button.back.label"/>
				</a>
				<a href="/" class="btn btn-large btn-success">
					<i class="icon-home"></i>
					<g:message code="default.button.home.label"/>
				</a>					
			</div>
		</div>
	</g:else>
  </body>
</html>