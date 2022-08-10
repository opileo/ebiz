<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebiz</title>
<!-- bootstrap link-->
		<link rel="stylesheet" href="../../bootstrap/css/bootstrap.css">
</head>
<body>
	<section>
		<div class="container text-center " style="width: 40%;">
			<div class="text-center border-dark mt-5">
			
					<h2>Enter Product details</h2>
					<div class="card text-left">
						<form action="../../AddProduct" method="post">
						<div class="my-3">
							  <label for="category" class="form-label">Category</label>
							  <select id="category" name="category">
							  	<option value="Long term">Long term</option>
							  	<option value="Mid term">Mid term</option>
							  	<option value="Short term">Short term</option>
							  </select>
							</div>
							<div class="my-3">
							  <label for="name" class="form-label">Product name</label>
							  <input class="form-control" type="text" name="name" id="name">
							</div>
							
							<div class="my-3">
							  <label for="price" class="form-label">Product price</label>
							  <input class="form-control" type="number" name="price" id="price">
							</div>
							<div class="my-3">
							  <label for="image" class="form-label">Image</label>
							  <input class="form-control" type="file" name="image" id="image">
							</div>
							<br>
							<div class="my-3 text-center">
								<input type="submit" value="Add +" class="btn btn-primary col-md-5">
								<div class="col-md-2"></div>
								<input type="reset" value="Clear" class="btn btn-success col-md-5">
							</div>
						</form>
					</div>
			
			</div>		
		</div>
	</section>
</body>
</html>