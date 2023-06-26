package com.aplication.config;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.aplication.model.Notes;

public class Dao {
	public static boolean saveUser(String uid, String username, String password) {
		Connection con = Config.getConnection();
		try {
			PreparedStatement query = con.prepareStatement("INSERT INTO users values(?, ?, ?)");
			query.setString(1, uid);
			query.setString(2, username);
			query.setString(3, password);
			int result = query.executeUpdate();
			return true;
		} catch (SQLException sex) {
			sex.printStackTrace();
		}

		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public static boolean verifyUser(String username, String password) {
		Connection con = Config.getConnection();
		try {
			PreparedStatement query = con.prepareStatement("SELECT * FROM users WHERE uname=? AND upass=?");
			query.setString(1, username);
			query.setString(2, password);

			ResultSet rs = query.executeQuery();
			int count_Row = rowCountOfResultSet(rs);
			if (count_Row > 0) {
				return true;
			}
			return false;
		} catch (SQLException sex) {
			sex.printStackTrace();
		}

		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}

	public static String getUID(String username, String password) {
		String UID = "";
		Connection con = Config.getConnection();
		try {
			PreparedStatement query = con.prepareStatement("SELECT UID FROM users WHERE uname=? AND upass=?");
			query.setString(1, username);
			query.setString(2, password);

			ResultSet rs = query.executeQuery();
			while (rs.next()) {
				UID = rs.getString("uid");
				System.out.println(UID);
			}
			return UID;
		} catch (SQLException sex) {
			sex.printStackTrace();
		}

		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

	public static boolean saveNote(String uid, String note, String cdate) {
		Connection con = Config.getConnection();
		try {
			PreparedStatement query = con.prepareStatement("INSERT INTO notes(uid, note, c_date) values(?, ?, ?)");
			query.setString(1, uid);
			query.setString(2, note);
			query.setString(3, cdate);
			int result = query.executeUpdate();
			return true;
		} catch (SQLException sex) {
			sex.printStackTrace();
		}

		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public static boolean updateNote(String nid, String note, String cDate) {
		Connection con = Config.getConnection();
		try {
			PreparedStatement query = con.prepareStatement("UPDATE notes SET note=?, c_date=? WHERE note_id=?");
			query.setString(1, note);
			query.setString(2, cDate);
			query.setInt(3, Integer.parseInt(nid));
			System.out.println(query);
			int result = query.executeUpdate();
			return true;
		} catch (SQLException sex) {
			sex.printStackTrace();
		}

		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public static boolean deleteNoteByNoteId(int note_id) {
		Connection con = Config.getConnection();
		try {
			PreparedStatement query = con.prepareStatement("DELETE FROM notes WHERE note_id=?");
			query.setInt(1, note_id);
			int result = query.executeUpdate();
			return true;
		} catch (SQLException sex) {
			sex.printStackTrace();
		}

		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public static ArrayList<Notes> getAllNotesByUid(String uid) {
		Connection con = Config.getConnection();
		try {
			PreparedStatement query = con.prepareStatement("SELECT * FROM notes WHERE uid=?");
			query.setString(1, uid);
			ResultSet rs = query.executeQuery();
			ArrayList<Notes> notes = convertNoteToArray(rs);
			return notes;
		} catch (SQLException sex) {
			sex.printStackTrace();
		}

		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static int rowCountOfResultSet(ResultSet rs) throws SQLException {
		int i = 0;
		while (rs.next()) {
			i++;
		}
		return i;
	}

	public static ArrayList<Notes> convertNoteToArray(ResultSet rs) throws SQLException {
		ArrayList<Notes> list = new ArrayList<Notes>();
		while (rs.next()) {
			Notes note = new Notes();
			note.setNoteId(rs.getInt("note_id"));
			note.setUid(rs.getString("uid"));
			note.setNote(rs.getString("note"));
			note.setDate(rs.getString("c_date"));

			list.add(note);
		}
		return list;
	}

}
