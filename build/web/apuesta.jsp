<%-- 
    Document   : apuesta
    Created on : 25-feb-2024, 23:18:04
    Author     : Alejandro
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="table-responsive">
    <table class="table table-striped table-primary">
        <thead>
            <tr>
                <th scope="col">Local</th>
                <th scope="col">Visitante</th>
                <th scope="col">Nº apuestas</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${apuestas}" var="apuesta">
                <tr class="">
                    <td >${apuesta.golesl}</td>
                    <td>${apuesta.golesv}</td>
                    <td>${apuesta.cuantas}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
