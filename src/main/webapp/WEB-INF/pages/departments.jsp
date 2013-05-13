<%--
  Created by IntelliJ IDEA.
  User: harmia
  Date: 16.4.2013
  Time: 20:58
  Copyright (C) 2013 Juhana "harmia" Harmanen
  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta name="activePage" content="DEPARTMENTS"/>
    <title><fmt:message key="departments.title"/></title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="span8 offset2">
            <form:form method="post" action="add" commandName="department" class="form-horizontal">
                <div class="control-group">
                    <form:label cssClass="control-label" path="name"><fmt:message key="departments.form.name"/></form:label>
                    <div class="controls">
                        <form:input path="name"/>
                        <form:errors path="name" cssClass="alert alert-error" />
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <button class="btn btn-primary"><fmt:message key="departments.form.submit"/></button>
                    </div>
                </div>
            </form:form>

            <c:if test="${!empty departments}">
                <h3><fmt:message key="departments.title"/></h3>
                <table class="table table-bordered table-striped">
                    <thead>
                    <tr>
                        <th><fmt:message key="departments.table.id"/></th>
                        <th><fmt:message key="departments.table.name"/></th>
                        <th><fmt:message key="common.nbsp"/></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${departments}" var="department">
                        <tr>
                            <td>${department.id}</td>
                            <td>${department.name}</td>
                            <td>
                                <form action="delete/${department.id}" method="post">
                                    <a href="#deleteModal${employee.id}" role="button" class="btn btn-danger btn-mini" data-toggle="modal"><fmt:message key="common.delete"/></a>
                                    <div id="deleteModal${employee.id}" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
                                        <div class="modal-header">
                                            <h3 id="deleteModalLabel"><fmt:message key="departments.modal.header"><fmt:param value="${department.name}"/></fmt:message></h3>
                                        </div>
                                        <div class="modal-body">
                                            <p><fmt:message key="departments.modal.body"><fmt:param value="${department.name}"/></fmt:message></p>
                                        </div>
                                        <div class="modal-footer">
                                            <button class="btn" data-dismiss="modal" aria-hidden="true"><fmt:message key="common.close"/></button>
                                            <button class="btn btn-primary"><fmt:message key="common.saveChanges"/></button>
                                        </div>
                                    </div>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>