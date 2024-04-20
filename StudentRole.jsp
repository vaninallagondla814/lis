<%-- 
    Document   : StudentRole
    Created on : 24-Dec-2023, 4:14:02 pm
    Author     : maruthi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <style>
            body{
                font-size: 18px;
                background-color: rgb(25, 148, 138);
                font-family:sans-serif;
            }
            .side button{
                width: 93%;
                height: 50px;
                padding: 10px;
                margin:10px;
                font-size: 17px;
                border-radius: 5px;
                background-color: #24a1d4;
                border: solid white 1px;
                /*box-shadow: inset 0 0 0px,0 0 20px rgb(46, 102, 109);*/
            }
            button:hover{
                font-size: 18px;
                color: aliceblue;
            }
            table{
                height: 70vh;
                border: none;
                padding: 10px;
                width: 60%;
                
                
            }
            table td{
                padding: 5px;
                size: 20px;
                
            }
           
            .side button{

            }
              .container {
            /*background-color: #d1dfeb;*/
            border-radius: 10px;
            padding: 20px;
            /*box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);*/
        }

      

        h4 {
            color: #007bff;
        }

        p {
            color: #6c757d;
        }
        .card-info {
            font-size: 16px;
            line-height: 25px;
            margin: 10px 0; /* Adjust the margin */
            font-weight: 400;
        }

        .card-description {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            
            backdrop-filter:blur(20px);
            background: rgba(0, 0, 0, 0.4);
            color: #fff;
            padding: 10px;
            font-size: 22px;
            opacity: 0;
            transition: opacity 0.3s ease;
            cursor: pointer;
             
        }

        .card:hover .card-description {
            opacity: 1;
             right: -100%;
        }
     
        
       card {
            border: 1px solid #ced4da;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            background-color: whitesmoke;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease; 
            width:100%;/* Add transition for a smooth effect */
        }
        </style>
    </head>
    <body>
        <div style="display: flex;">
            <div style="width: 25%;padding-bottom: 50px; background-color: #c8d8e3;border-top-right-radius: 0px;" class="side">
                <h2 style="padding-left:75px; padding-top: 15px;font-size: 35px;color:rgb(19, 49, 54)"><b>USER</b></h2>
                <a href='index.jsp'><button ></i>Home Page</button></a>
                <button id="dash"><i class="fa-solid fa-table-cells-large"></i> Dash-Board</button>
                <button id="Stud"><i class="fa-solid fa-user"></i> My Profile</button>
                <button id="Iss"><i class="fa-solid fa-book"></i> Return Book</button>
                <button id="book"><i class="fa-solid fa-book"></i>  All Books</button>
                <button id="cpass"><i class="fa-solid fa-key"></i> Change Password</button>
                <a href='index.jsp'><button id="logout"><i class="fa-solid fa-right-from-bracket"></i> Logout</button></a>
            </div>
            <div style="background-color: #d0e6f5; width: 100%;border-top-left-radius: 10px; overflow-y: scroll;height:100vh;">
                <center><h1>ONLINE LIBRARY MANAGEMENT SYSTEM</h1></center>
                <hr style="height: 5px;background-color:rgb(71, 167, 159);">
                <div id="das">
                <div class="d-flex justify-content-center ms-3 me-3 rounded-top-3 mb-3" style="background-color:#24a1d4;color: white;">
                        <h1>Welcome To Student Dash-Board</h1>
                </div>
                    <%  
           Statement st15=null;
           ResultSet result15=null;
           int bcc=0;
            try{
           Class.forName("com.mysql.cj.jdbc.Driver");                
           Connection con5=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/Books","root","password");
            st15=con5.createStatement();
            result15 =st15.executeQuery("select count(*) from cbooks;");
            result15.next();
            bcc=result15.getInt(1);
            }catch(Exception e){
                     
            }
            
           
           %>
                <div class="m-5"style="border: solid black 1px; padding: 20px; margin: 15px ;margin-bottom: 60px; border-radius: 10px;">                    
                    <div style="display: flex;justify-content: space-around;" >
                        <div style="height: 80px; width: 300px; background-color: darkgray;display: flex; border-radius: 5px;"><div style="padding: 5px;"><img src="images/c15.png" width="70px" height="70px" style="border-radius: 5px;"></div><div style="text-align: center;margin-top: 15px;margin-left: 20px; ">Books Issued <br>
                            <%
                                //String user=(String)Session.getAttribute("ic"); 
                                //out.println(user);
                                result15 =st15.executeQuery("select count(*) from Issue where sid='"+session.getAttribute("rid")+"';");
                                result15.next();
                                out.println(result15.getInt(1));
                                    %>
                            </div></div>
                        <div style="height: 80px; width: 300px; background-color: darkgray;display: flex; border-radius: 5px;"><div style="padding: 5px;"><img src="images/c15.png" width="70px" height="70px" style="border-radius: 5px;"></div><div style="text-align: center;margin-top: 15px;margin-left: 20px; ">Total Books <br> 
                            <%
                                //String user=(String)Session.getAttribute("ic"); 
                                //out.println(user);
                                result15 =st15.executeQuery("select count(*) from cbooks");
                                result15.next();
                                out.println(result15.getInt(1));
                                    %>
                            </div></div>
                    </div>
                    
                </div>
            </div>
                <div id="student" style="display: none;">
                    <div class="d-flex justify-content-center ms-3 me-3 rounded-top-3 mb-3" style="background-color:#24a1d4;color: white;">
                        <h1>User Profile</h1>
                    </div>    
                     
                    <div class="container pb-5">
                      <h3 class='ms-5 ps-4'>Hello <%out.println(session.getAttribute("rfname"));%>.......</h3>  
                    <div class="row d-flex justify-content-center ">
                        
			<div class="col-md-10  pt-2">
				<div class="row z-depth-3">
					<div class="col-sm-4 bg-info rounded-3">
						<div class="card-block text-center align-center text-white p-3">
                                                    <% String ph="images/";
                                                        ph=ph+(String)session.getAttribute("rphoto");
                                                    %>
                                                    <img src="<% out.println(ph);%>" style="width:200px;border-radius: 10px;  height:250px; margin:10px;">
                                                <h2 class="font-weight-bold mt-4"><%out.println(session.getAttribute("rfname"));%></h2>
						
						
						</div>
					</div>
					<div class="col-sm-8 bg-white rounded ">
						<h3 class="mt-3 text-center">Profile Information</h3>
						<hr class="badge-primary mt-0 w-100">
						<div class="row">
                                                        <div class="col-sm-6">
								<p><b> Membership ID:</b><p>
                                                                <h6 class="text-muted">
                                                                    <%
                                                                        out.println(session.getAttribute("rid"));
                                                                        
                                                                        %>
                                                                </h6>
							</div>
                                                        <div class="col-sm-6">
								<p><b>Email:</b></p>
								<h6 class="text-muted">
                                                                 <%
                                                                        out.println(session.getAttribute("remail"));
                                                                        
                                                                        %>    
                                                                </h6>
							</div>
							<div class="col-sm-6">
								<p><b> First Name:</b><p>
								<h6 class="text-muted"><%
                                                                        out.println(session.getAttribute("rfname"));
                                                                        
                                                                        %></h6>
							</div>
                                                        <div class="col-sm-6">
								<p><b> Last Name:</b><p>
								<h6 class="text-muted"><%
                                                                        out.println(session.getAttribute("flname"));
                                                                        
                                                                        %></h6>
							</div>
							<div class="col-sm-6">
								<p><b>Membership Type:</b></p>
								<h6 class="text-muted"><%
                                                                        out.println(session.getAttribute("rtype"));
                                                                        
                                                                        %></h6>
							</div>
                                                        
							<div class="col-sm-6">
								<p><b>Phone Number:</b></p>
								<h6 class="text-muted"><%
                                                                        out.println(session.getAttribute("rphone"));
                                                                        
                                                                        %></h6>
							</div>
                                                        <div class="col-sm-6">
								<p><b> Pincode: </b></p>
								<h6 class="text-muted"><%
                                                                        out.println(session.getAttribute("rpincode"));
                                                                        
                                                                        %></h6>
							</div>
							<div class="col-sm-6">
								<p><b>Address:</b></p>
								<h6 class="text-muted"><%
                                                                        out.println(session.getAttribute("raddress"));
                                                                        
                                                                        %></h6>
							</div>
						
						</div>
						
					</div>
				</div>
			
			</div>
		
		</div>
                    
                </div>
                </div>
                <div id="issue" style="display: none;">
                    <div class="d-flex justify-content-center ms-2 me-2 b-radius border border-info rounded-top-3 mb-3" style="background-color:#24a1d4;color: white; ">
                        <h1>Return Issued Books</h1>
                    </div> 
                   <!-- <div class="justify-content-between" id="nb" style="display:flex;">
                        <div>
                        <button type="button" class="btn btn-success ms-4" style="width:200px;" onclick="issbook()">Issue Book</button>
                        </div>
                        
                        <div>
                        <button type="button" style="width:200px;" class="btn btn-danger me-5" data-bs-toggle="modal" data-bs-target="#staticBackdrop2"> Return Book </button>   
                        </div>
                 </div> -->
                    <div class="justify-content-between" id="nnb" style="display:none">
                        <div>
                        <button type="button" class="btn btn-success" style="width:270px;" onclick="Issbook()">View Issued Books</button>
                        </div>
                        <div>
                        <button type="button" style="width:270px;" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop2"> Return Book </button>   
                        </div>
                 </div>
                 <div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="staticBackdropLabel">Return Book</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form class="p-4" action="delissue" method="post">
                                    <div class="row">
                                        <div class="col-4">
                                            <label class="form-label" for="ID">BOOK ID :</label>
                                        </div>
                                        <div class="col-8">
                                         <input type="text" id="ID"name="ID" class="form-control-sm">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-4">
                                            <label class="form-label" for="Name">BOOK NAME :</label>
                                        </div>
                                        <div class="col-8">
                                         <input type="text" id="Name" name="Name" class="form-control-sm">
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-center">
                                        <input type="submit"value="REMOVE" class="form-control-sm">
                                    </div>
                                              
                                </form>
                            </div>
                        
                    </div>
                    </div>
                    </div>
                    <div id="ib" class="m-4 ms-5 me-5 rounded-3 p-3" style="border:2px solid black; display: none;">
                    <div class="row justify-content-center">
                        
                        <div class="col-10">
                            <center><h2 class="m-3">ISSUE BOOK</h2></center>
                             <form action="stud_issue" method="post">
                                 <div class="row">
                                     <div class="col-6">
                                         <div class="form-floating mb-4">
                                            <input class="form-control" type="text"name="bookid" id="fauth" placeholder="Book Id" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fauth">Book Id</label>
                                        </div>
                                        <div class="form-floating mb-4">
                                            <input class="form-control" type="text"name="name" id="fauth" placeholder="Book Name" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fauth">Book Name</label>
                                        </div>
                                        <div class="form-floating mb-4">
                                            <input class="form-control" type="text"name="author" id="fcd" placeholder="Author Name" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fcd">Author Name</label>
                                        </div>
                                        <div class="mb-4">
                                             <select class="form-select" name="category" aria-label="Default select example" style="height:69px; border: none;border-bottom: 2px solid black;background: transparent;font-size: 18px;">
                                                <option value="null">Select Category</option>
                                                <option value="Inter">Inter</option>
                                                <option value="SSC">SSC</option>
                                                <option value="Btech">Btech</option>
                                                <option value="Phd">Phd</option>
                                                <option value="Stories">Stories</option>
                                                <option value="MBBS">MBBS</option>
                                        </select>
                                         </div>
                                     </div>
                                     <div class="col-6">
                                         <div class="form-floating mb-4">
                                            <input class="form-control" type="text"name="sid" id="fud" placeholder="Student Id" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fud">Student Id</label>
                                         </div>
                                        <div class="form-floating mb-4">
                                            <input class="form-control" type="date"name="idate" id="fud" placeholder="Issue Date" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fud" style="margin-left:250px; margin-top:13px;">Issue Date</label>
                                        </div>
                                        <div class="form-floating mb-4">
                                            <input class="form-control" type="text"name="days" id="fud" placeholder="Duration" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fud">Duration</label>
                                        </div>
                                        <div class="form-floating mb-4">
                                            <input class="form-control" type="date"name="rdate" id="fud" placeholder="Return Date" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                            <label for="fud" style="margin-left:245px; margin-top:13px;">Return Date</label>
                                        </div>
                                     </div>
                                 </div>
                                <div class="form-floating mb-4 ms-3">
                                    <button class="btn btn-secondary p-auto" type="submit" style="font-size: 28px;"><b>ISSUE</b></button>
                                </div>
                               </form>
                        </div>   
                    </div>
                    </div>
                    <div class="container" id="bks">
                                <div class="row search-bar">
                                    
                                        <form >
                                            <div class="d-flex justify-content-between">
                                            <div>
                                                <select class="form-select mt-2 mb-5" aria-label="Default select example" style="width:300px;height:50px; "id="categoryDropdown1" onchange="searchBooks1()">
                                                    <option value="">Select a Category</option>
                                                    <option value="kids">kids</option>
                                                    <option value="undergraduate">UnderGraduate</option>
                                                    <option value="graduate">Graduate</option>
                                                    <option value="PG scholars">PG scholars</option>
                                                </select>
                                            </div>
                                               
                                               <div>
                                                    <input  type="search" style="height: 50px;width: 400px;" class="form-control mt-2 mb-5" id="searchInput1" placeholder="BookId or BookName or AuthorName or Genere" aria-label="Text input with dropdown button">
                                               </div>
                                                   <div>
                                                      <button class="btn btn-success mb-5"style="width:100px;" onclick="searchBooks1()">Search</button>
                                                   </div>   
                                            
                                            </div>
                                        </form>
                                  
                                </div>

                             <div id="cardsContainer1" class="row justify-content-around"></div>
                           </div>
                </div>
                <div id="new" style="display: none;">
                        <div class="d-flex justify-content-center ms-3 me-3 rounded-top-3 mb-3" style="background-color:#24a1d4;color: white;">
                        <h1>All Books</h1>
                        </div>
                        <div class="container">
                                <div class="row search-bar">
                                    
                                        <form >
                                            <div class="d-flex justify-content-between">
                                            <div>
                                                <select class="form-select mt-2 mb-5" aria-label="Default select example" style="width:300px;height:50px; "id="categoryDropdown2" onchange="searchBooks()">
                                                    <option value="">Select a Category</option>
                                                    <option value="kids">kids</option>
                                                    <option value="undergraduate">UnderGraduate</option>
                                                    <option value="graduate">Graduate</option>
                                                    <option value="PG scholars">PG scholars</option>
                                                </select>
                                            </div>
                                               
                                               <div>
                                                    <input  type="search" style="height: 50px;width: 400px;" class="form-control mt-2 mb-5" id="searchInput2" placeholder="BookId or BookName or AuthorName or Genere" aria-label="Text input with dropdown button">
                                               </div>
                                                   <div>
                                                      <button class="btn btn-success mb-5"style="width:100px;" onclick="searchBooks()">Search</button>
                                                   </div>   
                                            
                                            </div>
                                        </form>
                                  
                                </div>

                             <div id="cardsContainer2" class="row justify-content-around"></div>
                           </div>
                    
                </div>
                
                
                <div id="pass" style="display: none;">
                    <div class="d-flex justify-content-center ms-3 me-3 rounded-top-3 mb-3" style="background-color:#24a1d4;color: white;">
                        <h1>Change Password</h1>
                        </div>
                    <div class="m-4 ms-5 me-5 p-3 rounded-3" style="border:2px solid black;">
                    <div class="row justify-content-center">
                        
                        <div class="col-6">
                            <center><h2>CHANGE PASSWORD</h2></center>
                             <form action="forgot" method="post">
                                <div class="form-floating mb-4">
                                        <input class="form-control" type="text" id="fcd"name="mobile" placeholder="Mobile" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                        <label for="fcd">Mobile</label>
                                </div>
                                 <div class="form-floating mb-4">
                                        <input class="form-control" type="email" id="fcd"name="email" placeholder="Email" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                        <label for="fcd">Email</label>
                                </div>
                                 <div class="form-floating mb-4">
                                        <input class="form-control" type="password" id="fauth"name="password" placeholder="New Password" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                        <label for="fauth">New Password</label>
                                </div>
                                 <div class="form-floating mb-4">
                                        <input class="form-control" type="password" id="fauth" placeholder="Confirm Password" Style="height:69px;background: transparent;border: none; border-bottom: 2px solid black;">
                                        <label for="fauth">Confirm Password</label>
                                </div>
                                
                                <div class="form-floating mb-4 d-flex justify-content-center">
                                    <button class="btn btn-secondary p-auto"type="submit" style="font-size: 28px;"><b>CHANGE</b></button>
                                </div>
                               </form>
                        </div>   
                    </div>
                    </div>
                </div>   
            </div>
        </div>
        <script>
            
               
        searchBooksByCategory('');
           
            var das=document.getElementById("das");
            var issue=document.getElementById("issue");
            var student=document.getElementById("student");
            var New=document.getElementById("new");
            var pass=document.getElementById("pass");

            var dash=document.getElementById("dash");
            var book=document.getElementById("book");
            var Iss=document.getElementById("Iss");
            var Stud=document.getElementById("Stud");
            var cpass=document.getElementById("cpass");
            dash.addEventListener('click',e=>{
                das.style.display="grid";
                issue.style.display="none";
                student.style.display="none";
                New.style.display="none";
                pass.style.display="none";
            });
            book.addEventListener('click',e=>{
                das.style.display="none";
                issue.style.display="none";
                student.style.display="none";
                New.style.display="grid";
                pass.style.display="none";
            });
            Iss.addEventListener('click',e=>{
                das.style.display="none";
                issue.style.display="grid";
                student.style.display="none";
                New.style.display="none";
                pass.style.display="none";
            });
            Stud.addEventListener('click',e=>{
                das.style.display="none";
                issue.style.display="none";
                student.style.display="grid";
                New.style.display="none";
                pass.style.display="none";
            });
            cpass.addEventListener('click',e=>{
                das.style.display="none";
                issue.style.display="none";
                student.style.display="none";
                New.style.display="none";
                pass.style.display="grid";
            });
            
            fetch('ibookcards')
            .then(response => response.text())
            .then(data => {
                document.getElementById('cardsContainer1').innerHTML = data;
            })
            .catch(error => console.error('Error fetching data:', error));

        // Function to handle book search
        function searchBooks1() {
            event.preventDefault();
            var searchTerm = document.getElementById('searchInput1').value;
            var category = document.getElementById('categoryDropdown1').value;

            // Fetch book data with search term and category from the servlet
            fetch('ibookcards?search=' + searchTerm + '&category=' + category)
                .then(response => response.text())
                .then(data => {
                    document.getElementById('cardsContainer1').innerHTML = data;
                })
                .catch(error => console.error('Error fetching data:', error));
        }
        function searchBooksByCategory1(category){
            fetch('ibookcards?category='+category)
                    .then(response=>response.text())
                    .then(data=>{
                        document.getElementById('cardsContainer1').innerHTML=data;
            })
                    .catch(error=>console.error('Error fetchong data: ',error))
        }
        
        
        
        fetch('allbooks')
            .then(response => response.text())
            .then(data => {
                document.getElementById('cardsContainer2').innerHTML = data;
            })
            .catch(error => console.error('Error fetching data:', error));

        // Function to handle book search
        function searchBooks() {
            event.preventDefault();
            var searchTerm = document.getElementById('searchInput2').value;
            var category = document.getElementById('categoryDropdown2').value;

            // Fetch book data with search term and category from the servlet
            fetch('allbooks?search=' + searchTerm + '&category=' + category)
                .then(response => response.text())
                .then(data => {
                    document.getElementById('cardsContainer2').innerHTML = data;
                })
                .catch(error => console.error('Error fetching data:', error));
        }
        function searchBooksByCategory(category){
            fetch('allbooks?category='+category)
                    .then(response=>response.text())
                    .then(data=>{
                        document.getElementById('cardsContainer2').innerHTML=data;
            })
                    .catch(error=>console.error('Error fetchong data: ',error))
        }
         function issbook(){
             event.preventDefault();
             document.getElementById("nb").style.display="none";
             document.getElementById("nnb").style.display="flex";
             document.getElementById("bks").style.display="none";
             document.getElementById("ib").style.display="grid";
         }
         function Issbook(){
             event.preventDefault();
             document.getElementById("nnb").style.display="none";
             document.getElementById("nb").style.display="flex";
             document.getElementById("bks").style.display="grid";
             document.getElementById("ib").style.display="none";
         }
            
        </script>
    </body>
</html>
