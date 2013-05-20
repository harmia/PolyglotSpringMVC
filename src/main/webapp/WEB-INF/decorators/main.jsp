<%@ page import="org.springframework.web.servlet.support.RequestContextUtils" %>
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>

<html>
<head>
    <title><sitemesh:write property="title"/></title>

    <meta charset="utf-8">
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-2.0.0.min.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script src="/js/ui.datepicker-fi.js"></script>
    <script src="http://twitter.github.io/bootstrap/assets/js/bootstrap-tab.js"></script>
    <script src="http://twitter.github.io/bootstrap/assets/js/bootstrap-alert.js"></script>
    <script src="http://twitter.github.io/bootstrap/assets/js/bootstrap-modal.js"></script>
    <script src="http://twitter.github.io/bootstrap/assets/js/bootstrap-dropdown.js"></script>
    <link href="http://twitter.github.io/bootstrap/assets/css/bootstrap.css" rel="stylesheet">
    <link href="http://twitter.github.io/bootstrap/assets/css/bootstrap-responsive.css" rel="stylesheet">

    <sitemesh:write property='head'/>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="span8 offset2">
            <p class="activePage hide"><sitemesh:write property="meta.activePage"/></p>

            <ul class="nav nav-tabs">
                <li class="OVERVIEW"><a href="/"><fmt:message key="main.nav.overview" /></a></li>
                <li class="DEPARTMENTS"><a href="/departments/"><fmt:message key="main.nav.departments"/></a></li>
                <li class="EMPLOYEES"><a href="/employees/"><fmt:message key="main.nav.employees"/></a></li>
            </ul>

            <h1 class="title"><sitemesh:write property="title"/></h1>

            <tags:flash-message/>
        </div>
    </div>
</div>

<sitemesh:write property="body"/>

<div class="container">
    <div class="row">
        <div class="span8 offset2">
            <div class='disclaimer'><fmt:message key="main.disclaimer"/></div>
        </div>
    </div>
</div>
</body>
</html>
<script>
    $(function() {
        var activePage = $("p.activePage").text();
        $("ul.nav.nav-tabs li").each(function() {
            activePage == $(this).attr("class") ? $(this).addClass("active")  : $(this).removeClass("active");
        });
    });

    $(function() {
        $.datepicker.setDefaults($.datepicker.regional['']);
        $.datepicker.setDefaults($.datepicker.regional['${requestContext.locale.language}']);

        $( "#datepicker" ).datepicker({
            showOn: "button",
            buttonImage: "/images/calendar.png",
            buttonImageOnly: true
        });

        if(!String.prototype.startsWith){
            String.prototype.startsWith = function (str) {
                return !this.indexOf(str);
            }
        }

        $( "#checkNames" ).autocomplete({
            source: function( request, response ) {
                $.getJSON( "/data/names.json").success(function( data ) {
                    response( $.map($.grep(data, function ( item ) {
                        return item.name.toUpperCase().startsWith(request.term.toUpperCase())
                    }), function( item ) {
                        return {
                            label: item.name,
                            value: item.name
                        }})
                    )
                });
            }
        });

        $( "#checkMunicipalities" ).autocomplete({
            source: function( request, response ) {
                $.getJSON( "/api/municipalities/" + request.term ).success(function( data ) {
                    response( $.map(data, function( item ) {
                        return {
                            label: item.name,
                            value: item.name,
                            id: item.id
                        }})
                    )
                });
            },
            select: function( event, ui ) {
                $('#municipalityId').val(ui.item.id);
            }
        });
    });
</script>