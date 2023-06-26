package com.aplication.model;

public class Notes {
	private int note_id;
	private String uid;
	private String note;
	private String date;

	public Notes() {
		super();
	}

	public Notes(int note_id, String uid, String note, String date, int priority) {
		super();
		this.note_id = note_id;
		this.uid = uid;
		this.note = note;
		this.date = date;
	}

	public int getNoteId() {
		return note_id;
	}

	public void setNoteId(int note_id) {
		this.note_id = note_id;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Notes [note_id=" + note_id + ", uid=" + uid + ", note=" + note + ", date=" + date + "]";
	}

}
