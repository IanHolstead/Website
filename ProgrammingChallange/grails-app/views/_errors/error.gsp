<html>
	<head>
		<g:if env="development"><title>Grails Runtime Exception</title></g:if>
		<g:else><title>Oops!</title></g:else>
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
		    <h2>Error Details</h2>
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
			    <h2>Stack Trace</h2>
			    <div class="stack">
			      <pre><g:each in="${exception.stackTraceLines}">${it.encodeAsHTML()}<br/></g:each></pre>
			    </div>
			</section>
		</g:if>
	</g:if>
	<g:else>
		<div id="error-info">
			<div class="info center">An error has occurred! I probably shouldn't have made Claptrap my sys admin...</div>
			<div class="image center">
				<g:img alt="Claptrap" dir="images/info" file="claptrap.png" />
			</div>
		</div>
	</g:else>
  </body>
</html>