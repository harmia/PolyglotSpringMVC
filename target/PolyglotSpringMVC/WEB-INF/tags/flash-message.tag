<%--
  Created by IntelliJ IDEA.
  User: harmia
  Date: 7.5.2013
  Time: 08:27
  Copyright (C) 2013 Juhana "harmia" Harmanen
  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${not empty sessionScope.errorMessage}">
    <div class="alert alert-error">
        <button type="button" class="close" data-dismiss="alert"><fmt:message key="common.times"/></button>
        <fmt:message key="${sessionScope.errorMessage}" >
            <c:forEach items="${sessionScope.errorMessageArgs}" var="arg">
                <fmt:param value="${arg}" />
            </c:forEach>
        </fmt:message>
    </div>
    <c:set scope="session" var="errorMessage" />
    <c:set scope="session" var="errorMessageArgs" />
</c:if>

<c:if test="${not empty sessionScope.successMessage}">
    <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert"><fmt:message key="common.times"/></button>
        <fmt:message key="${sessionScope.successMessage}" >
            <c:forEach items="${sessionScope.successMessageArgs}" var="arg">
                <fmt:param value="${arg}" />
            </c:forEach>
        </fmt:message>
    </div>
    <c:set scope="session" var="successMessage" />
    <c:set scope="session" var="successMessageArgs" />
</c:if>

<c:if test="${not empty sessionScope.infoMessage}">
    <div class="alert alert-info">
        <button type="button" class="close" data-dismiss="alert"><fmt:message key="common.times"/></button>
        <fmt:message key="${sessionScope.infoMessage}" >
            <c:forEach items="${sessionScope.infoMessageArgs}" var="arg">
                <fmt:param value="${arg}" />
            </c:forEach>
        </fmt:message>
    </div>
    <c:set scope="session" var="infoMessage" />
    <c:set scope="session" var="infoMessageArgs" />
</c:if>

<c:if test="${not empty sessionScope.alertMessage}">
    <div class="alert">
        <button type="button" class="close" data-dismiss="alert"><fmt:message key="common.times"/></button>
        <fmt:message key="${sessionScope.alertMessage}" >
            <c:forEach items="${sessionScope.alertMessageArgs}" var="arg">
                <fmt:param value="${arg}" />
            </c:forEach>
        </fmt:message>
    </div>
    <c:set scope="session" var="alertMessage" />
    <c:set scope="session" var="alertMessageArgs" />
</c:if>