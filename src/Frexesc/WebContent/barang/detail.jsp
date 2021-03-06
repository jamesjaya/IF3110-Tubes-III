<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="com.frexesc.model.BarangBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="../header.jsp" />

<script type="text/javascript">
	function fitpict(obj) {
		fitimg(obj, 340, 340, true, true, false);
	}
</script>

<script src="../js/ajaxShop.js"></script>
<title>Detail Barang</title>
</head>
<body>
	<jsp:include page="../layout.jsp" />
	<%
		@SuppressWarnings("unchecked")
		BarangBean b = (BarangBean) request.getAttribute("item");
		//ArrayList<BarangBean> barangBean = (ArrayList<BarangBean>) request.getAttribute("items");
	%>
	<div id='content_frame' name='page'>
		<h1 class='small-header'><%=b.getNama_barang()%></h1>
		<div class='item_pict'>
			<img
				src='${pageContext.request.contextPath}/img/barang/<%=b.getGambar()%>'
				onload='fitpict(this)'></img>
		</div>

		<div class='item_detail'>
			<h4>product description</h4>
			<p>
				<%=b.getKeterangan()%>
			</p>
		</div>

		<div class='item_price'>
			<p>get it for :</p>
			<h4>
				IDR
				<%=b.getHarga_barang()%>
			</h4>

			<label class='qty'>Quantity</label> <input type='number' name='qty'
				id='qty_<%=b.getId()%>' class='qty' value=0></input> <label
				class='qty'>Stok:&nbsp;&nbsp;<span
				id="jumlah_barang_<%=b.getId()%>"><%=b.getJumlah_barang()%></span>
			</label>
			<p>Request Message :</p>
			<textarea class='req_msg' name='deskripsi_tambahan'
				id='deskripsi_tambahan'></textarea>
			<input type='button' class='cart' id='beli' value='Add to Cart'
				onClick="onAddToCart('http://<%=request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/barang/addCart', <%=b.getId()%> ); return false;"></input>

		</div>

	</div>
	<p>
		<br /> Klik <a href="./cart">disini</a> untuk masuk ke shopping cart
		<br /> Klik <a href="./">disini</a> untuk ke halaman utama daftar
		belanja <br />
	</p>

	<jsp:include page="../footer.jsp" />
</body>
</html>