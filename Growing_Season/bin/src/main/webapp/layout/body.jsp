<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

	<div class="row" style="display:flex;">
	<div class="col-md-2 col-sm-2">
		<tiles:insertAttribute name="side" />
	</div>
	
	<div class="col-md-9 col-sm-9">
	<div class="main-textgrids">
		<div class="container">
			<div class="w3ls-heading">
				<h2 class="h-two">About Us</h2>
				<p class="sub two">Morbi in dui pretium, finibus sapien vel.</p>
			</div>
			<div class="ab-agile">
				<div class="col-md-5 ab-pic">
					 <img src="/images/ab1.jpg" alt=" " />
				</div>
				<div class="col-md-7 ab-text">
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eu erat lacus, vel congue mauris. Fusce velit justo, faucibus eu sagittis ac, gravida quis tortor. Suspendisse non urna mi, quis tincidunt eros. Nullam tellus turpis, fringilla sit amet congue ut, luctus a nulla. Donec sit amet sapien neque, id ullamcorper diam. Nulla facilisi. Pellentesque pellentesque arcu a elit congue lacinia.</p>
					<ul class="ab">
						<li><a href="#" data-toggle="modal" data-target="#myModal"><i class="fa fa-angle-right" aria-hidden="true"></i> Lorem ipsum dolor sit amet,consectetur adipiscing elit</a></li>
						<li><a href="#" data-toggle="modal" data-target="#myModal"><i class="fa fa-angle-right" aria-hidden="true"></i> Pellentesque eu erat lacus,consectetur adipiscing elit</a></li>
						<li><a href="#" data-toggle="modal" data-target="#myModal"><i class="fa fa-angle-right" aria-hidden="true"></i> Lorem ipsum dolor sit amet,consectetur adipiscing elit</a></li>
						<li><a href="#" data-toggle="modal" data-target="#myModal"><i class="fa fa-angle-right" aria-hidden="true"></i> Lorem ipsum dolor sit amet,consectetur adipiscing elit</a></li>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="statements">
				<div class="col-md-7 mission">
					 <h4>Aenean quis faucibus libero</h4>
					 <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eu erat lacus, vel congue mauris. Fusce velit justo, faucibus eu sagittis ac, gravida quis tortor. Suspendisse non urna mi, quis tincidunt eros. Nullam tellus turpis, fringilla sit amet congue ut, luctus a nulla. Donec sit amet sapien neque, id ullamcorper diam. Nulla facilisi. Pellentesque pellentesque arcu a elit congue lacinia.</p>
					<ul class="ab">
						<li><a href="#" data-toggle="modal" data-target="#myModal"><i class="fa fa-angle-right" aria-hidden="true"></i> Lorem ipsum dolor sit amet,consectetur adipiscing elit</a></li>
						<li><a href="#" data-toggle="modal" data-target="#myModal"><i class="fa fa-angle-right" aria-hidden="true"></i> Pellentesque eu erat lacus,consectetur adipiscing elit</a></li>
						<li><a href="#" data-toggle="modal" data-target="#myModal"><i class="fa fa-angle-right" aria-hidden="true"></i> Lorem ipsum dolor sit amet,consectetur adipiscing elit</a></li>
						<li><a href="#" data-toggle="modal" data-target="#myModal"><i class="fa fa-angle-right" aria-hidden="true"></i> Lorem ipsum dolor sit amet,consectetur adipiscing elit</a></li>
					</ul>
				</div>
				<div class="col-md-5 facts">
					<img src="/images/ab2.jpg" alt=" " />		
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!-- //main-textgrids -->
	<!-- different -->
	<div class="different">
		<div class="container">
			
			<div class="w3l-heading">
				<h3 class="w3ls_head">Why We are Different</h3>
			</div>
			
			<div class="w3agile-different-info">
				<p>Cras vehicula massa id ipsum venenatis, non convallis libero pellentesque. Sed tristique massa et mattis mattis. Nunc euismod consequat ex, eu tincidunt justo malesuada vitae. Sed auctor diam quis nulla hendrerit porta. Quisque venenatis, tortor quis tristique congue, lorem lectus elementum augue, in laoreet lorem justo lacinia velit. Phasellus tempus luctus velit, eu fermentum arcu porttitor sit amet. Suspendisse id efficitur sem. Donec laoreet ante at facilisis dictum. Donec sodales porta orci sed porta. Vivamus est enim, pharetra sit amet placerat ut, eleifend quis purus. Sed elementum tortor erat, placerat rutrum augue facilisis vel. Morbi feugiat tortor erat, nec gravida mauris egestas tincidunt. Sed vitae dignissim sapien.</p>
				<div class="w3agile-button">
					<a href="#" data-toggle="modal" data-target="#myModal">Read More</a>
				</div>
			</div>
		</div>
	</div>
	<!-- //different -->
	<!-- team -->
	<div class="team">
		<div class="container">
			<div class="w3ls-heading">
				<h3 class="h-two">Team</h3>
				<p class="sub two">Morbi in dui pretium, finibus sapien vel.</p>
			</div>
			<div class="agileinfo-team-grids">
				<div class="col-md-3 wthree-team-grid">
					<img src="/images/t1.jpg" alt="">
					<div class="wthree-team-grid-info">
						<h4>Mary Jane</h4>
						<p>Vestibulum</p>
						<div class="team-social-grids">
							<ul>
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-rss"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-3 wthree-team-grid">
					<img src="/images/t2.jpg" alt="">
					<div class="wthree-team-grid-info">
						<h4>Peter Parke</h4>
						<p>Vestibulum</p>
						<div class="team-social-grids">
							<ul>
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-rss"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-3 wthree-team-grid">
					<img src="/images/t3.jpg" alt="">
					<div class="wthree-team-grid-info">
						<h4>Jennifer Watson</h4>
						<p>Vestibulum</p>
						<div class="team-social-grids">
							<ul>
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-rss"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-3 wthree-team-grid">
					<img src="/images/t4.jpg" alt="">
					<div class="wthree-team-grid-info">
						<h4>Steven Wilson</h4>
						<p>Vestibulum</p>
						<div class="team-social-grids">
							<ul>
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-rss"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	</div>
</div>