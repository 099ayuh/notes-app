<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.aplication.model.Notes" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="public/style.css">
</head>
<%
	ArrayList<Notes> notes = (ArrayList<Notes>) request.getAttribute("notes");
%>
<body>
    <div class="container">
        <header class="navbar">
            <div class="profile_icon">
                <span class="fa-solid fa-user"></span>
                <p><%= session.getAttribute("username") %></p>
            </div>
            <form class="add-note">
                <button onclick="addNote()" type="button" id="note-add"><span class="fa-solid fa-pencil-alt"></span> Add
                    note</button>
                <button type="submit" id="logout" formaction="logout" formmethod="post"><span
                        class="fa-solid fa-right-from-bracket" style="font-size: 20px;"></span></button>
            </form>
        </header>

        <main class="notes-container">
            <div class="inner-container">
            	<% if(notes != null && !notes.isEmpty()) { %>
            		<% for(Notes note : notes) { %>
            			<form class="note">
            				<input type="number" name="note_id" value="<%= note.getNoteId() %>" hidden>
            				<p id="creation_date" title="creation date"><%= note.getDate() %></p>
		                    <button class="edit-btn" type="button" onclick="editNote('<%= note.getNoteId() %>')"><span class="fas fa-pencil-square" style="color: #cc55a2;"></span></button>
		                    <button type="submit" formaction="delete" formmethod="post" class="delete-btn" type="button"><span class="fas fa-trash-can-arrow-up"
		                            style="color: #fff; background: #e63c3c;"></span></button>
		                    <div id="display-note" class="ele_<%= note.getNoteId() %>">
		                   		<%= note.getNote() %>
		                   	</div>
		                </form>
            		<% } %>
            	<% } else { %>
            		<div style="display: flex; align-items:center; gap: 20px;">
            			<img width="48" height="48" src="https://img.icons8.com/color/48/opened-folder.png" alt="opened-folder"/>
            			<h1>No Notes Found</h1>
            		</div>
            	<% } %>                
            </div>
        </main>

        <div class="modal hidden">
            <div class="inner-wrapper">
                <div class="top-buttons">
                    <form class="save" action="save" method="post" onsubmit="saveData(event)">
                    	<input type="text" name="uid" value="<%= session.getAttribute("uid") %>" hidden>
                    	<input type="text" name="note" id="hidden-data" hidden>
                    	<button id="save" type="submit"><span class="fas fa-save"></span></button>
                    </form>
                    <form class="hidden edit" action="edit" method="post" onsubmit="saveData2(event)">
                    	<input type="text" name="nid" value="" id="nid" hidden>
                    	<input type="text" name="note" id="hidden-data2" hidden>
                    	<button id="save" type="submit"><span class="fas fa-save"></span></button>
                    </form>
                    <div class="exclusive-btns">
                        <button id="bold" onclick="makeBold()"><b>B</b></button>
                        <button id="underline" onclick="makeUnderline()"><u>U</u></button>
                        <button id="itallic" onclick="makeItallic()"><em>I</em></button>
                        <button id="bullet" onclick="toggleOl()">
                            <span class="fa-solid fa-list-ol"></span>
                        </button>
                        <button id="bullet" onclick="toggleUl()">
                            <span class="fa-solid fa-list-dots"></span>
                        </button>
                        <button id="color">
                            <label for="text-color" id="text-A">A</label>
                            <input type="color" id="text-color" onchange="changeFontColor()">
                        </button>
                        <button id="bullet" onclick="redo()">
                            <span class="fa-solid fa-redo-alt"></span>
                        </button>
                        <button id="bullet" onclick="undo()">
                            <span class="fa-solid fa-undo-alt"></span>
                        </button>
                    </div>
                    <button id="cancle" onclick="addNote()"><span class="fas fa-multiply"></span></button>
                </div>
                <div class="text-area">
                    <div class="input-area" id="note-data" contenteditable="true"></div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
	let updateStatus = false;
    let modal = document.querySelector('.modal');
    let note_data = document.getElementById('note-data');
    let hidden_data = document.getElementById('hidden-data');
    let hidden_data2 = document.getElementById('hidden-data2');
    let editedSave_btn = document.querySelector(".edit")
    let Save_btn = document.querySelector(".save")
    let isUlToggled = false;
    const addNote = () => {
    	if(updateStatus) {
    		Save_btn.classList.remove("hidden");
        	editedSave_btn.classList.add("hidden")
    	}
        modal.classList.toggle('hidden');
    }

    // exclusive options
    function makeBold() {
        document.execCommand("bold", false, null);
    }

    function makeUnderline() {
        document.execCommand("underline", false, null);
    }

    function makeItallic() {
        document.execCommand("italic", false, null);
    }

    function toggleUl() {
        console.log(isUlToggled)
        if (isUlToggled === false) {
            document.execCommand('indent', false, null);
            document.execCommand("insertUnorderedList", false, null)
            isUlToggled = true;
        } else {
            isUlToggled = false;
            document.execCommand('undo', false, null);
            document.execCommand('undo', false, null);
        }
    }

    function toggleOl() {
        console.log(isUlToggled)
        if (isUlToggled === false) {
            document.execCommand('indent', false, null);
            document.execCommand("insertOrderedList", false, null)
            isUlToggled = true;
        } else {
            isUlToggled = false;
            document.execCommand('undo', false, null);
            document.execCommand('undo', false, null);
        }
    }
    
    function changeFontColor() {
        let color = document.getElementById("text-color").value;
        console.log(color)
        document.getElementById('text-A').style.color = ""+color;
        document.execCommand("foreColor", false, color);
    }
    
    function redo () {
        isUlToggled = false;
        document.execCommand("redo", false, null);
    }
    
    function undo () {
        isUlToggled = false;
        document.execCommand("undo", false, null);
    }
    
    function saveData(event) {
    	event.preventDefault();
    	// console.log(note_data.innerHTML);
    	hidden_data.value = note_data.innerHTML;
    	// console.log(hidden_data.value);
    	event.target.submit();
    }
    
    function saveData2(event) {
    	event.preventDefault();
    	// console.log(note_data.innerHTML);
    	hidden_data2.value = note_data.innerHTML;
    	console.log(hidden_data2.value);
    	event.target.submit();
    }
    
    function editNote(id_ele) {
    	let data = document.querySelector(".ele_" + id_ele + "");
    	console.log(data);
    	Save_btn.classList.add("hidden");
    	document.getElementById("nid").value = id_ele;
    	editedSave_btn.classList.remove("hidden")
    	note_data.innerHTML = data.innerHTML;
    	addNote();
    	updateStatus = true;
    }

    // setInterval(() => {
    //     console.log(note_data.innerHTML);
    // }, 1000);
</script>
</html>