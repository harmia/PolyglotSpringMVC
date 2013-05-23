<%--
  Created by IntelliJ IDEA.
  User: harmia
  Date: 16.4.2013
  Time: 16:24
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
<%@ taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>

<html>
<head>
    <meta name="activePage" content="EMPLOYEES"/>
    <title>Employees</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="span8 offset2">
            <c:if test="${not empty departments}">
                <form:form method="post" action="add" commandName="employee" class="form-horizontal">
                    <div class="control-group">
                        <form:label cssClass="control-label" path="firstName"><fmt:message key="employees.form.firstName"/></form:label>
                        <div class="controls">
                            <form:input path="firstName" id="checkNames"/>
                            <form:errors path="firstName" cssClass="alert alert-error"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <form:label cssClass="control-label" path="lastName"><fmt:message key="employees.form.lastName"/></form:label>
                        <div class="controls">
                            <form:input path="lastName"/>
                            <form:errors path="lastName" cssClass="alert alert-error"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <form:label cssClass="control-label" path="email"><fmt:message key="employees.form.email"/></form:label>
                        <div class="controls">
                            <form:input path="email"/>
                            <form:errors path="email" cssClass="alert alert-error"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <form:label cssClass="control-label" path="departmentId"><fmt:message key="employees.form.department"/></form:label>
                        <div class="controls">
                            <form:select path="departmentId" items="${departments}" itemLabel="name" itemValue="id"/>
                            <form:errors path="departmentId" cssClass="alert alert-error" />
                        </div>
                    </div>
                    <div class="control-group">
                        <form:label cssClass="control-label" path="contractBeginDate"><fmt:message key="employees.form.contractBeginDate"/></form:label>
                        <div class="controls">
                            <form:input path="contractBeginDate" id="datepicker" readonly="true"/>
                            <form:errors path="contractBeginDate" cssClass="alert alert-error"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <form:label cssClass="control-label" path="municipalityId"><fmt:message key="employees.form.municipalityId"/></form:label>
                        <div class="controls">
                            <form:input path="municipalityName" id="checkMunicipalities"/>
                            <form:errors path="municipalityName" cssClass="alert alert-error"/>
                            <form:errors path="municipalityId" cssClass="alert alert-error"/>
                            <form:input cssClass="hidden" path="municipalityId"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <button class="btn btn-primary"><fmt:message key="employees.form.submit"/></button>
                        </div>
                    </div>
                </form:form>

                <c:if test="${!empty employees}">
                    <h3><fmt:message key="employees.title"/></h3>
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th><fmt:message key="employees.table.id"/></th>
                            <th><fmt:message key="employees.table.name"/></th>
                            <th><fmt:message key="employees.table.email"/></th>
                            <th><fmt:message key="employees.table.department"/></th>
                            <th><fmt:message key="employees.table.contractBeginDate"/></th>
                            <th><fmt:message key="employees.table.municipality"/></th>
                            <th><fmt:message key="common.nbsp"/></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${employees}" var="employee">
                            <tr>
                                <td>${employee.id}</td>
                                <td>${employee.lastName}, ${employee.firstName}</td>
                                <td>${employee.email}</td>
                                <td>
                                    <div class="btn-group">
                                        <a class="btn btn-small dropdown-toggle" data-toggle="dropdown" href="#">
                                            ${employee.department.name}
                                            <span class="caret"></span>
                                        </a>
                                        <ul class="dropdown-menu">
                                            <c:forEach items="${departments}" var="department">
                                                <li>
                                                    <a onclick="$(this).find('form').submit()">${department.name}<form class="hidden" action="change/${employee.id}/${department.id}" method="post"><button class="btn btn-primary hidden"><fmt:message key="common.change"/></button></form></a>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </td>
                                <td><joda:format value="${employee.contractBeginDate}"/></td>
                                <td>${employee.municipality.name}</td>
                                <td>
                                    <form action="delete/${employee.id}" method="post">
                                        <a href="#deleteModal${employee.id}" role="button" class="btn btn-danger btn-mini" data-toggle="modal"><fmt:message key="common.delete"/></a>
                                        <div id="deleteModal${employee.id}" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
                                            <div class="modal-header">
                                                <h3 id="deleteModalLabel"><fmt:message key="employees.modal.header"><fmt:param value="${employee.lastName}"/><fmt:param value="${employee.firstName}"/></fmt:message></h3>
                                            </div>
                                            <div class="modal-body">
                                                <p><fmt:message key="employees.modal.body"><fmt:param value="${employee.lastName}"/><fmt:param value="${employee.firstName}"/></fmt:message></p>
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
            </c:if>
        </div>
    </div>
</div>
</body>
</html>