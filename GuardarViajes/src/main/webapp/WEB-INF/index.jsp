<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<title>Save Travels</title>
</head>
<body>
	<div class="container mt-5">
		<h1>Save Travels</h1>
	    <table class="table table-striped">
		  <thead>
		    <tr>
		      <th scope="col">Expense</th>
		      <th scope="col">Vendor</th>
		      <th scope="col">Amount</th>
		    </tr>
		  </thead>
		  <tbody>
		  <c:forEach var="gasto" items="${gastos}">
		  	<tr>
		      <td><c:out value="${gasto.expenseName}"></c:out></td>
		      <td><c:out value="${gasto.vendor}"></c:out></td>
		      <td><fmt:formatNumber value = "${gasto.amount}" type = "currency" currencySymbol="$"/></td>
		    </tr>
	      </c:forEach>
		  </tbody>
		</table>
	</div>
	<div class="container mt-5" style="max-width: 40vw;">
		<h2 class="mt-5 mb-3">Add and expense:</h2>
		<h4 class="text-danger"><c:out value="${nullerror}"></c:out></h4>
		<h4 class="text-danger"><c:out value="${amountcasterror}"></c:out></h4>
		<form action="/create" method="POST">
		  <div class="form-group row mt-3 mb-3">
		    <label for="expenseid" class="col-2 col-form-label">Expense Name:</label>
		    <div class="col-10">
		    	<input type="text" class="form-control" id="expenseid" name="name">
		    </div>
		  </div>
		  <div class="form-group row mt-3 mb-3">
		    <label for="vendorid" class="col-2 col-form-label">Vendor:</label>
		    <div class="col-10">
		    	<input type="text" class="form-control" id="vendorid" name="vendor">
		    </div>
		  </div>
		  <div class="form-group row mt-3 mb-3">
		    <label for="amountid" class="col-2 col-form-label">Amount:</label>
		    <div class="col-10">
		    	<input type="text" class="form-control" id="amountid" name="amount">
		    </div>
		  </div>
		  <div class="form-group row mt-3 mb-3">
		    <label for="textareaid" class="col-2 col-form-label">Description:</label>
		    <div class="col-10">
		    	<textarea class="form-control" id="textareaid" rows="4" name="description"></textarea>
		    </div>
		  </div>
		  <div class="clearfix mt-3 mb-3">
		    <button type="submit" class="btn btn-primary float-right">Submit</button>
		  </div>
		</form>
	</div>
</body>
</html>