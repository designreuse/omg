package com.omg.dao;

import java.util.*;

import com.omg.dto.*;

public interface TechDAO {
	List<Techs> selectTechs();
	String techIdByName(String techName);
	int jem(String techName);
	
}